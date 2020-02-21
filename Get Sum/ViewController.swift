import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var numberLabel: UILabel!
    
    // Struct with our data and functions for
    // working with that data
    var calculator = Calculator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func clearClicked(_ sender: UIButton) {
        numberLabel.text = calculator.clearButtonPressed()
    }
    @IBAction func numberClicked(_ sender: UIButton) {
        numberLabel.text = calculator.numberButtonClicked( sender.currentTitle!)
        print(sender.currentTitle!)
    }
    @IBAction func signClicked(_ sender: UIButton) {
        numberLabel.text = calculator.signButtonClicked(numberLabel.text ?? "0")
    }
    @IBAction func percentClicked(_ sender: UIButton) {
        numberLabel.text = calculator.percentButtonClicked(numberLabel.text ?? "0")
    }
    @IBAction func mathButtonClicked(_ sender: UIButton) {
        numberLabel.text = calculator.mathButtonClicked(sender.currentTitle!)
        print(sender.currentTitle!)
    }
    @IBAction func equalClicked(_ sender: UIButton) {
        numberLabel.text = calculator.equalButtonPressed()
    }
    
}

