//
//  ChatViewController.swift
//  TableViewController
//
//  Created by 민지은 on 2024/01/12.
//

import UIKit

class ChatViewController: UIViewController, ViewProtocol {

    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var chatTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        configureTableView()
    }
    
    func configureView() {
        navigationItem.title = "TRAVEL TALK"
        searchBar.placeholder = "친구 이름을 검색해보세요"
    }


}

extension ChatViewController {
    func configureTableView() {
        chatTableView.separatorStyle = .none

        chatTableView.delegate = self
        chatTableView.dataSource = self
        
        let xib = UINib(nibName: "ChatTableViewCell", bundle: nil)
        chatTableView.register(xib, forCellReuseIdentifier: "ChatTableViewCell")
        
        let xib2 = UINib(nibName: "ChatDetailGroupTableViewCell", bundle: nil)
        chatTableView.register(xib2, forCellReuseIdentifier: "ChatDetailGroupTableViewCell")
    }
}

extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mockChatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let chat = mockChatList[indexPath.row]
        
        if chat.chatroomImage.count == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ChatTableViewCell", for: indexPath) as! ChatTableViewCell
            
            cell.userImage.image = UIImage(named: chat.chatroomImage[0])
            cell.userNameLabel.text = chat.chatroomName
            cell.userChatLabel.text = chat.chatList.last?.message
            
            let lastDate = chat.chatList.last?.date
            
            cell.dateLabel.text = lastDate?.changeDateStyleChatList()
            
            cell.selectionStyle = .none
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ChatDetailGroupTableViewCell", for: indexPath) as! ChatDetailGroupTableViewCell
            
            for index in 0...3 {
                cell.chatUserImages[index].image = UIImage(named: chat.chatroomImage[index])
                cell.chatUserImages[index].layer.cornerRadius = 3
            }
            cell.chatNameLabel.text = chat.chatroomName
            cell.chatLabel.text = chat.chatList.last?.message
            
            let lastDate = (chat.chatList.last?.date)!
            
            cell.dateLabel.text = lastDate.changeDateStyleChatList()
            
            cell.selectionStyle = .none
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let sb = UIStoryboard(name: "Chat", bundle: nil)
        
        let vc = sb.instantiateViewController(withIdentifier: "ChatDetailViewController") as! ChatDetailViewController
        
        vc.chatId = mockChatList[indexPath.row].chatroomId - 1
        
        navigationController?.pushViewController(vc, animated: true)
        
        tableView.reloadRows(at: [indexPath], with: .fade)
        
    }
}
