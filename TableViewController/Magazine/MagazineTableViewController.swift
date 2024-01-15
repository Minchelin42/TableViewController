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
        configureView()
    }
    
    
    @objc func leftBarButtonItemClicked() {
        print(#function) //해당 함수명이 프린트되는 코드

        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: MagazineTableViewController.identifier) as! MagazineTableViewController

        navigationController?.pushViewController(vc, animated: true)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return magazine.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "magazineCell", for: indexPath) as! MagazineTableViewCell
        
        let magazine = magazine[indexPath.row]
        
        let url = URL(string: magazine.photo_image)
        cell.travelImage.kf.setImage(with: url)
        
        cell.titleLabel.text = magazine.title
        cell.subtitleLabel.text = magazine.subtitle
        
        let result = changeDateStyle(date: magazine.date)
            
        cell.dateLabel.text = result
        
        cell.selectionStyle = .none

        return cell
        
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 520
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: MagazineWebViewController.identifier) as! MagazineWebViewController

        vc.urlString = magazine[indexPath.row].link
        
        navigationController?.pushViewController(vc, animated: true)
    }

}

extension MagazineTableViewController: ViewProtocol {
    func configureView() {
        navigationItem.title = "SeSAC TRAVEL"
    }
}

extension MagazineTableViewController {
    func changeDateStyle(date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyMMdd"
        
        let convertDate = dateFormatter.date(from: date)
        
        let myformatter = DateFormatter()
        myformatter.dateFormat = "yy년 MM월 dd일"
        
        let result = myformatter.string(from:convertDate!)
        
        return result
    }
}




