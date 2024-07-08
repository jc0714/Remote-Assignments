/**
 * Copyright (c) 2018 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import UIKit

final class ViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let views: [UIView] = [.red, .green, .blue].map {(color: UIColor) in
      let view = UIView()
      view.translatesAutoresizingMaskIntoConstraints = false
      view.backgroundColor = color
      return view
    }
    
    views.forEach(view.addSubview)
    
    NSLayoutConstraint.activate(
      ["H": 8, "V": 20].flatMap {direction, gap in
        NSLayoutConstraint.constraints(
          withVisualFormat: "\(direction):[upperLeft(size)]-(gap)-[middle(size)]-(gap)-[bottomRight(size)]",
          metrics: ["gap": gap, "size": 50],
          views: Dictionary(
            uniqueKeysWithValues: zip(["upperLeft", "middle", "bottomRight"], views)
          )
        )
      }
      + [
        views[1].centerXAnchor.constraint(equalTo: view.centerXAnchor),
        views[1].centerYAnchor.constraint(equalTo: view.centerYAnchor)
      ]
    )
  }
}






