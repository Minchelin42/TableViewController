//
//  ChatViewController.swift
//  TableViewController
//
//  Created by 민지은 on 2024/01/12.
//

import UIKit

class ChatViewController: UIViewController {
    

    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var chatTableView: UITableView!
    
    let searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "TRAVEL TALK"
        
        searchBar.placeholder = "친구 이름을 검색해보세요"        
        chatTableView.separatorStyle = .none

        chatTableView.delegate = self
        chatTableView.dataSource = self
        
        let xib = UINib(nibName: "ChatTableViewCell", bundle: nil)
        chatTableView.register(xib, forCellReuseIdentifier: "ChatTableViewCell")
        
    }

}

func changeDateStyle(date: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
    
    let convertDate = dateFormatter.date(from: date)
    
    let myformatter = DateFormatter()
    myformatter.dateFormat = "yy.MM.dd"

    let result = myformatter.string(from:convertDate!)
    
    print(result)
    
    return result
}

extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mockChatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatTableViewCell", for: indexPath) as! ChatTableViewCell
        
        let chat = mockChatList[indexPath.row]
        
        cell.userImage.image = UIImage(named: chat.chatroomImage[0])
        cell.userNameLabel.text = chat.chatroomName
        cell.userChatLabel.text = chat.chatList.last?.message
        
        let lastDate = chat.chatList.last?.date
        
        cell.dateLabel.text = changeDateStyle(date: lastDate ?? "")
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let sb = UIStoryboard(name: "Chat", bundle: nil)
        
        let vc = sb.instantiateViewController(withIdentifier: "ChatDetailViewController") as! ChatDetailViewController
        
        vc.chatId = mockChatList[indexPath.row].chatroomId - 1
        
        navigationController?.pushViewController(vc, animated: true)
        
        tableView.reloadRows(at: [indexPath], with: .fade)
        
    }
    
    
}
