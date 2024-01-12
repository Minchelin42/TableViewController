//
//  ChatTableViewCell.swift
//  TableViewController
//
//  Created by 민지은 on 2024/01/12.
//

import UIKit

class ChatTableViewCell: UITableViewCell {

    @IBOutlet var userImage: UIImageView!
    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var userChatLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super .awakeFromNib()
        
        userImage.image = UIImage(systemName: "heart")
        userImage.setImageCircle()
        
        userNameLabel.font = .boldSystemFont(ofSize: 15)
        
        userChatLabel.font = .systemFont(ofSize: 13, weight: .semibold)
        userChatLabel.textColor = .lightGray
        
        dateLabel.font = .systemFont(ofSize: 12, weight: .regular)
        dateLabel.textColor = .lightGray

    }
    
}
