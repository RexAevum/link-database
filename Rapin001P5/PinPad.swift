//  PROGRAMMER: Rolans Apinis
//  PANTHERID: 6044121
//  CLASS: COP 465501 TR 5:00
//  INSTRUCTOR: Steve Luis ECS 282
//  ASSIGNMENT: Programming Assignment #4
//  DUE: Thursday 07/05/2020 //

import UIKit

class PinPad: UIViewController, UITabBarDelegate {
    
    //MARK: Pin Field Link
    
    @IBOutlet var digit_1: UILabel!
    
    @IBOutlet var digit_2: UILabel!
    
    @IBOutlet var digit_3: UILabel!
    
    @IBOutlet var digit_4: UILabel!
    
    //MARK: Pin Buttons Collection Link
    
    @IBOutlet var buttons: [UIButton]!
    
    
    //MARK: Other Variables
    @IBOutlet var pinFailed: UILabel!
    var enteredPin: String = ""
    fileprivate let PLACE_HOLDER = "-"
    fileprivate let PIN_LENGHT = 4
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        pinFailed.alpha = 0
        pinFailed.text = "Unknown PIN"
        pinFailed.backgroundColor = .red
        pinFailed.textColor = .black
        clearAllPinDigits()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        switch segue.identifier {
        case "loadPage"?:
            
            // pass pin
            let browserView = segue.destination as! BrowserViewController
            browserView.passedPin = enteredPin
            //use segue.destination to set the variables on the other side
            break
        default:
            preconditionFailure("unknown segue")
        }
    }
 
    
    //MARK: Custom Functions
    
    @IBAction func press(_ sender: UIButton) {
        let buttonValue = sender.tag
        setDigits(givenDigit: buttonValue)
        
        
    }
    // cleare button that will be replaced with action later on once the DB is in place
    @IBAction func clear(_ sender: UIButton) {
        clearAllPinDigits()
    }
    
    /*
     set's the appropriate digit
 */
   @discardableResult func setDigits(givenDigit: Int) -> Bool? {
        pinFailed.alpha = 0
        if (digit_1.text == PLACE_HOLDER){
            digit_1.text = String(givenDigit)
            
            if (enteredPin.count <= PIN_LENGHT){
                enteredPin += String(givenDigit)
            }
            return true
        }
        else if (digit_2.text == PLACE_HOLDER){
            digit_2.text = String(givenDigit)
            
            if (enteredPin.count < PIN_LENGHT){
                enteredPin += String(givenDigit)
            }
            return true
        }
        else if (digit_3.text == PLACE_HOLDER){
            digit_3.text = String(givenDigit)
            if (enteredPin.count < PIN_LENGHT){
                enteredPin += String(givenDigit)
            }
            return true
        }
        else if (digit_4.text == PLACE_HOLDER){
            digit_4.text = String(givenDigit)
            if (enteredPin.count < PIN_LENGHT){
                enteredPin += String(givenDigit)
            }
            //MARK: chenge view in bar controller
            if (PinDatabase.sharedInstance.pairDatabase[enteredPin] != nil){
                PinDatabase.sharedInstance.lastPin = enteredPin
                tabBarController?.selectedIndex = 1
                clearAllPinDigits()
            }
            else{
                // add alert for when code is wrong
                let title = "Pin not found!"
                let message = "The code you have entered does not have a corresponding website assoiciated with it."
                let alertControl = UIAlertController(title: title, message: message, preferredStyle: .alert)
                let alertOk = UIAlertAction(title: "OK", style: .cancel, handler: {(action) -> Void in
                    self.clearAllPinDigits()
                })
                alertControl.addAction(alertOk)
                present(alertControl, animated: true, completion: nil)
                
                
                
            }
            return true
        }
        // all digits have been set, ignore the input
        return false
    }
    
    
    fileprivate func clearAllPinDigits() {
       //sleep(5)
        print(enteredPin)
        digit_1.text = PLACE_HOLDER
        digit_2.text = PLACE_HOLDER
        digit_3.text = PLACE_HOLDER
        digit_4.text = PLACE_HOLDER
        enteredPin = ""
    }
    

}
