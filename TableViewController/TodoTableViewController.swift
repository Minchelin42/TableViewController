//
//  TodoTableViewController.swift
//  TableViewController
//
//  Created by 민지은 on 2024/01/07.
//

import UIKit

class TodoTableViewController: UITableViewController {
    
    var list = ["그립톡 구매", "사이다 구매","아이패트 최저가 알아보기", "침대 매트리스 가격 비교"]

    @IBOutlet var topInputView: UIView!
    @IBOutlet var inputTextField: UITextField!
    @IBOutlet var plusButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        navigationItem.title = "쇼핑"
        
        topInputView.backgroundColor = UIColor(named: "todoGray")
        topInputView.layer.cornerRadius = 10
        
        inputTextField.backgroundColor = .clear
        inputTextField.borderStyle = .none
        inputTextField.placeholder = "무엇을 구매하실 예정이신가요?"
        
        plusButton.backgroundColor = UIColor(named: "buttonGray")
        plusButton.setTitle("추가", for: .normal)
        plusButton.setTitleColor(.black, for: .normal)
        plusButton.titleLabel?.font = .systemFont(ofSize: 13, weight: .semibold)
        plusButton.layer.cornerRadius = 10

    }
    
    @IBAction func inputFinish(_ sender: UITextField) {
        plusButtonTapped(plusButton)
    }
    
    @IBAction func plusButtonTapped(_ sender: UIButton) {
        if inputTextField.text != "" {
            list.append(inputTextField.text!)
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
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath) as! TodoTableViewCell
        
        cell.checkButton.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        
        cell.checkButton.tintColor = .black
        
        cell.starButton.setImage(UIImage(systemName: "star"), for: .normal)
        
        cell.tintColor = .black
        
        cell.titleLabel.text = "\(list[indexPath.row])"
        cell.titleLabel.font = .systemFont(ofSize: 14, weight: .regular)
        
        cell.listView.backgroundColor = UIColor(named: "todoGray")
        cell.listView.layer.cornerRadius = 10
        
        
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            list.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }

}
