//
//  TravelCollectionViewController.swift
//  TableViewController
//
//  Created by 민지은 on 2024/01/09.
//

import UIKit
import Kingfisher

class TravelCollectionViewController: UICollectionViewController {
    
    let city = CityInfo().city

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 8
        
        let cellWidth = UIScreen.main.bounds.width - (spacing * 3)
        let cellHeight = UIScreen.main.bounds.height
        
        layout.itemSize = CGSize(width: cellWidth / 2, height: cellHeight * 0.28)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.scrollDirection = .vertical
        
        collectionView.collectionViewLayout = layout
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return city.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TravelCollectionViewCell", for: indexPath) as! TravelCollectionViewCell
        
        let city = city[indexPath.item]
    
        
        let url = URL(string: city.city_image)
        cell.cityImage.layer.cornerRadius =  cell.cityImage.frame.width / 2
        cell.cityImage.kf.setImage(with: url)
        cell.cityImage.contentMode = .scaleAspectFill


        cell.cityLabel.text = "\(city.city_name) | \(city.city_english_name)"
        cell.cityLabel.font = .systemFont(ofSize: 14, weight: .bold)
        cell.cityLabel.textAlignment = .center
        cell.cityLabel.numberOfLines = 0
        
        cell.subCityLabel.text = "\(city.city_explain)"
        cell.subCityLabel.font = .systemFont(ofSize: 11, weight: .semibold)
        cell.subCityLabel.textColor = .lightGray
        cell.subCityLabel.textAlignment = .center
        cell.subCityLabel.numberOfLines = 0
        


        return cell
    }


}

