//
//  ChatDetailFriendTableViewCell.swift
//  TableViewController
//
//  Created by 민지은 on 2024/01/12.
//

import UIKit

class ChatDetailFriendTableViewCell: UITableViewCell {

    
    @IBOutlet var friendImage: UIImageView!
    @IBOutlet var friendName: UILabel!
    @IBOutlet var friendChat: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    @IBOutlet var chatView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        friendImage.setImageCircle()
        friendName.font = .boldSystemFont(ofSize: 14)
        friendChat.font = .systemFont(ofSize: 14, weight: .regular)
        friendChat.numberOfLines = 0
        dateLabel.font = .systemFont(ofSize: 12, weight: .medium)
        dateLabel.textColor = .lightGray
        
        chatView.layer.borderWidth = 1
        chatView.layer.borderColor = UIColor.gray.cgColor
        chatView.layer.cornerRadius = chatView.frame.width * 0.2
        
        
        
    }
    
}
