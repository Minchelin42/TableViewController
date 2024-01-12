//
//  DetailViewController.swift
//  TableViewController
//
//  Created by 민지은 on 2024/01/11.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController, ViewProtocol {

    let travel = TravelInfo().travel
    
    @IBOutlet var detailTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        configureView()
    }
    
    func configureView() {
        navigationItem.title = "도시 상세 정보"
    }
}

extension DetailViewController {
    func configureTableView() {
        detailTableView.delegate = self
        detailTableView.dataSource = self
        
        let xib = UINib(nibName: DetailTableViewCell.identifier, bundle: nil)
        detailTableView.register(xib, forCellReuseIdentifier: DetailTableViewCell.identifier)
        
        let xib2 = UINib(nibName: ADTableViewCell.identifier, bundle: nil)
        detailTableView.register(xib2, forCellReuseIdentifier: ADTableViewCell.identifier)
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
            let cell = tableView.dequeueReusableCell(withIdentifier: ADTableViewCell.identifier, for: indexPath) as! ADTableViewCell
            
            cell.adDetailLabel.text = travel.title
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: DetailTableViewCell.identifier, for: indexPath) as! DetailTableViewCell
            
            let url = URL(string: travel.travel_image!)
            cell.travelImage.kf.setImage(with: url)
            
            cell.titleLabel.text = travel.title
            
            cell.descriptionLabel.text = travel.description

            cell.gradeLabel.text = "별점\(travel.grade!)   저장(\(travel.save!))"
            
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
