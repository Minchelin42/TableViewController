//
//  Travel3ViewController.swift
//  TableViewController
//
//  Created by 민지은 on 2024/01/09.
//

import UIKit


class Travel3ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var city = CityInfo().city

    let allCity = CityInfo().city
    
    var koreaCity: [City] = []
    
    var notKoreaCity: [City] = []
    
    var nowListState: Int = 0
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return city.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Travel2CollectionViewCell", for: indexPath) as! Travel2CollectionViewCell
        
        let city = city[indexPath.item]
    
        let url = URL(string: city.city_image)
        cell.cityImage.kf.setImage(with: url)
        
        DispatchQueue.main.async {
            cell.cityImage.layer.cornerRadius = cell.cityImage.frame.width / 2
        }

        cell.cityLabel.text = "\(city.city_name) | \(city.city_english_name)"
        
        cell.cityListLabel.text = "\(city.city_explain)"
        
        return cell
    }

    @IBOutlet var cityCollectionView: UICollectionView!
    @IBOutlet var selectSegment: UISegmentedControl!
    @IBOutlet var grayLine: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        grayLine.backgroundColor = UIColor(named: "buttonGray")

        koreaCitySet()
        notKoreaCitySet()
        
        selectSegment.setTitle("모두", forSegmentAt: 0)
        selectSegment.setTitle("국내", forSegmentAt: 1)
        selectSegment.setTitle("해외", forSegmentAt: 2)
        
        navigationItem.title = "인기 도시"

        let xib = UINib(nibName: "Travel2CollectionViewCell", bundle: nil)
        cityCollectionView.register(xib, forCellWithReuseIdentifier: "Travel2CollectionViewCell")
        
        cityCollectionView.dataSource = self
        cityCollectionView.delegate = self
        
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 8
        
        let cellWidth = UIScreen.main.bounds.width - (spacing * 3)
        let cellHeight = (cellWidth / 2) * 1.3
        
        layout.itemSize = CGSize(width: cellWidth / 2, height: cellHeight)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.scrollDirection = .vertical
        
        cityCollectionView.collectionViewLayout = layout
    

    }

    @IBAction func selectSegmentTapped(_ sender: UISegmentedControl) {
        if selectSegment.selectedSegmentIndex == 0 {
            city.removeAll()
            city = allCity
            cityCollectionView.reloadData()
        } else if selectSegment.selectedSegmentIndex == 1 {
            city.removeAll()
            city = koreaCity
            cityCollectionView.reloadData()
        } else {
            city.removeAll()
            city = notKoreaCity
            cityCollectionView.reloadData()
        }
    }
    
    func koreaCitySet() {
        for index in 0...city.count - 1 {
            if city[index].domestic_travel {
                koreaCity.append(city[index])
            }
        }
    }
    
    func notKoreaCitySet() {
        for index in 0...city.count - 1 {
            if !city[index].domestic_travel {
                notKoreaCity.append(city[index])
            }
        }
    }
    
}
