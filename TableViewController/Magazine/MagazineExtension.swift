//
//  MagazineExtension.swift
//  TableViewController
//
//  Created by 민지은 on 2024/01/10.
//

import UIKit

extension UIImageView {
    func setMagazineImage() {
        self.contentMode = .scaleAspectFill
        self.layer.cornerRadius = 20
    }
}

extension UILabel {
    func setMagazineTitleLabel() {
        self.font = .systemFont(ofSize: 23, weight: .black)
        self.numberOfLines = 0
    }
    
    func setMagazineSubTitleLabel() {
        self.textColor = .lightGray
        self.font = .boldSystemFont(ofSize: 15)
    }
    
    func setDateLabel() {
        self.textColor = .lightGray
        self.font = .boldSystemFont(ofSize: 14)
    }
}
