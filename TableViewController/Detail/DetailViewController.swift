//
//  DetailViewController.swift
//  TableViewController
//
//  Created by 민지은 on 2024/01/11.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {

    let travel = TravelInfo().travel
    @IBOutlet var detailTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "도시 상세 정보"
        
        detailTableView.delegate = self
        detailTableView.dataSource = self
        
        let xib = UINib(nibName: "DetailTableViewCell", bundle: nil)
        detailTableView.register(xib, forCellReuseIdentifier: "DetailTableViewCell")
        
        let xib2 = UINib(nibName: "ADTableViewCell", bundle: nil)
        detailTableView.register(xib2, forCellReuseIdentifier: "ADTableViewCell")
    }

}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if travel[indexPath.row].ad {
            return UIScreen.main.bounds.width / 5
        } else {
            return UIScreen.main.bounds.width / 2.7
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return travel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let travel = travel[indexPath.row]
        
        if travel.ad { 
            let cell = tableView.dequeueReusableCell(withIdentifier: "ADTableViewCell", for: indexPath) as! ADTableViewCell
            
            cell.adView.backgroundColor = UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1)
            cell.adView.layer.cornerRadius = 10
            
            cell.adLabel.text = "AD"
            cell.adLabel.font = .boldSystemFont(ofSize: 15)
            cell.adLabel.textAlignment = .center
            cell.adLabel.backgroundColor = .white
            cell.adLabel.clipsToBounds = true
            cell.adLabel.layer.cornerRadius = 10
            
            cell.adDetailLabel.text = travel.title
            cell.adDetailLabel.font = .boldSystemFont(ofSize: 16)
            cell.adDetailLabel.numberOfLines = 0
            cell.adDetailLabel.textAlignment = .center
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailTableViewCell", for: indexPath) as! DetailTableViewCell
            
            let url = URL(string: travel.travel_image ?? "")
            cell.travelImage.kf.setImage(with: url)
            cell.travelImage.contentMode = .scaleAspectFill
            cell.travelImage.layer.cornerRadius = 10
            
            cell.titleLabel.text = travel.title
            cell.titleLabel.font = .boldSystemFont(ofSize: 15)
            cell.descriptionLabel.text = travel.description
            cell.descriptionLabel.font = .systemFont(ofSize: 13, weight: .semibold)
            cell.descriptionLabel.textColor = .gray
            cell.descriptionLabel.numberOfLines = 0
            cell.gradeLabel.text = "별점\(travel.grade ?? 0.0)   저장(\(travel.save ?? 0))"
            cell.gradeLabel.font = .systemFont(ofSize: 13, weight: .regular)
            cell.gradeLabel.textColor = .lightGray
            
            cell.heartButton.setImage(UIImage(systemName: "heart"), for: .normal)
            cell.heartButton.tintColor = .white
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if travel[indexPath.row].ad {
            let sb = UIStoryboard(name: "Detail", bundle: nil)
            
            let vc = sb.instantiateViewController(withIdentifier: "ADViewController") as! ADViewController

            let nav = UINavigationController(rootViewController: vc)

            nav.modalPresentationStyle = .fullScreen
            
            present(nav, animated: true)
            
            tableView.reloadRows(at: [indexPath], with: .fade)
            
        } else {
            let sb = UIStoryboard(name: "Detail", bundle: nil)
            
            let vc = sb.instantiateViewController(withIdentifier: "TravelDetailViewController") as! TravelDetailViewController
            
            navigationController?.pushViewController(vc, animated: true)
            
            tableView.reloadRows(at: [indexPath], with: .fade)
        }
    }
    
    
}
