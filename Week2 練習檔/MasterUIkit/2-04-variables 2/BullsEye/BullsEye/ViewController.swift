//
//  ViewController.swift
//  BullsEye
//
//  Created by Joyce on 6/18.
//

import UIKit

class ViewController: UIViewController {

  // slider的值
  // 遊戲目標數字的值
  var currentValue: Int = 0
  var targetValue : Int = 0
  var score = 0
  var round = 0
    
  
  // 連接到介面的slider
  @IBOutlet weak var slider: UISlider!
  @IBOutlet weak var targetLabel: UILabel!
  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet weak var roundLabel : UILabel!
  
  // 初始設定
  override func viewDidLoad() {
    super.viewDidLoad()
    // 將slider的值四捨五入並設定到 currentValue
    let roundedValue = slider.value.rounded()
    currentValue = Int(roundedValue)
    startNewRound()
      
    let thumbImageNormal = UIImage(named:"SliderThumb-Normal")
    slider.setThumbImage(thumbImageNormal, for: .normal)
      
    let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")
    slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
      
    let insets = UIEdgeInsets(top : 0, left : 24, bottom: 0, right : 14)
      
    let trackLeftImage = UIImage(named: "SliderTrackLeft")
    let trackLeftResizable = trackLeftImage?.resizableImage(withCapInsets: insets)
    slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
      
    let trackRightImage = UIImage(named: "SliderTrackRight")
    let trackRightResizable = trackRightImage?.resizableImage(withCapInsets: insets)
    slider.setMaximumTrackImage(trackRightResizable, for: .normal)
  }

  // 跳出來的訊息
  @IBAction func showAlert() {
    /*
    var difference = currentValue - targetValue
      if difference<0{
          difference *= -1
      }
    */
      
    // 計算差距，用絕對值
    let difference = abs(currentValue - targetValue)
    var points = 100 - difference
    score += points
    
    let title : String
    if difference == 0{
          title = "Perfect!🤩"
          points += 100
      }else if difference < 5{
          title = "Awesome!🥹"
          points += 50
      }else if difference < 10{
          title = "a little Good!🥹"
      }else{
          title = "Not even close😊"
      }
      
    // 組合顯示訊息，slider目前值
    //let message = "The value of the slider is now: \(currentValue)" + "\n The target value is: \(targetValue)" + "\n The 差距 is: \(difference)"
    let message = "The 差距 is: \(difference)" + "\nYou score: \(points)"
    
    // 跳出的視窗
    // preferredStyle 有 .actionSheet 和 .alert 兩種
    let alert = UIAlertController(title: "\(title)", message: message, preferredStyle: .alert)
    
    // 訊息下方按鈕，標題為 "OK"。handler means the action when the buttom is clicked.
    let action = UIAlertAction(title: "OK", style: .default, handler: {
        action in
        self.startNewRound()
    })
    
    // 將動作按鈕添加到警告控制器
    alert.addAction(action)
    
    // 顯示警告控制器
    present(alert, animated: true, completion: nil)
    
  }
  
  // slider移動時的動作
  @IBAction func sliderMoved(_ slider: UISlider) {
    // slider的值四捨五入並設定到 currentValue
    let roundedValue = slider.value.rounded()
    currentValue = Int(roundedValue)
  }
  func startNewRound(){
      round += 1
      targetValue = Int.random(in: 1...100)
      currentValue = 50
      slider.value = Float(currentValue)
      updateLabels()
  }
    func updateLabels(){
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
        
    }
}
