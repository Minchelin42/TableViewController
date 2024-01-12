//
//  ADTableViewCell.swift
//  TableViewController
//
//  Created by 민지은 on 2024/01/11.
//

import UIKit

class ADTableViewCell: UITableViewCell {
    
    static let identifier = "ADTableViewCell"

    @IBOutlet var adLabel: UILabel!
    @IBOutlet var adDetailLabel: UILabel!
    @IBOutlet var adView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        adView.backgroundColor = UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1)
        adView.layer.cornerRadius = 10
        
        adLabel.text = "AD"
        adLabel.font = .boldSystemFont(ofSize: 15)
        adLabel.textAlignment = .center
        adLabel.backgroundColor = .white
        adLabel.clipsToBounds = true
        adLabel.layer.cornerRadius = 10
        
        adDetailLabel.font = .boldSystemFont(ofSize: 16)
        adDetailLabel.numberOfLines = 0
        adDetailLabel.textAlignment = .center
    }
    
    
}
