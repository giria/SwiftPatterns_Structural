//: [Previous](@previous)


/*:
 
 # Bridge
 
 Separates common and different functionality into different hierarchies.
 
 
Example, given we want to provide support for light and dark themes:
 
 ![example](themes.png)
 
 This does not scales well and provokes a "explosion class hierrachies" problem.
 The solution is to use the bridge pattern. The bridge pattern stops the proliferation of sub classes.
 
 ![UML](bridge.png)
 
 
 Besides, it introduces a separation that lets us modify either side independently to add a new theme.
 
 The UML diagram:
 
 ![UML](bridgeUML.png)
 
 */
import Foundation

var greeting = "Hello, playground"

//: [Next](@next)
