//
//  Protocol.swift
//  TableViewController
//
//  Created by 민지은 on 2024/01/15.
//

import UIKit

protocol ReusableProtocol {
    static var identifier: String { get }
}

extension UITableViewCell {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UICollectionViewCell {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UIViewController: ReusableProtocol {
    static var identifier: String {
        return String(describing: self)
    }
}


