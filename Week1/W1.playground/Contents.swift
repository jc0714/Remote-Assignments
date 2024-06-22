//: # Part1 : Git & GitHub
//: 1. **Done**
//: 2. Meaning and use case
//:
//:     a. **`git status:`** 查看目前工作目錄和暫存區的狀態
//:     - **使用時機:** 用於檢查哪些文件已經被修改但未提交，哪些文件已經被暫存。
//:
//:     b. **`git diff:`** 呈現未儲存內容和已儲存內容的差異
//:     - **使用時機:** 看尚未 push 的變動。
//:
//:     c. **`git add:`** 放到 staging area
//:     - **使用時機:** push 前的動作。
//:
//:     d. **`git reset:`** Reset the staging area and working directory states
//:     - **使用時機:** 用於撤銷已經暫存的更改或回退到某個特定的提交版本。
//:
//:     e. **`git commit:`** Commit the staged changes to the local repository
//:     - **使用時機:** 要儲存到暫存區。
//:
//:     f. **`git log:`** 顯示歷史記錄。
//:     - `git log --oneline -n`，`git log --oneline -3` 可以看到近三次的編輯紀錄
//:     - **使用時機:** 想看歷史動作。
//:
//:     g. **`git branch:`** 列出 branches
//:     - **使用時機:** 用於管理分支，查看當前分支列表或創建新分支。
//:
//:     h. **`git merge:`** 合併 branches
//:     - **使用時機:** 合併分支的變更。
//:
//:     i. **`git push [repo_name] [branch_name]:`** 推到 GitHub 上面
//:     - **使用時機:** 將電腦裡的內容同步到 GitHub 上。
//:
//:     j. **`git remote:`** Manage remote repositories
//:     - **使用時機:** 查看、添加或移除遠程倉庫。
//:
//:     k. **`fork:`** 從別人的 GitHub repository 中複製一份到自己的 repository
//:     - **使用時機:** 想要用別人的檔案時。
//:
//: 3. **How to build a repo?**
//: - 在 GitHub 開一個 repo
//: - 在 terminal 打 `git clone https://github.com/jc0714/amazingOne.git`
//: - `cd amazingOne`：走進資料夾
//: - `git log`：關心檔案的狀況
//:   - `git log -p` ：更詳細
//: - `vim` 文件名稱：把他叫出來看看他，可以編輯
//:   - 進來之後，按 `i` 可以進入 insert mode.
//:   - insert 完畢，按 `esc`
//:   - 打 `:wq` ，就可以順利退出啦
//: - `git add .` ：先放到暫存區（攝影棚），準備 commit
//: - `git commit -m` ”你做了什麼的筆記”：（拍張照！）terminal 會出現你做了幾個改變
//: - `git push` ：把他推到 gitHub 上面去

//: # Part2

//: 1. 用 `let` 建立 constant，給值以後不能更改，不然會出錯，較為嚴格。用 `var` 建立變數，數值會變來變去時適合使用。
//: 2. `var pi: Float = 3.14159`
// 3.
let x: Int = 8
let y: Int = 29
let average = (x + y) / 2
// 4.(1)
let Average: Float = Float(x + y) / 2.0
//: 4.(2)
//: - `10 / 3` 結果為 `3`，捨棄小數部分；`10.0 / 3.0` 結果為 `3.3333`

// 5.

let xx: Int = 10
let yy: Int = 3
let remainder: Int = xx % yy

// 6.
/* var flag = true
var inputString = "Hello world."
let bitsInBite = 8
let averageScore = 86.8 */

var flag: Bool = true
var inputString: String = "Hello world."
let bitsInBite: Int = 8
let averageScore: Double = 86.8


//: 7. **What is Type Inference in Swift?** Swift 會自動推斷變數或常數的類型。以第六題為例，它會自動辨識這些變數或常數的類型包括布林值、字串、整數、浮點數。
//: 8. 一開始將 `phoneNumber` 設定為整數，接著又賦予它字串，這樣會產生錯誤。
// 9.
var salary: Int = 22000
salary += 28000
// 10.
//:等於可以用 `==` 表示。

