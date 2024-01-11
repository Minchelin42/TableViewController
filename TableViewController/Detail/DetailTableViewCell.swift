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
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
