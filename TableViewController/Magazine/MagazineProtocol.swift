//
//  MagazineProtocol.swift
//  TableViewController
//
//  Created by 민지은 on 2024/01/10.
//

import Foundation

protocol MagazineViewProtocol {
    var navigationTitleString: String { get set }
    var tableCellHeight: CGFloat { get set }
    func changeDateStyle(date: String) -> String
}
