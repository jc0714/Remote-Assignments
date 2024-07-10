//
//  FlickrTableViewController.swift
//  FlickrImages
//
//  Created by Brian on 8/21/18.
//  Copyright © 2018 Razeware. All rights reserved.
//

import UIKit

// 定義解析 Flickr JSON 所需的結構體
struct FlickerJSON: Codable {
  struct FlickrItem: Codable {
    let media: Dictionary<String, String>
    let title: String
  }
  let items: [FlickrItem]
}

// 定義表示照片的結構體
struct FlckrPhoto {
  let image: UIImage
  let title: String
}

// 定義一個 UITableViewController 子類，用於顯示從 Flickr 加載的照片
class FlickrTableViewController: UITableViewController {

    var photos: [FlckrPhoto] = []
  
    override func viewDidLoad() {
      super.viewDidLoad()
      // 在視圖加載時調用 loadFlickrImage 方法加載圖片
      loadFlickrImage()
    }

    // MARK: - Table view data source

    // 設置表格視圖的節數，這裡只有一個節
    override func numberOfSections(in tableView: UITableView) -> Int {
      return 1
    }

    // 設置表格視圖的行數，根據加載的照片數量決定
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return photos.count
    }

    // 加載 Flickr 圖片的方法
    func loadFlickrImage() {
      
      // 創建臨時配置
      let configuration = URLSessionConfiguration.ephemeral
      
      // 使用配置創建 URLSession
      let session = URLSession(configuration: configuration)
      
      // 設置請求的 URL
      let url = URL(string: "https://api.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=1")!
        /* 每張圖片都是以下格式
         {
         "title": " ",
         "link": "https://www.flickr.com/photos/189920786@N08/53844975383/",
         "media": {
           "m": "https://live.staticflickr.com/65535/53844975383_5deee077a7_m.jpg"
         },
         "date_taken": "2024-07-09T11:08:08-08:00",
         "description": " \u003Cp\u003E\u003Ca href=\"https://www.flickr.com/people/189920786@N08/\"\u003EThe Dog Squad\u003C/a\u003E posted a photo:\u003C/p\u003E \u003Cp\u003E\u003Ca href=\"https://www.flickr.com/photos/189920786@N08/53844975383/\" title=\" \"\u003E\u003Cimg src=\"https://live.staticflickr.com/65535/53844975383_5deee077a7_m.jpg\" width=\"240\" height=\"180\" alt=\" \" /\u003E\u003C/a\u003E\u003C/p\u003E ",
         "published": "2024-07-09T03:07:25Z",
         "author": "nobody@flickr.com (\"The Dog Squad\")",
         "author_id": "189920786@N08",
         "tags": ""
        },*/
      
      // 創建 data task，發送請求並處理回應
      let task = session.dataTask(with: url) {
        
        (data, response, error) in
        
        // 檢查 HTTP 回應的狀態碼和數據是否有效
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200, let data = data else {
          return
        }
        
        // 使用 JSONDecoder 解析數據
        do {
          let decoder = JSONDecoder()
          let media = try decoder.decode(FlickerJSON.self, from: data)
          
          // 遍歷解析出的項目，下載圖片並創建 FlckrPhoto 對象
          for item in media.items {
            if let imageURL = item.media["m"] {
              let url = URL(string: imageURL)!
              let imageData = try Data(contentsOf: url)
              if let image = UIImage(data: imageData) {
                let flickrImage = FlckrPhoto(image: image, title: item.title)
                self.photos.append(flickrImage)
              }
            }
          }
          
          // 在主執行緒上重新載入表格視圖
          let queue = OperationQueue.main
          queue.addOperation {
            self.tableView.reloadData()
          }
          
        } catch {
          // 捕獲並輸出解析錯誤
          print("Error info: \(error)")
        }
      }
      
      // 開始執行任務
      task.resume()
    }
  
    // 配置表格視圖的單元格
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FlickrCell", for: indexPath)

        // 設置單元格的圖片和標題
        cell.imageView?.image = photos[indexPath.row].image
        cell.textLabel?.text = photos[indexPath.row].title

        return cell
    }
  
    // 準備進行 segue 時調用的方法
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PhotoSegue" {
            // 確認 segue 目的地為 PhotoViewController 並設置圖片
            guard let cell = sender as? UITableViewCell, let photoViewController = segue.destination as? PhotoViewController, let indexPath = tableView.indexPath(for: cell) else {
                return
            }
            let flickrPhoto = photos[indexPath.row]
            photoViewController.photo = flickrPhoto.image
        }
    }

}
