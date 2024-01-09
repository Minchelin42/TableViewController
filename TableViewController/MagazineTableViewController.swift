//
//  MagazineTableViewController.swift
//  TableViewController
//
//  Created by 민지은 on 2024/01/08.
//

import UIKit
import Kingfisher


class MagazineTableViewController: UITableViewController {

    @IBOutlet var grayline: UIView!
    
    let magazine = MagazineInfo().magazine
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "SeSAC TRAVEL"

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return magazine.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "magazineCell", for: indexPath) as! MagazineTableViewCell
        
        let url = URL(string: magazine[indexPath.row].photo_image)
        cell.travelImage.kf.setImage(with: url)
        cell.travelImage.contentMode = .scaleAspectFill
        cell.travelImage.layer.cornerRadius = 20
        
        cell.titleLabel.text = magazine[indexPath.row].title
        cell.titleLabel.font = .systemFont(ofSize: 23, weight: .black)
        cell.titleLabel.numberOfLines = 0
        cell.subtitleLabel.text = magazine[indexPath.row].subtitle
        cell.subtitleLabel.textColor = .lightGray
        cell.subtitleLabel.font = .boldSystemFont(ofSize: 15)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyMMdd"
        
        let convertDate2 = dateFormatter.date(from: magazine[indexPath.row].date)
        
        let myformatter = DateFormatter()
        myformatter.dateFormat = "yy년 MM월 dd일"
        
        let result = myformatter.string(from:convertDate2!)
            
        cell.dateLabel.text = result
        
        cell.dateLabel.textColor = .lightGray
        cell.dateLabel.font = .boldSystemFont(ofSize: 14)
        
        return cell
        
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 520
    }

}
