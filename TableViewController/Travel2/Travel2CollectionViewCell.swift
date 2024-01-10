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

        cityImage.setCityImage()
        cityLabel.setCityLabel()
        cityListLabel.setCityListLabel()

    }
}

