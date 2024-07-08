//: [⇐ Previous: 04 - Lazy Properties](@previous)
//: ## Episode 05: Challenge - Properties

/*:
 ## Challenge 1
 Create a struct named `Temperature` with properties for degrees in both Celsius and Fahrenheit, as `Double`s.
 * _Hint 1_: One property must be stored, but the other can be computed. They should always stay in sync.
 * _Hint 2_: To convert from Fahrenheit to Celsius, subtract 32, then divide by 1.8.
*/

// TODO: Write solution here
/*
struct Temperature{
    var Temp_F : Double // 使用者輸入
    var Temp_C : Double{
        get{return (Temp_F - 32)/1.8}
        //set{Temp_F = newValue * 1.8 + 32}
    }
}

var Temp = Temperature(Temp_F: 85)
Temp.Temp_C
 */
/*:
 ## Challenge 2
 Modify the Fahrenheit property to print out a warning message if it is set to above 100 degrees.
*/
struct Temperature{
    var Temp_F : Double {// 使用者輸入
        didSet {
            if Temp_F > 100{
                print("\(Temp_F) is IMPOSSIBLE!!!")
            }
        }
    }

    var Temp_C : Double{
        get{return (Temp_F - 32)/1.8}
        //set{Temp_F = newValue * 1.8 + 32}
    }
}

var Temp = Temperature(Temp_F: 2325)
Temp.Temp_C
var Temp2 = Temperature(Temp_F: 2325)
Temp2.Temp_F = 2323
/*:
 ## Challenge 3
 Make the `monthsUntilJingleBells` and `season` functions into computed properties of `Month`.
 - Computed properties must be variable
 - To refer to an enum instance inside of a computed property, use `self`
*/

// --------------------------------------
enum Season: String, CaseIterable {
  case winter, spring, summer, autumn
}
// --------------------------------------


enum Month: Int {
  case january = 1, february, march, april, may, june, july, august, september, october, november, december
  
  // TODO: Write solution here
}


// --------------------------------------
func monthsUntilJingleBells(from month: Month) -> Int {
  Month.december.rawValue - month.rawValue
}

func season(for month: Month) -> Season {
  switch month {
  case .december, .january, .february:
    return .winter
  case .march, .april, .may:
    return .spring
  case .june, .july, .august:
    return .summer
  case .september, .october, .november:
    return .autumn
  }
}
// --------------------------------------

//: [⇒ Next: 06 - Methods](@next)

