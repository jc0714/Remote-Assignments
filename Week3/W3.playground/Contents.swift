//: # Part1
//: 1 . What is a closure ? How to execute a closure?
// closure 沒有名稱，而 function 有名稱。
// closure 語法把 Function 名稱右邊參數列與回傳型別放到{右邊然後加上in，其餘不變。
// function
func greeting() {
    print("hello world")
}
// closure
var greet = {(name :String)->() in
    print("hello \(name)")
}
// execute closure
greet("Joy")

//: 2 . Please declare a closure whose input type is Int, output type is Bool. The functionality of this closure is to verify if the input is odd or not. Return true if it’s odd and vice versa.
var oddornot = {(num: Int)-> () in
    (num%2) == 0 ? print("even number"):print("odd number")
}
    
oddornot(6)
oddornot(13)

// 3.
func printTriangle(layers: Int) { // TODO: print a triangle
    for x in 1..<(layers+1){
        print(String(repeating: "*", count: x) )
    }
}
printTriangle(layers: 5)
