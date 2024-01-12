//
//  ChatDetailUserTableViewCell.swift
//  TableViewController
//
//  Created by 민지은 on 2024/01/12.
//

import UIKit

class ChatDetailUserTableViewCell: UITableViewCell {

    @IBOutlet var userChatLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var chatView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        userChatLabel.font = .systemFont(ofSize: 14, weight: .regular)
        userChatLabel.numberOfLines = 0
        dateLabel.font = .systemFont(ofSize: 12, weight: .medium)
        dateLabel.textColor = .gray
        
        chatView.layer.borderWidth = 1
        chatView.layer.borderColor = UIColor.lightGray.cgColor
        chatView.layer.cornerRadius = chatView.frame.width * 0.2
        chatView.backgroundColor = UIColor(named: "buttonGray")
        
   
    }

}
