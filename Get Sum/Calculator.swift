import Foundation

struct Calculator{
    var prevVal: String = ""
    var newVal: String = ""
    var resultVal: String = ""
    var mathOperator: String = ""
    var decimalClicked: Bool = false
    
    // Receives the number clicked, checks if we already have a
    // value to add it to, checks for repeating decimals,
    // handles any issues, adds the new number to the end
    // and then returns that value
    mutating func numberButtonClicked(_ num: String) -> String{
        // Check for an empty string
        if(!resultVal.isEmpty){
            // Start a new number
            self.newVal = num
            // Reset to create a new result
            self.resultVal = ""
        } else {
            // Used to block using multiple decimals
            if(num == "."){
                if (self.decimalClicked != true){
                    self.newVal += num
                    self.decimalClicked = true
                }
            } else {
                self.newVal += num
            }
        }
        return self.newVal
    }
    
    mutating func mathButtonClicked(_ mathOperator: String) -> String{
        // Check if there was a previous calculation by seeing if
        // resultVal has a value
        if(resultVal.isEmpty){
            
            // If result doesn't have a value then store current
            // value as previous for the next calculation
            self.prevVal = self.newVal
        } else {
            
            // If there is a current result store that as the previous
            self.prevVal = self.resultVal
        }
        
        // Restart creation of a new number
        self.newVal = ""
        self.decimalClicked = false
        self.mathOperator = mathOperator
        self.resultVal = ""
        return ""
    }
    
    mutating func equalButtonPressed() -> String{
        
        // Reset decimal click
        self.decimalClicked = false
        
        // Convert values to Double so we can perform calculations
        let prevValDbl = Double(self.prevVal)
        let newValDbl = Double(self.newVal)
        switch(self.mathOperator){
        case "+":
            self.resultVal = String(format: "%f", (prevValDbl! + newValDbl!))
        case "-":
            self.resultVal = String(format: "%f", (prevValDbl! - newValDbl!))
        case "x":
            self.resultVal = String(format: "%f", (prevValDbl! * newValDbl!))
        case "/":
            self.resultVal = String(format: "%f", (prevValDbl! / newValDbl!))
        default:
            // If equals is hit without an operator leave everything
            // as is
            self.resultVal = self.newVal
        }
        
        // Put the new result in the calculator input label
        self.prevVal = self.resultVal
        return self.resultVal
    }
    
    // Reset everything
    mutating func clearButtonPressed() -> String{
        self.prevVal = ""
        self.newVal = ""
        self.resultVal = ""
        self.mathOperator = ""
        self.decimalClicked = false
        return "0"
    }
    
    // Converts current value in input label to its negative version
    mutating func signButtonClicked(_ currentVal: String) -> String{
        // If current value is 0 return 0
        if currentVal == "0" || currentVal == "0.00" {
            return "0"
        } else {
            // Convert the current value to a double, multiply by -1
            // and return that result to be displayed in the input label
            let resultValDbl: Double = Double(currentVal)!
            let reversedVal: Double = resultValDbl * -1.0
            self.resultVal = String(format: "%.2f", reversedVal)
            return self.resultVal
        }
    }
    
    mutating func percentButtonClicked(_ currentVal: String) -> String{
        // If current value is 0 return 0
        if currentVal == "0" || currentVal == "0.00" {
            return "0"
        } else {
            // Convert the current value to a double, multiply by .01
            // and return that result to be displayed in the input label
            let resultValDbl: Double = Double(currentVal)!
            let percentVal: Double = resultValDbl * 0.01
            self.resultVal = String(format: "%.2f", percentVal)
            return self.resultVal
        }
    }
}
