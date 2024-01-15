//
//  Travel3ViewController.swift
//  TableViewController
//
//  Created by 민지은 on 2024/01/09.
//

import UIKit

class Travel3ViewController: UIViewController {

    var navigationTitleString: String = "인기 도시"
    
    var city: [City] = CityInfo().city {
        didSet {
            cityCollectionView.reloadData()
        }
    }
    
    @IBOutlet var cityCollectionView: UICollectionView!
    @IBOutlet var selectSegment: UISegmentedControl!
    @IBOutlet var grayLine: UIView!
    @IBOutlet var citySearchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        configureCollectionView()
    }

    @IBAction func selectSegmentTapped(_ sender: UISegmentedControl) {
        segmentAction()
    }
    
}

extension Travel3ViewController {
    func configureCollectionView() {
        let xib = UINib(nibName: Travel2CollectionViewCell.identifier, bundle: nil)
        cityCollectionView.register(xib, forCellWithReuseIdentifier: Travel2CollectionViewCell.identifier)
        
        cityCollectionView.dataSource = self
        cityCollectionView.delegate = self
    }
    
    func setLayout() {
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

    func setSegment() {
        selectSegment.setTitle("모두", forSegmentAt: 0)
        selectSegment.setTitle("국내", forSegmentAt: 1)
        selectSegment.setTitle("해외", forSegmentAt: 2)
    }
    
    func segmentAction() {
        if selectSegment.selectedSegmentIndex == 0 {
            city.removeAll()
            city = cityList.allCity
            searchBar(citySearchBar, textDidChange: citySearchBar.text ?? "")
            cityCollectionView.reloadData()
        } else if selectSegment.selectedSegmentIndex == 1 {
            city.removeAll()
            city = cityList.koreaCity
            searchBar(citySearchBar, textDidChange: citySearchBar.text ?? "")
            cityCollectionView.reloadData()
        } else {
            city.removeAll()
            city = cityList.notKoreaCity
            searchBar(citySearchBar, textDidChange: citySearchBar.text ?? "")
            cityCollectionView.reloadData()
        }
    }
    
    func filterCity(selectIndex: Int, text: String){
        
        var filterData: [City] = []
        
        var compareCity: [City]  = []
        
        switch selectIndex {
        case 0: compareCity = cityList.allCity
        case 1: compareCity = cityList.koreaCity
        case 2: compareCity = cityList.notKoreaCity
        default: print("오류 발생")
        }
        
        for item in compareCity {
            if item.city_name.contains(text) || item.city_english_name.contains(text) || item.city_explain.contains(text) {
                filterData.append(item)
            }
        }
        
        city = filterData
    }
    
    func cityReset(selected: Int) {
        switch selected {
        case 0: city = cityList.allCity
        case 1: city = cityList.koreaCity
        case 2: city = cityList.notKoreaCity
        default: print("오류 발생")
        }
    }
}

extension Travel3ViewController: ViewProtocol {
    func configureView() {
        
        navigationItem.title = navigationTitleString
        grayLine.backgroundColor = UIColor(named: "buttonGray")
        
        setLayout()
        setSegment()
        
        citySearchBar.delegate = self
        citySearchBar.showsCancelButton = true
    }
}

extension Travel3ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(#function)
        
        let selected = selectSegment.selectedSegmentIndex
        
        if searchBar.text == "" {
            cityReset(selected: selected)
        } else {
            filterCity(selectIndex: selected, text: searchBar.text!)
        }

    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print(#function)
        
        let selected = selectSegment.selectedSegmentIndex
        
        if searchBar.text == "" {
            cityReset(selected: selected)
        } else {
            filterCity(selectIndex: selected, text: searchBar.text!)
        }
        
        view.endEditing(true)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print(#function)
        
        citySearchBar.text = ""
        
        let selected = selectSegment.selectedSegmentIndex

        cityReset(selected: selected)
        
        view.endEditing(true)

    }
    
}


extension Travel3ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return city.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Travel2CollectionViewCell.identifier, for: indexPath) as! Travel2CollectionViewCell
        
        let city = city[indexPath.item]
    
        let url = URL(string: city.city_image)
        cell.cityImage.kf.setImage(with: url)

        cell.cityLabel.text = "\(city.city_name) | \(city.city_english_name)"
        cell.cityListLabel.text = "\(city.city_explain)"
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let sb = UIStoryboard(name: "Detail", bundle: nil)
        
        let vc = sb.instantiateViewController(withIdentifier: DetailViewController.identifier) as! DetailViewController

        navigationController?.pushViewController(vc, animated: true)
    }
}
