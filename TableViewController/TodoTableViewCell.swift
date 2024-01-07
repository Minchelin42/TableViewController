//
//  TodoTableViewCell.swift
//  TableViewController
//
//  Created by 민지은 on 2024/01/07.
//

import UIKit

class TodoTableViewCell: UITableViewCell {


    @IBOutlet var listView: UIView!
    @IBOutlet var checkButton: UIButton!
    @IBOutlet var starButton: UIButton!
    @IBOutlet var titleLabel: UILabel!
    
    
    @IBAction func checkButtonTapped(_ sender: UIButton) {
        if checkButton.currentImage == UIImage(systemName: "checkmark.square") {
            checkButton.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
        } else {
            checkButton.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        }
    }
    
    @IBAction func starButtonTapped(_ sender: UIButton) {
        if starButton.currentImage == UIImage(systemName: "star") {
            starButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        } else {
            starButton.setImage(UIImage(systemName: "star"), for: .normal)
        }
    }
}
