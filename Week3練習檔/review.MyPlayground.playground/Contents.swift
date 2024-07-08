enum Coin: Double {
  case penny = 0.01
  case nickel = 0.05
  case dime = 0.10
  case quarter = 0.25
}

let coinPurse: [Coin] = [.penny, .nickel, .dime, .quarter]

let total = coinPurse.reduce(0.0) { (result, c) -> Double in
  let newTotal = result + c.rawValue
  print("the result now is \(result), Added \(c.rawValue), new total: \(newTotal)")
  return newTotal
}

print("Total amount in coin purse: $\(total)")
