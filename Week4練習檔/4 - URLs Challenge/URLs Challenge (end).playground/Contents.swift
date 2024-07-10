/*:
 Copyright (c) 2018 Razeware LLC
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.
 
 Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
 distribute, sublicense, create a derivative work, and/or sell copies of the
 Software in any work that is designed, intended, or marketed for pedagogical or
 instructional purposes related to programming, coding, application development,
 or information technology.  Permission for such use, copying, modification,
 merger, publication, distribution, sublicensing, creation of derivative works,
 or sale is expressly withheld.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 
 ---
 */
// 建立 URL mysteryDataURL，這個 URL 指向一個名為 "mystery" 的文件，該文件相對於文件管理器的文件目錄（document directory）。
import Foundation

let mysteryDataURL = URL(
  fileURLWithPath: "mystery",
  relativeTo: FileManager.documentDirectoryURL
)
//: ## String
// 建立 URL stringURL，它指向文件目錄下的一個名為 "string.txt" 的文件。
// 首先，FileManager.documentDirectoryURL 獲取文件目錄的 URL，然後 appendingPathComponent("string") 添加文件名 "string"，最後 appendingPathExtension("txt") 添加文件擴展名 ".txt"。
let stringURL =
  FileManager.documentDirectoryURL
  .appendingPathComponent("string")
  .appendingPathExtension("txt")
//: ## Challenge
// 建立一個 URL challengeStringURL，它指向文件目錄下的一個名為 "low F#.txt" 的文件。
// 首先，變量 challengeString 儲存字符串 "low F#"。接著，URL(fileURLWithPath:challengeString, relativeTo:FileManager.documentDirectoryURL) 建立一個相對於文件目錄的 URL，然後 appendingPathExtension("txt") 添加文件擴展名 ".txt"。
// 最後，challengeStringURL.lastPathComponent 獲取該 URL 的最後一部分，即 "low F#.txt"。

let challengeString = "low F#"
let challengeStringURL = URL(fileURLWithPath: challengeString, relativeTo: FileManager.documentDirectoryURL).appendingPathExtension("txt")
challengeStringURL.lastPathComponent
