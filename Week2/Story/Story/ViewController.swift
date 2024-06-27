//
//  ViewController.swift
//  Story
//
//  Created by J oyce on 2024/6/25.
//
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var funFactLabel: UILabel!
    @IBOutlet weak var showButton: UIButton! //想要按鈕上的文字一起變色，但研究了好幾個小時他都沒有變 傷心
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

let funFacts = [
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas tempus.",
    "Contrary to popular belief, Lorem Ipsum is not simply random text.",
    "Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur",
    "from a Lorem Ipsum passage, and going through the cites of the word",
    "This book is a treatise on the theory of ethics, very popular during the Renaissance.",
    "The first line of Lorem Ipsum, Lorem ipsum dolor sit amet.."
]

extension ViewController {
    @IBAction func showFunFact(_ sender: UIButton) {
        // 用 random index 隨機出數字
        let randomIndex = Int.random(in: 0..<funFacts.count)
        let randomFact = funFacts[randomIndex]
        
        funFactLabel.text = randomFact
        
        let randomColor = getRandomColor()
        view.backgroundColor = randomColor
        
        sender.setTitleColor(randomColor, for: .normal) //這句好像沒用？
        
    }
    
    //RGB + random 隨機浮點數創造隨機顏色
    func getRandomColor() -> UIColor {
        let red = CGFloat.random(in: 0...1)
        let green = CGFloat.random(in: 0...1)
        let blue = CGFloat.random(in: 0...0.8)
        return UIColor(red: red, green: green, blue: blue, alpha: 1) // 透明度
    }
}



