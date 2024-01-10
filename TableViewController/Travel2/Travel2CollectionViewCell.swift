//
//  Travel2CollectionViewCell.swift
//  TableViewController
//
//  Created by 민지은 on 2024/01/09.
//

import UIKit

class Travel2CollectionViewCell: UICollectionViewCell {

    
    @IBOutlet var cityImage: UIImageView!
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var cityListLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        cityImage.contentMode = .scaleAspectFill

        cityLabel.font = .systemFont(ofSize: 15, weight: .bold)
        cityLabel.textAlignment = .center
        cityLabel.numberOfLines = 0

        cityListLabel.font = .systemFont(ofSize: 12, weight: .semibold)
        cityListLabel.textColor = .lightGray
        cityListLabel.textAlignment = .center
        cityListLabel.numberOfLines = 0
    }
}
