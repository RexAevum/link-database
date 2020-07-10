//
//  PinDatabase.swift
//  Rapin001P5
//
//  Created by Rolans Apinis on 7/9/20.
//  Copyright © 2020 Rolans Apinis. All rights reserved.
//

import Foundation
import UIKit

class PinDatabase{
    // create only one instance
    static let sharedInstance = PinDatabase()
    
    // database
    var pinIndex: [String]!
    var pairDatabase: [String : URL]!
    
    private init() {
        pairDatabase = [:]
        pinIndex = []
        
        pinIndex[0] = "0000"
        pairDatabase["0000"] = URL(string: "https://www.apple.com")
    }
    
    //add function to add item to the DB
    @discardableResult func addPair(pin: String!, url: URL!) -> Int {
        // add to dictionry
        pairDatabase[pin] = url
        
        //add pin to collection for table view
        pinIndex.append(pin)
        let newIndex = pinIndex.index(of: pin)!
        return newIndex
    }
    
    //add function to delete item
    func deletePair(index: Int) -> () {
        let pin = pinIndex[index]
        
        pairDatabase.removeValue(forKey: pin)
        
        pinIndex.remove(at: index)
    }
    
    //add function to move item
    
    //add function to load URL
    func loadPinPage(pin: String) -> () {
        // find url from db
        let url = pairDatabase[pin]
        //create url request
        let request = URLRequest(url: url!)
        //segue to BrowserViewController
        
    }
    
    
}
