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
}
