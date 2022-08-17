//: [Previous](@previous)



/*:
 
 # Proxy
 
 Provides controlled access to an object through a surrogate.
 
 
 The UML diagram is:
 
 ![proxy](proxyUML.png)
 
 */

import Foundation

print("The app is loading...")
let dbController = makeDatabaseController()
print("Ready")

// ...
let contextChanged = true
// ...
if contextChanged {
    dbController.save()
}

//: [Next](@next)
