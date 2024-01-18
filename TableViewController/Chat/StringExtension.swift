//
//  StringExtension.swift
//  TableViewController
//
//  Created by 민지은 on 2024/01/14.
//

import UIKit

extension String {
    func changeDateStyleChatList() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        let convertDate = dateFormatter.date(from: self)
        
        let myformatter = DateFormatter()
        myformatter.dateFormat = "yy.MM.dd"
        
        let result = myformatter.string(from:convertDate!)
        
        return result
    }
    
    func changeDateStyleChatRoom() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        let convertDate = dateFormatter.date(from: self)
        
        let myformatter = DateFormatter()
        myformatter.dateFormat = "hh:mm a"
        myformatter.amSymbol = "오전"
        myformatter.pmSymbol = "오후"
        
        let result = myformatter.string(from:convertDate!)
        
        return result
    }
    
    func updateChatRoomDate(now: String, pre: String) -> Bool {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        var convertNowDate = dateFormatter.date(from: now)
        var convertPreDate = dateFormatter.date(from: pre)

        let myFormatter = DateFormatter()
        myFormatter.dateFormat = "yyyy년 MM월 dd일"

        let nowDate = myFormatter.string(from: convertNowDate!)
        let preDate = myFormatter.string(from: convertPreDate!)

        convertNowDate = myFormatter.date(from: nowDate)
        convertPreDate = myFormatter.date(from: preDate)
        
        switch convertNowDate!.compare(convertPreDate!) {
        case .orderedSame:
            return false
        case .orderedDescending:
            return true
        case .orderedAscending:
            return false
        }
    }
    
    func changeDateStyleChatRoomDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        let convertDate = dateFormatter.date(from: self)
        
        let myformatter = DateFormatter()
        myformatter.dateFormat = "yyyy년 MM월 dd일"
        
        let result = myformatter.string(from:convertDate!)
        return result
    }

}
