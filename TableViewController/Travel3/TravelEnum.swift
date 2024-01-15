//
//  TravelEnum.swift
//  TableViewController
//
//  Created by 민지은 on 2024/01/15.
//

import Foundation

enum cityList {
    static let allCity = CityInfo().city
    static var koreaCity: [City] {
        var cityData: [City] = []
        for item in cityList.allCity {
            if item.domestic_travel {
                cityData.append(item)
            }
        }
        return cityData
    }
    
    static var notKoreaCity: [City] {
        var cityData: [City] = []
        for item in cityList.allCity {
            if !item.domestic_travel {
                cityData.append(item)
            }
        }
        return cityData
    }
}
