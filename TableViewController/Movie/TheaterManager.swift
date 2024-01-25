//
//  TheaterManager.swift
//  TableViewController
//
//  Created by 민지은 on 2024/01/25.
//

import Foundation
import MapKit

class TheaterManager {
    
    static let shared = TheaterManager()
    
    private init() { }
    
    func mapSetting(theaterType: String, mapView: MKMapView, completionHandler: @escaping (MKMapView) -> ()) {
        
        let theater = TheaterList().mapAnnotations
        var filterData: [Theater] = []
        
        if theaterType == "전체보기" {
            filterData = theater
        } else {
            for item in theater {
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
            
            mapView.setRegion(regionList[index], animated: true)
        }
        
        mapView.removeAnnotations(mapView.annotations)

        for index in 0...filterData.count - 1 {
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinateList[index]
            annotation.title = filterData[index].location
            
            mapView.addAnnotation(annotation)
        }
        
        print(mapView.annotations)

    }
}
