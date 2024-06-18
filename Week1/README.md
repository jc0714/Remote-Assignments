##Part 2

用 let 建立 constant，給值以後不能更改，不然會出線錯物，較為嚴格。用 var 建立變數，數值會變來變去時適合使用。

var pi : Float = 3.14159

let x : Int = 8 let y : Int = 29 let average = (x+y)/2

(1) let average : Float = (x+y)/2.0 (2) (10/3) 結果為 3，捨棄小數部分；(10.0/3.0) 結果為 3.3333

let x : Int = 10 let y : Int = 3 let remainder : Int = 10%3

var flag = true var inputString = "Hello world." let bitsInBite = 8 let averageScore = 86.8`

var flag : Bool = true var inputString : String= "Hello world." let bitsInBite : Int = 8 let averageScore: Double = 86.8

What is Type Inference in Swift? Swift 會自己分辨變數/常數的類型，以第六題為例，他會看出這些非別是 布林值、字串、整數、浮點數。

一開始將 phoneNumber 設定為整數，接著又賦予它字串，這樣會 error。

var salary : Int =22000 salary += 28000

等於可以用 == 表示
