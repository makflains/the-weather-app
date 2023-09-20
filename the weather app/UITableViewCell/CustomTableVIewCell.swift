//
//  CustomTableVIewCell.swift
//  the weather app
//
//  Created by сииас on 19/09/2023.
//

import Foundation
import UIKit

class CustomTableViewCell:UITableViewCell{
   
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var tempMinLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var tempMaxLabel: UILabel!
    override var reuseIdentifier: String? {
        return "CustomTableVIewCell"
    }
}
