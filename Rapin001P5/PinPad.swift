//
//  PinPad.swift
//  Rapin001P5
//
//  Created by Rolans Apinis on 7/7/20.
//  Copyright © 2020 Rolans Apinis. All rights reserved.
//

import UIKit

class PinPad: UIViewController {
    
    //MARK: Pin Field Link
    
    @IBOutlet var digit_1: UILabel!
    
    @IBOutlet var digit_2: UILabel!
    
    @IBOutlet var digit_3: UILabel!
    
    @IBOutlet var digit_4: UILabel!
    
    //MARK: Pin Buttons Collection Link
    
    @IBOutlet var buttons: [UIButton]!
    
    
    //MARK: Other Variables
    var enteredPin: String = ""
    fileprivate let PLACE_HOLDER = "-"
    fileprivate let PIN_LENGHT = 4
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        clearAllPinDigits()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
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
