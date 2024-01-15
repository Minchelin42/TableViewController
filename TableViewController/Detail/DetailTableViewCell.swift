//
//  DetailTableViewCell.swift
//  TableViewController
//
//  Created by 민지은 on 2024/01/11.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    
    @IBOutlet var heartButton: UIButton!
    @IBOutlet var travelImage: UIImageView!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var gradeLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var starImage: [UIImageView]!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        travelImage.contentMode = .scaleAspectFill
        travelImage.layer.cornerRadius = 10
        
        titleLabel.font = .boldSystemFont(ofSize: 15)
        
        descriptionLabel.font = .systemFont(ofSize: 13, weight: .semibold)
        descriptionLabel.textColor = .gray
        descriptionLabel.numberOfLines = 0
 
        gradeLabel.font = .systemFont(ofSize: 13, weight: .regular)
        gradeLabel.textColor = .lightGray
        gradeLabel.backgroundColor = .clear
        
        heartButton.setImage(UIImage(systemName: "heart"), for: .normal)
        heartButton.tintColor = .white
    

    }
    
}
