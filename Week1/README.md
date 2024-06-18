##Part1 : Git & GitHub
1. **Done**
2. Meaning and use case
    a. git status
    b. git diff
    c. git add
    d. git reset
    e. git commit
    f. git log
    g. git branch
    h. git merge
    i. git push [ repo_name ] [ branch_name ]
    j. git remote
    k. fork
    l. (Advanced) git rebase
    m. (Advanced) git cherry-pick
    n. (Advanced) git reflog
    o. (Advanced) git tag
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

