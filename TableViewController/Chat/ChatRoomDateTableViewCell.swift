//
//  ChatRoomDateTableViewCell.swift
//  TableViewController
//
//  Created by 민지은 on 2024/01/15.
//

import UIKit

class ChatRoomDateTableViewCell: UITableViewCell {
    
    @IBOutlet var dateLine: UIView!
    @IBOutlet var newDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        newDateLabel.backgroundColor = UIColor(named: "buttonGray")
        newDateLabel.clipsToBounds = true
        newDateLabel.layer.cornerRadius = 5
        newDateLabel.textAlignment = .center
        newDateLabel.font = .systemFont(ofSize: 11)
        
        dateLine.backgroundColor = UIColor(named: "buttonGray")
    }

}
