//
//  ViewController.swift
//  TableViewPractice
//
//  Created by J oyce on 2024/7/8.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    // return 2 sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    // return number of rows in each section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 10
        } else {
            return 5
        }
    }
    
    // set "whats in the cell", return the cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.smallLabel.text = "this is section \(indexPath.section), row \(indexPath.row)"
        return cell
    }
    
    // 設定 row height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    // 印出 clicked cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            if let cell = tableView.cellForRow(at: indexPath) as? TableViewCell {
                print("Cell content: \(cell.smallLabel.text ?? "")")
            }
            //tableView.deselectRow(at: indexPath, animated: true)
        }
}

/* 2. reloadData 會更新 TableView 所有數據，包含其 cell、section header、section footer 等等。
reloadData 後 TableView 的 delegate 跟 data source 也重新執行，我們可以看到目前頁面上更新的內容。
 
如果有呼叫 relaodData()，他會依序執行以下確認。
 numberOfSections(in:)：有多少個 section。
 tableView(_:numberOfRowsInSection:)：每個 section 有多少行。
 tableView(_:cellForRowAt:)：設定 cell 內容。
 
參考：https://medium.com/%E5%BD%BC%E5%BE%97%E6%BD%98%E7%9A%84-swift-ios-app-%E9%96%8B%E7%99%BC%E6%95%99%E5%AE%A4/reload-tableview-%E5%88%B7%E6%96%B0tableview%E7%95%AB%E9%9D%A2-reloaddata-updates-72ad19164c87
 https://developer.apple.com/documentation/uikit/uitableview/1614862-reloaddata?source=post_page-----72ad19164c87--------------------------------
*/
