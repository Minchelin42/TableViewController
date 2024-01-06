//
//  SettingTableViewController.swift
//  TableViewController
//
//  Created by 민지은 on 2024/01/06.
//

import UIKit

class SettingTableViewController: UITableViewController {

    var allSetting = ["공지사항", "실험실", "버전 정보"]
    
    var personalSetting = ["개인/보안","알림","채팅","멀티프로필"]
    
    var etc = ["고객센터/도움말"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "설정"
        tableView.separatorColor = UIColor.gray

    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    // 셀의 갯수
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return allSetting.count
        } else if section == 1 {
            return personalSetting.count
        } else { // section == 2
            return etc.count
        }
    }
    
    // 셀 디자인 및 데이터 처리
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell")!
        
        if indexPath.section == 0 {
            cell.textLabel?.text = allSetting[indexPath.row]
        } else if indexPath.section == 1 {
            cell.textLabel?.text = personalSetting[indexPath.row]
        } else {
            cell.textLabel?.text = etc[indexPath.row]
        }
        
        cell.textLabel?.textColor = .white
        cell.textLabel?.font = .systemFont(ofSize: 14)

        return cell
    }
    
    // 셀의 높이
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    // 각 섹션별로 타이틀을 지정해주는 법
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "전체 설정"
        } else if section == 1{
            return "개인 설정"
        } else { // section == 2
            return "기타"
        }
    }


}
