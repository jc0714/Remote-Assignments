//
//  ViewController.swift
//  W4.project2
//
//  Created by J oyce on 2024/7/9.
//

import UIKit

struct Station: Codable {
    let stationID: String
    let stationName: String
    let stationAddress: String
}

class ViewController: UIViewController {
    
    @IBOutlet weak var stationIDLabel: UILabel!
    @IBOutlet weak var stationNameLabel: UILabel!
    @IBOutlet weak var adressLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayText()
        view.backgroundColor = UIColor.systemOrange
        stationIDLabel.textColor = .white
        stationNameLabel.textColor = .white
        adressLabel.textColor = .white
    }
    
    func displayText() {
//        let configuration = URLSessionConfiguration.default
//        configuration.waitsForConnectivity = true
//        let session = URLSession(configuration: configuration)
            
        let url = URL(string: "https://remote-assignment.s3.ap-northeast-1.amazonaws.com/station")!
        
        // `URLSession` 用於 create 一個 data task，發送請求到 with 的 url。
        // 可以省去以上 configuration 的段落。
        let task = URLSession.shared.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            //檢查是否為HTTPURLResponse對象且狀態碼是否為 200（成功）
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200
            else {
                print("Invalid response or status code")
                return
                }
            // 檢查數據是否為nil
            guard let data = data else {
                print(error.debugDescription)
                return
        }
                
        // 印出連結裡的內容
        if let result = NSString(data: data, encoding: String.Encoding.utf8.rawValue) as
            String? {
                print(result)
        }
                
        // 把連結裡的 dic 分別對應到他該去的 label
        do {
            let station = try JSONDecoder().decode(Station.self, from: data)
            DispatchQueue.main.async {
                self.stationIDLabel.text = station.stationID
                self.stationNameLabel.text = station.stationName
                self.adressLabel.text = station.stationAddress
                }
            } catch {
                print("Error")
            }
        }
        task.resume()
    }
}