//: # Part3
//1
var myFriends: [String] = []

//2
myFriends += ["Ian", "Bomi", "Kevin"]

//3
myFriends.append("Michael")
print(myFriends)

//4
myFriends.swapAt(0,2)
print(myFriends)

/*
myFriends.insert("Kevin", at: 0)
myFriends.remove(at: 3)
print(myFriends)
*/

//5
for friend in myFriends {
    print(friend)
}

//6
if myFriends.count > 4 {
    print(myFriends[4])
} else {
    print("Index out of range")
}

//7
myFriends.first

//8
myFriends.last

//9
var myCountryNumber: [String : Int] = [ : ]

//10
myCountryNumber.merge(["US": 1, "GB": 44, "JP": 81]) { (current, _) in current }

//11
myCountryNumber["GB"] = 0
print(myCountryNumber)

//12
var emptyDictionary : [Int: String] = [:]

//13
myCountryNumber.removeValue(forKey: "GB")
print(myCountryNumber)

//: # Part 4
//1
let lottoNumbers = [10,9,8,7,6,5]

for num in 3..<6{
    print(lottoNumbers[num])
}

for num in (lottoNumbers.count - 3)..<lottoNumbers.count {
    print(lottoNumbers[num])
}

//2-1
for num in 1..<lottoNumbers.count+1 {
    var i = lottoNumbers.count - num
    print(lottoNumbers[i])
}

//2-2
for num in stride(from: 0, to: 6, by: 2){
    print(lottoNumbers[num])
}

//3-1
var num1 = 1
while num1 < lottoNumbers.count + 1 {
    let i = lottoNumbers.count - num1
    print(lottoNumbers[i])
    num1 += 1
}

//3-2
var num = 0
while num < 6 {
    print(lottoNumbers[num])
    num += 2
}

//4-1
var num4_1 = 1
repeat{
    let i = lottoNumbers.count - num4_1
    print(lottoNumbers[i])
    num4_1 += 1
} while num4_1 < lottoNumbers.count + 1

//4-2
var num4_2 = 0
repeat{
    print(lottoNumbers[num4_2])
    num4_2 += 2
} while (num4_2 < 6)

//5
//: `while` check condition first, if yes, 就執行動作
//: `repeat-while` 先執行動作，再看條件是否為 true，是的話就再執行一次。至少會先執行一次。
//6
func isRaining(isRaining : Bool){
    if isRaining == true{
        print("It’s raining, I don’t want to work today.")
    }else{
        print("Although it’s sunny, I still don’t want to work today.")
    }
}

isRaining(isRaining: true)
isRaining(isRaining: false)

//7
func whoAreYou_if(jobLevel: Int){
    if jobLevel == 1{
        print("Member")
    }else if jobLevel == 2{
        print("Team Leader")
    }else if jobLevel == 3{
        print("Manager")
    }else if jobLevel == 4{
        print("Director")
    }else{
        print("We don't have this job")
    }
}

func whoAreYou_switch(jobLevel: Int){
    switch jobLevel{
    case 1:
        print("Member")
    case 2:
        print("Team Leader")
    case 3:
        print("Manager")
    case 4:
        print("Director")
    default:
        print("We don't have this job.")
    }
}
whoAreYou_if(jobLevel: 3)
whoAreYou_switch(jobLevel: 5)

//: # Part 5
//: 1. 分別是字串和浮點數
//2
func multiply(a : Int , b : Int = 10 ){
    print( a * b )
}
multiply(a: 7)
//: 3
//: parameter name 是 function 裡面會使用的參數名稱，argument label 是在呼叫 function 時的標籤。
/*
func greet(name person: String){
    print("Hello, \(person).") -> parameter name：function 內部用
}
greet(name: "Joyce") -> argument label：呼叫，使用者比較知道這裡填這個值要幹嘛
*/
 
//4
func greet(name person: String){
    print("Hello, \(person).")
}
greet(name: "Joyce")
