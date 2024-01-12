//
//  ADViewController.swift
//  TableViewController
//
//  Created by 민지은 on 2024/01/11.
//

import UIKit

class ADViewController: UIViewController, ViewProtocol {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    @objc func adLeftBarButtonItemClicked() {
        print(#function)
        
        dismiss(animated: true)
    }
    
    func configureView() {
        navigationItem.title = "광고 화면"
        
        let image = UIImage(systemName: "xmark")
        let button = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(adLeftBarButtonItemClicked))
        button.tintColor = .black
        navigationItem.leftBarButtonItem = button
    }

}
