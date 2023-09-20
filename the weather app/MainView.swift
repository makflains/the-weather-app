//
//  MainView.swift
//  the weather app
//
//  Created by сииас on 19/09/2023.
//

import Foundation
import UIKit

class MainView:UIView {
    var tableView = UITableView()
    override func awakeFromNib() {
        super.awakeFromNib()
        self.FirstInitialization()
        self.setupConstraints()
    }
    
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    fileprivate func FirstInitialization(){
        
        self.addSubview(tableView)
        self.tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil),
                                forCellReuseIdentifier: "CustomTableViewCell")
    }
    
    fileprivate func setupConstraints(){
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        self.tableView.rightAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        self.tableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}
