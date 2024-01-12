//
//  ChatDetailGroupTableViewCell.swift
//  TableViewController
//
//  Created by 민지은 on 2024/01/12.
//

import UIKit

class ChatDetailGroupTableViewCell: UITableViewCell {

    @IBOutlet var chatUserImages: [UIImageView]!
    @IBOutlet var chatNameLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var chatLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        chatNameLabel.font = .boldSystemFont(ofSize: 15)
        
        chatLabel.font = .systemFont(ofSize: 13, weight: .semibold)
        chatLabel.textColor = .lightGray
        
        dateLabel.font = .systemFont(ofSize: 12, weight: .regular)
        dateLabel.textColor = .lightGray
    }

    
}
