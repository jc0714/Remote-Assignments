//: [⇐ Previous: 04 - Overloading](@previous)
//: ## Episode 05 - Advanced Parameters
// --------------------------------------
let passingGrade = 50
let jessyGrade = 49
let ozmaGrade = 87
let ozmaAllGrades = [60, 96, 87, 42]
// --------------------------------------

//: ### Variadic Parameters

print(jessyGrade, ozmaGrade, "meow")

func getHighestGrade(for grades: Int...) -> Int {
  grades.max() ?? 0
}

getHighestGrade()
getHighestGrade(for: jessyGrade, ozmaGrade)
//getHighestGrade(for: ozmaAllGrades)

func greet(_ names: String..., with greeting: String...) -> String {
    var result = ""
    for name in names {
        for gt in greeting{
            result += "\(gt)，\(name)！\n"
        }
    }
    return result
}

// Ex：
let greetings = greet("Alice", "Bob", "Charlie", with: "你好", "早", "Night")
print(greetings)

// greetings 的值是：
// 你好，Alice！
// 你好，Bob！
// 你好，Charlie！



//: ### Inout Parameters

// --------------------------------------
var count = 0
// --------------------------------------

func incrementAndPrint(_ value: inout Int) {
  value += 1
  print(value)
}

incrementAndPrint(&count)
incrementAndPrint(&count)
count


//: [⇒ Next: 06 - Challenge - Overloads & Parameters](@next)
