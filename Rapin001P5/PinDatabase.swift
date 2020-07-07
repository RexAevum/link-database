//
//  PinDatabase.swift
//  Rapin001P5
//
//  Created by Rolans Apinis on 7/7/20.
//  Copyright © 2020 Rolans Apinis. All rights reserved.
//

import Foundation

final class PinDatabase{
    // make sure only one instance
    static let sharedInstance = PinDatabase()
    
    //database
    var cache: NSCache<String, URL>
    
    init() {
        //add initialisation for objects
        cache = NSCache<String, URL>()
    }
    
    
    
}
