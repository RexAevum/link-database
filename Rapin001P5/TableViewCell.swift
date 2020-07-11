//
//  TableViewCell.swift
//  Rapin001P5
//
//  Created by Rolans Apinis on 7/11/20.
//  Copyright © 2020 Rolans Apinis. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell, UITextFieldDelegate {
    

    
    @IBOutlet var pinField: UITextField!
    @IBOutlet var urlField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        pinField.text = ""
        urlField.text = ""

        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
 

}
