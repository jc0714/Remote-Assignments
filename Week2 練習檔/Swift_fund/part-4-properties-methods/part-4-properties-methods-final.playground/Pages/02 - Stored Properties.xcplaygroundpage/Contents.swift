//: [⇐ Previous: 01 - Introduction](@previous)
//: ## Episode 02: Stored Properties

struct Wizard {
  static var commonMagicalIngredients = [
    "Polyjuice Potion",
    "Eye of Haystack Needle",
    "The Force"
  ] {
    didSet { //didSet:在屬性被設置後立即執行的 code
      print("Magical Ingredients updated! Common stock now contains \(commonMagicalIngredients)")
    }
  }
  
  var firstName: String {
    willSet { //willSet：在屬性準備被設置新值之前執行的 code。這裡用來印出舊值和新值。
      print(firstName + " will be set to " + newValue)
    }
    didSet {
      if firstName.contains(" ") {
        print("No spaces allowed! \(firstName) is not a first name. Reverting name to \(oldValue).")
        firstName = oldValue
      }
    }
  }
  var lastName: String
}

var wizard = Wizard(firstName: "Gandalf", lastName: "Greyjoy")
wizard.firstName = "Hermione"
wizard.lastName = "Kenobi"
wizard
wizard.firstName = "Merlin Rincewind"
Wizard.commonMagicalIngredients.append("Wow-Wow Sauce")
Wizard.commonMagicalIngredients.append("Cry-Cry Cream")






//: [⇒ Next: 03 - Computed Properties](@next)
