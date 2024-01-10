//
//  MagazineTableViewCell.swift
//  TableViewController
//
//  Created by 민지은 on 2024/01/08.
//

import UIKit

class MagazineTableViewCell: UITableViewCell {

    @IBOutlet var travelImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    override func awakeFromNib() {

        travelImage.setMagazineImage()

        titleLabel.setMagazineTitleLabel()
        subtitleLabel.setMagazineSubTitleLabel()

        dateLabel.setDateLabel()
    }
    
}

