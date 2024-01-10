//
//  TravelProtocol.swift
//  TableViewController
//
//  Created by 민지은 on 2024/01/10.
//

import Foundation

protocol TravelProtocol {
    var navigationTitleString: String { get set }
    //뭔가 너무 쓸데없는 것까지 protocol에 다 집어넣은 느낌...이렇게 써도 되는거 맞나요🤔
    
    func setLayout()
    func koreaCitySet()
    func notKoreaCitySet()
    func setSegment()
    func segmentAction()
}
