//
//  ChatDetailViewController.swift
//  TableViewController
//
//  Created by 민지은 on 2024/01/12.
//

import UIKit

class ChatDetailViewController: UIViewController, ViewProtocol {

    @IBOutlet var chatDetailTableView: UITableView!
    
    var chatId: Int = 0
    
    @IBOutlet var chatInputView: UIView!
    @IBOutlet var inputTextField: UITextField!
    
    @IBOutlet var sendButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureTableView()
        configureView()

    }
    
    func configureView() {
        chatInputView.backgroundColor = UIColor(named: "buttonGray")
        chatInputView.layer.cornerRadius = 15
        
        inputTextField.borderStyle = .none
        inputTextField.placeholder = "메시지를 입력하세요"
        inputTextField.backgroundColor = .clear
        
        sendButton.setImage(UIImage(systemName: "paperplane"), for: .normal)
        sendButton.tintColor = .lightGray
        
        
        navigationItem.title = "\(mockChatList[chatId].chatroomName)"
        
        let image = UIImage(systemName: "chevron.left")
        let button = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(detailLeftBarButtonItemClicked))
        button.tintColor = .black
        navigationItem.leftBarButtonItem = button
    }
    
    @objc func detailLeftBarButtonItemClicked() {
        print(#function)

        navigationController?.popViewController(animated: true)
    }

}

extension ChatDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mockChatList[chatId].chatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let chat = mockChatList[chatId].chatList[indexPath.row]
        
        if  chat.user != .user { //상대방일 때
            let cell = tableView.dequeueReusableCell(withIdentifier: "ChatDetailFriendTableViewCell", for: indexPath) as! ChatDetailFriendTableViewCell
            
            cell.friendImage.image = UIImage(named: chat.user.profileImage)
            cell.friendName.text = chat.user.rawValue
            cell.friendChat.text = chat.message
            cell.dateLabel.text = chat.date.changeDateStyleChatRoom()
        
            return cell
            
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ChatDetailUserTableViewCell", for: indexPath) as! ChatDetailUserTableViewCell
            
            cell.userChatLabel.text = chat.message
            cell.dateLabel.text = chat.date.changeDateStyleChatRoom()
            
            return cell
        }
    
    }
}

extension ChatDetailViewController {
    
    func configureTableView() {
        
        navigationItem.title = "\(mockChatList[chatId].chatroomName)"
        
        chatDetailTableView.delegate = self
        chatDetailTableView.dataSource = self
        chatDetailTableView.separatorStyle = .none
        
        chatDetailTableView.rowHeight = UITableView.automaticDimension
        
        let xib = UINib(nibName: "ChatDetailFriendTableViewCell", bundle: nil)
        chatDetailTableView.register(xib, forCellReuseIdentifier: "ChatDetailFriendTableViewCell")
        
        let xib2 = UINib(nibName: "ChatDetailUserTableViewCell", bundle: nil)
        chatDetailTableView.register(xib2, forCellReuseIdentifier: "ChatDetailUserTableViewCell")
        
        chatDetailTableView.allowsSelection = false
    }

}
