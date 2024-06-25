//: # Part1
// 1.

enum Gender {
    case male, female, undefined
}

//Animal 大 class
class Animal {
    var gender: Gender
    
    init(gender: Gender) {
        self.gender = gender
    }
    
    func eat() {
        print("I eat everything!")
    }
}

//let animal1 = Animal(gender: .undefined)
//animal1.eat()
//:2 .
//: Declare three classes: Elephant , Tiger , Horse that inherits from Animal and override the eat() method to print what they usually eat.
class Elephant: Animal {
    override func eat() {
        print("I eat plants and fruits.")
    }
}
class Tiger: Animal {
    override func eat() {
        print("I eat meat.")
    }
}
class Horse: Animal {
    override func eat() {
        print("I eat grass.")
    }
}
//let elephant = Elephant(gender: .male)
//let tiger = Tiger(gender: .female)
//let horse = Horse(gender: .undefined)
//:3 .
//: Declare a class Zoo with a property weeklyHot which means the most popular one in the zoo this week. The codes below can’t work correctly, please find what data type should A be and solve the problem. Note that tiger , elephant , and horse are instances of class Tiger, Elephant, and Horse respectively.
class Zoo {
var weeklyHot: Animal // 定義本週最受歡迎動物屬性，類型為動物
    init(weeklyHot: Animal ) {
        self.weeklyHot = weeklyHot // 設定本週最受歡迎動物屬性
    }
}
let tiger = Tiger(gender: .male)
let elephant = Elephant(gender: .female)
let horse = Horse(gender: .undefined)

let zoo = Zoo(weeklyHot: tiger)

zoo.weeklyHot = elephant
zoo.weeklyHot = horse
// print(zoo.weeklyHot)

//: # Part2
/*There are several gasoline types, 92, 95, 98, and diesel that we can use enum to model them.
 ● Please declare an enum named Gasoline to model gasoline.
 ● Every kind of gasoline has its price. Please declare a "computed property" named price and a "method" named getPrice separately in Gasoline enum that both will return different prices depending on different gasoline.
 ● Please establish raw values for Gasoline. The data type of raw value should be String. For example, Gasoline.oil92.rawValue should be “92”.
 ● Please explain what enum associated value is and how it works.
 */

enum Gasoline: String {
    case oil92 = "92"
    case oil95 = "95"
    case oil98 = "98"
    case diesel = "Diesel"
    
    var price: Double {
        switch self {
        case .oil92:
            return 2.92
        case .oil95:
            return 2.95
        case .oil98:
            return 2.98
        case .diesel:
            return 3
        }
    }
    
    func getPrice() -> Double {
        switch self {
        case .oil92:
            return 2.92
        case .oil95:
            return 2.95
        case .oil98:
            return 2.98
        case .diesel:
            return 3
        }
    }
}

let gasolineType = Gasoline.oil95
print("The price of \(gasolineType.rawValue) is \(gasolineType.price)")
print("The price of \(gasolineType.rawValue) using method is \(gasolineType.getPrice())")

// 1-4
// associated value：一個 case 可以帶著不同屬性的值。可以在呼叫時填入不同的值，比較方便，靈活性高、易改。
enum Gasoline_associatedValue {
    case oil92(price: Double)
    case oil95(price: Double)
    case oil98(price: Double)
    case diesel(price: Double)
}
let gas = Gasoline_associatedValue.oil92(price: 2.50)

/*Optional is a very special data type in Swift. Take var a: Int? = 10 for example, thevalue of a will be nil or Int . You should  have learned how to deal with Optional.
 ● People would like to have pets, but not everyone could have one. Declare a class Pet with name property and a class People with pet property which will store a Pet instance or nil. Please try to figure out what data type is suitable for these properties in Pet and People.
 ● Please create a People instance. Use guard let to unwrap the pet property and print its name.
 ● Please create another People instance. Use if let to unwrap the pet property and print its name.*/
class Pet {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}
class People {
    var pet: Pet?
    init(pet: Pet?) {
        self.pet = pet
    }
}


//: # Part3
/*1. Declare a struct Person with a name property type String and a protocol name PoliceMan . There is only one method arrestCriminals with no argument in the protocol.
 2. Make struct Person conform to PoliceMan protocol.
 3. Declare a protocol ToolMan with a method fixComputer that has no argument.
 4. Add a property toolMan to the struct Person with data type ToolMan .
 5. Declare a struct named Engineer that conforms to the ToolMan protocol.
 6. Create a Person instance with the name “Steven” and also create the relative data you need to declare this instance.
*/
//1


//: # Part 4
//1
enum GuessNumberGameError : Error{
    case wrongNumber
}
class GuessNumberGame {
    var targetNumber = 10
    func guess(number: Int) throws {
        guard number == targetNumber else {
            throw GuessNumberGameError.wrongNumber //拋出錯誤
        }
        print("Guess the right number: \(targetNumber)")
    }
}

let game = GuessNumberGame()
do {try game.guess(number: 20)  // 在do裡面放可能會出錯的東東
}catch GuessNumberGameError.wrongNumber { //catch在這把錯誤抓住，做下一步動作
    print("Wrong number guessed.")
}
