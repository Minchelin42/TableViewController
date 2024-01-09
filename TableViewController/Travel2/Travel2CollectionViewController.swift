//
//  Travel2CollectionViewController.swift
//  TableViewController
//
//  Created by 민지은 on 2024/01/09.
//

import UIKit

private let reuseIdentifier = "Cell"

class Travel2CollectionViewController: UICollectionViewController {

    let city = CityInfo().city
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let xib = UINib(nibName: "Travel2CollectionViewCell", bundle: nil)
        collectionView.register(xib, forCellWithReuseIdentifier: "Travel2CollectionViewCell")
        
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
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Travel2CollectionViewCell", for: indexPath) as! Travel2CollectionViewCell
        
        let city = city[indexPath.item]
    
        let url = URL(string: city.city_image)
        cell.cityImage.kf.setImage(with: url)
        cell.cityImage.layer.cornerRadius =  cell.cityImage.frame.width / 2

        cell.cityLabel.text = "\(city.city_name) | \(city.city_english_name)"
        
        cell.cityListLabel.text = "\(city.city_explain)"

        return cell
    }


}
