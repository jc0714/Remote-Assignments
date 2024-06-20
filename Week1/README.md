//:Part1 : Git & GitHub
1. **Done**
2. Meaning and use case

    a. ** git status： **查看目前工作目錄和暫存區的狀態
    - **使用時機**: 用於檢查哪些文件已經被修改但未提交，哪些文件已經被暫存。

    b. **git diff：**呈現未儲存內容和已儲存內容的差異
    - **使用時機**: 看尚未 push 的變動。
    
    c. **git add：放到** staging area
    - **使用時機**: push 前的動作。

    d. **git reset：**Reset the staging area and working directory states
    - **使用時機**: 用於撤銷已經暫存的更改或回退到某個特定的提交版本。

    e. **git commit：**Commit the staged changes to the local repository
    - **使用時機**: 要儲存到暫存區。

    f. **git log：**顯示歷史記錄。
    - git log --oneline -n，`git log --oneline -3` 可以看到近三次的編輯紀錄
    - **使用時機**: 想看歷史動作。

    g. **git branch：**列出 ** ** branches
    - **使用時機**: 用於管理分支，查看當前分支列表或創建新分支。

    h. **git merge：**合併 branches
    - **使用時機**: ？

    i. **git push [repo_name] [branch_name]：推到 GitHub 上面。**
    - **使用時機**: 將電腦裡的內容同步到 GitHub 上。
    
    j. **git remote：**Manage remote repositories
    - **使用時機**: ？

    k. **fork：**從別人的 GitHub repository 中複製一份到自己的 repository
    - **使用時機**: 想要用別人的檔案時。
    
3. 
    1. 在 GitHub 開一個 repo
    2. 在 terminal 打 `git clone` [`https://github.com/jc0714/amazingOne.git`](https://github.com/jc0714/amazingOne.git)
    3. `cd` amazingOne：走進資料夾
    4. `git log`：關心檔案的狀況
        1. `git log -p` ：更詳細
    5. `vim` 文件名稱：把他叫出來看看他，可以編輯
        1. 進來之後，按 `i` 可以進入 insert mode.
        2. insert 完畢，按 `esc` 
        3. 打 `:wq` ，就可以順利退出啦
    6. `git add .` ：先放到暫存區（攝影棚），準備 commit 
    7. `git commit -m` ”你做了什麼的筆記”：（拍張照！）terminal 會出現你做了幾個改變
    8. `git push` ：把他推到 gitHub 上面去
    
##Part2

1. 用 let 建立 constant，給值以後不能更改，不然會出線錯物，較為嚴格。用 var 建立變數，數值會變來變去時適合使用。
2. var pi : Float = 3.14159 
3. let x : Int = 8
let y : Int = 29
let average = (x+y)/2
4. (1) let average  : Float = (x+y)/2.0
(2) (10/3) 結果為 3，捨棄小數部分；(10.0/3.0) 結果為 3.3333
5. let x : Int = 10
let y : Int = 3
let remainder : Int = 10%3
6. `var flag = true
var inputString = "Hello world."
let bitsInBite = 8
let averageScore = 86.8`
    
    var flag : Bool = true
    var inputString : String= "Hello world."
    let bitsInBite : Int = 8
    let averageScore: Double = 86.8
    
7. What is Type Inference in Swift? Swift 會自己分辨變數/ 常數的類型，以第六題為例，他會看出這些非別是 布林值、字串、整數、浮點數。
8. 一開始將 phoneNumber 設定為整數，接著又賦予它字串，這樣會 error。
9. var salary : Int =22000
salary += 28000
10. 等於可以用 == 表示

##Part3
var myFriends: [String] = []
myFriends += ["Ian", "Bomi", "Kevin"]

myFriends.append("Michael")
print(myFriends)

myFriends.insert("Kevin", at: 0)

myFriends.remove(at: 3)
