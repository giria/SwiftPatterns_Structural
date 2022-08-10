//: [Previous](@previous)
/*:
 
 # Composite
 
 Makes it easier to work with sample and complex objects organized in tree structures.
 
 The UML protocol:
 
 [UML](uml.png)
 
 In the above UML class diagram, the Client class doesn't refer to the Leaf and Composite classes directly (separately). Instead, the Client refers to the common Component interface and can treat Leaf and Composite uniformly.
 The Leaf class has no children and implements the Component interface directly.
 The Composite class maintains a container of child Component objects (children) and forwards requests to these children (for each child in children: child.operation()).
 */

protocol Payee {
  var name: String { get }
  var bonusAmount: Double { get }
  func receive(bonus: Double)
}

class Employee: Payee {
  // 1
  private var _name: String
  private var _bonusAmount: Double = 0
  
  var name: String { return _name }
  var bonusAmount: Double { return _bonusAmount }
  
  init(name: String) {
    self._name = name
  }
  
  // 2
  func receive(bonus: Double) {
    _bonusAmount += bonus
  }
}
class Department: Payee {
  private var _name: String
// 1
  private var _bonusAmount: Double {
    get {
      var bonus = 0.0
      
      for subunit in subunits {
        bonus += subunit.bonusAmount
      }
      return bonus
    }
    set {
      let splitCount = Double(subunits.count)
      let splitBonus = newValue / splitCount
      for subunit in subunits {
        subunit.receive(bonus: splitBonus)
      }
    }
  }
  // 2
  private let subunits: [Payee]

  var name: String { return _name }
  var bonusAmount: Double { return _bonusAmount }
  
  init(name: String, subunits: [Payee] = []) {
    self._name = name
    self.subunits = subunits
  }
  
  func receive(bonus: Double) {
    _bonusAmount += bonus
  }
}

// 1
let joan = Employee(name: "Joan")
let tom = Employee(name: "Tom")
let cleo = Employee(name: "Cleo")
let alex = Employee(name: "Alex")

// 2
let graphicDesignDepartment = Department(name: "Graphic Design", subunits: [cleo, alex])
let marketingDepartment = Department(name: "Marketing", subunits: [joan, tom, graphicDesignDepartment])

// 3
marketingDepartment.receive(bonus: 1000)

let employes = [joan, tom,  cleo, alex]
for employee in employes {
    print("Employee: \(employee.name) Bonus: \(employee.bonusAmount)")
}


//: [Next](@next)
