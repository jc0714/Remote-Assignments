//
//  ViewController.swift
//  ImageViewer
//
//  Created by Brian on 8/23/18.
//  Copyright © 2018 Razeware. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  // MARK: - Outlets
  
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var segmentedControl: UISegmentedControl!
  
  // MARK: - Properties
  
  let imageUrls = [
    URL(string: "https://koenig-media.raywenderlich.com/uploads/2018/05/OperationQueue-feature.png")!,
    URL(string: "https://cdn.hk01.com/di/media/images/cis/5e4d26b36f91ff14194bcc84.jpg/-TqjFkA17CtIIEUqJwn-nbqo7DsgSuvonsfkG57H5Bs?v=w1920r16_9")!,
    URL(string: "https://i.kfs.io/playlist/global/15981067v6/cropresize/600x600.jpg")!
  ]
  
  // MARK: - View Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    displayImage(index: 0)
  }

  // MARK: - Actions
  
  @IBAction func tappedSegment(_ sender: Any) {
    displayImage(index: segmentedControl.selectedSegmentIndex)
  }

  // MARK: - Helper Methods
  
  /// Displays the image from the specified index in `imageUrls` array.
  ///
  /// - Parameter index: Index of the image URL to display.
  func displayImage(index: Int) {
    let task = URLSession.shared.downloadTask(with: imageUrls[index]) { (location, response, error) in
      guard let location = location,
            let imageData = self.getImageData(location: location),
            let image = UIImage(data: imageData) else {
              return
      }
      OperationQueue.main.addOperation {
        self.imageView.image = image
      }
    }
    task.resume()
  }
  
  /// Retrieves image data from the specified URL.
  ///
  /// - Parameter location: The URL from which to retrieve image data.
  /// - Returns: Optional `Data` object containing the image data, or `nil` if an error occurs.
  func getImageData(location: URL) -> Data? {
    var imageData: Data? = nil
    do {
      try imageData = Data(contentsOf: location)
    } catch {
      print("Error retrieving image data: \(error)")
    }
    return imageData
  }
}
