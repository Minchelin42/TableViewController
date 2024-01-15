//
//  TheaterMapViewController.swift
//  TableViewController
//
//  Created by 민지은 on 2024/01/15.
//

import UIKit
import MapKit

class TheaterMapViewController: UIViewController {

    @IBOutlet var theaterMapView: MKMapView!
    
    let theater = TheaterList().mapAnnotations
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
        mapSetting("전체보기")
    }
    
    @objc func RightBarButtonItemClicked() {
        print(#function)
        
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let cancelButton = UIAlertAction(title: "취소", style: .cancel)
        
        let lotteButton = UIAlertAction(title: "롯데시네마", style: .default) { lotteButton in
            self.mapSetting("롯데시네마")
        }
        let megaboxButton = UIAlertAction(title: "메가박스", style: .default) { megaboxButton in
            self.mapSetting("메가박스")
        }
        let cgvButton = UIAlertAction(title: "CGV", style: .default) { cgvButton in
            self.mapSetting("CGV")
        }
        let allButton = UIAlertAction(title: "전체보기", style: .default) { allButton in
            self.mapSetting("전체보기")
        }

        alert.addAction(cancelButton)
        alert.addAction(lotteButton)
        alert.addAction(megaboxButton)
        alert.addAction(cgvButton)
        alert.addAction(allButton)

        present(alert, animated: true)
    }
    

}

extension TheaterMapViewController: ViewProtocol {
    func configureView() {
        let button = UIBarButtonItem(title: "Filter", style: .plain, target: self, action: #selector(RightBarButtonItemClicked))

        button.tintColor = .black
        navigationItem.rightBarButtonItem = button
    }
}

extension TheaterMapViewController {
    func mapSetting(_ theaterType: String) {
        
        var filterData: [Theater] = []
        
        if theaterType == "전체보기" {
            filterData = theater
        } else {
            for item in self.theater {
                if item.type == theaterType {
                    filterData.append(item)
                }
            }
        }

        var coordinateList: [CLLocationCoordinate2D] = []
        var regionList: [MKCoordinateRegion] = []

        
        for item in filterData {
            coordinateList.append(CLLocationCoordinate2D(latitude: item.latitude, longitude: item.longitude))
        }
        
        for index in 0...coordinateList.count - 1{
            regionList.append(MKCoordinateRegion(center: coordinateList[index], latitudinalMeters: 20000, longitudinalMeters: 20000))
            
            theaterMapView.setRegion(regionList[index], animated: true)
        }
        
        theaterMapView.removeAnnotations(theaterMapView.annotations)

        for index in 0...filterData.count - 1 {
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinateList[index]
            annotation.title = filterData[index].location
            
            theaterMapView.addAnnotation(annotation)
        }
        
        print(theaterMapView.annotations)
    }
    
}

