//
//  TravelDetailViewController.swift
//  TableViewController
//
//  Created by 민지은 on 2024/01/11.
//

import UIKit

class TravelDetailViewController: UIViewController, ViewProtocol {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    @objc func detailLeftBarButtonItemClicked() {
        print(#function)

        navigationController?.popViewController(animated: true)
    }
    
    func configureView() {
        navigationItem.title = "관광지 화면"
        
        let image = UIImage(systemName: "xmark")
        let button = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(detailLeftBarButtonItemClicked))
        button.tintColor = .black
        navigationItem.leftBarButtonItem = button
    }


}
