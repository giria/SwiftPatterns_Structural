

/*:
 
 # Adapter Pattern
 
 **Allows integrating incompatible interfaces without client code changes.**
 
 The adapter pattern is a software design pattern (also known as wrapper, an alternative naming shared with the decorator pattern) that allows the interface of an existing class to be used as another interface. It is often used to make existing classes work with others without modifying their source code.
 
 
 We often encounter types with incompatible interfaces, yet we need to make them work together. That's usually the case. We're working with third party frameworks. We don't own the source code so we can change the incompatible interface.
 
 ![thirdParty](adapter1.png)
 
 
 The UML diagram is:
 
 ![UML](adapterUML.png)
 
 */





import UIKit

var greeting = "Hello, playground"
