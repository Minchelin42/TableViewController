//
//  TravelExtension.swift
//  TableViewController
//
//  Created by 민지은 on 2024/01/10.
//

import UIKit

extension UIImageView {
    func setCityImage() {
        self.contentMode = .scaleAspectFill
        DispatchQueue.main.async {
            self.layer.cornerRadius = self.frame.width / 2
        }
    }
}

extension UILabel {
    func setCityLabel() {
        self.font = .systemFont(ofSize: 15, weight: .bold)
        self.textAlignment = .center
        self.numberOfLines = 0
    }
    
    func setCityListLabel() {
        self.font = .systemFont(ofSize: 12, weight: .semibold)
        self.textColor = .lightGray
        self.textAlignment = .center
        self.numberOfLines = 0
    }
}
