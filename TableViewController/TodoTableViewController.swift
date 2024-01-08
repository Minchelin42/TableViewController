//
//  TodoTableViewController.swift
//  TableViewController
//
//  Created by 민지은 on 2024/01/07.
//

import UIKit

struct Todo {
    let list: String
    var check: Bool
    var star: Bool
}

class TodoTableViewController: UITableViewController {

    @IBOutlet var topInputView: UIView!
    @IBOutlet var inputTextField: UITextField!
    @IBOutlet var plusButton: UIButton!
    
    var todoList: [Todo] = [Todo(list: "에어팟 맥스 구매", check: false, star: false),
                            Todo(list: "아이폰 액정 A/S", check: false, star: true),
                            Todo(list: "가성비 매트리스 알아보기", check: false, star: false),
                            Todo(list: "제로콜라 대용량 구매", check: false, star: false)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        navigationItem.title = "쇼핑"
        
        inputViewDesign()
        plusButtonDesign()
    }
    
    @IBAction func inputFinish(_ sender: UITextField) {
        plusButtonTapped(plusButton)
    }
    
    @IBAction func plusButtonTapped(_ sender: UIButton) {
        if inputTextField.text != "" {
            todoList.append(Todo(list: inputTextField.text!, check: false, star: false))
            tableView.reloadData()
            inputTextField.text = ""
        } else {
            let alert = UIAlertController(title: "추가 실패", message: "내용을 입력해주세요", preferredStyle: .alert)

            let button = UIAlertAction(title: "확인", style: .cancel)
            alert.addAction(button)

            present(alert, animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath) as! TodoTableViewCell
        
        cell.checkButton.tag = indexPath.row
        cell.starButton.tag = indexPath.row

        var checkImage = todoList[indexPath.row].check ? "checkmark.square.fill" : "checkmark.square"
        var starImage = todoList[indexPath.row].star ? "star.fill" : "star"
        
        cell.checkButton.setImage(UIImage(systemName: checkImage), for: .normal)
        cell.checkButton.tintColor = .black
        
        cell.starButton.setImage(UIImage(systemName: starImage), for: .normal)
        cell.starButton.tintColor = .black
        
        cell.titleLabel.text = "\(todoList[indexPath.row].list)"
        cell.titleLabel.font = .systemFont(ofSize: 14, weight: .regular)
        
        cell.listView.backgroundColor = UIColor(named: "todoGray")
        cell.listView.layer.cornerRadius = 10
        
        cell.starButton.addTarget(self, action: #selector(starButtonTapped), for: .touchUpInside)
        cell.checkButton.addTarget(self, action: #selector(checkButtonTapped), for: .touchUpInside)
        
        return cell
    }

    @objc func starButtonTapped(sender: UIButton){
        todoList[sender.tag].star.toggle()
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .fade)
    }
    
    @objc func checkButtonTapped(sender: UIButton){
        todoList[sender.tag].check.toggle()
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .fade)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            todoList.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    func inputViewDesign() {
        topInputView.backgroundColor = UIColor(named: "todoGray")
        topInputView.layer.cornerRadius = 10
        
        inputTextField.backgroundColor = .clear
        inputTextField.borderStyle = .none
        inputTextField.placeholder = "무엇을 구매하실 예정이신가요?"
    }
    
    func plusButtonDesign() {
        plusButton.backgroundColor = UIColor(named: "buttonGray")
        plusButton.setTitle("추가", for: .normal)
        plusButton.setTitleColor(.black, for: .normal)
        plusButton.titleLabel?.font = .systemFont(ofSize: 13, weight: .semibold)
        plusButton.layer.cornerRadius = 10
    }
    

}
