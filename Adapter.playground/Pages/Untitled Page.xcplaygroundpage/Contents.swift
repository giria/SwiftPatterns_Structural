

/*:
 
 # Adapter Pattern
 
 **Allows integrating incompatible interfaces without client code changes.**
 
 The adapter pattern is a software design pattern (also known as wrapper, an alternative naming shared with the decorator pattern) that allows the interface of an existing class to be used as another interface. It is often used to make existing classes work with others without modifying their source code.
 
 
 We often encounter types with incompatible interfaces, yet we need to make them work together. That's usually the case. We're working with third party frameworks. We don't own the source code so we can change the incompatible interface.
 
 ![thirdParty](adapter1.png)
 
 
 The UML diagram is:
 
 ![UML](adapterUML.png)
 
 */





import Foundation

protocol Sharing {
    func post(message: String) -> Bool
}

class FBSharer: Sharing {
    func post(message: String) -> Bool {
        print("Message \(message) shared on Facebook")
        return true
    }
}

class TwitterSharer: Sharing {
    func post(message: String) -> Bool {
        print("Message \(message) shared on Twitter")
        return true
    }
}

// Third-party class - we cannot modify its implementation
public class RedditPoster {
    public func share(text: String,
                      completionHandler: ((Error?) -> Void)?) {
        print("Message \(text) posted to Reddit")
        completionHandler?(nil)
    }
}

extension RedditPoster: Sharing {
    func post(message: String) -> Bool {
        self.share(text: message, completionHandler: nil)
        return true
    }
}

public enum Platform: CustomStringConvertible {
    case facebook
    case twitter
    case reddit

    public var description: String {
        switch self {
        case .facebook:
            return "Facebook Sharer"
        case .twitter:
            return "Twitter Sharer"
        case .reddit:
            return "Reddit Poster"
        }
    }
}


// Sharer utility
// A naive approach to integrate the incompatible RedditPoster type
public class Sharer {
    private let services: [Platform: Sharing] = [.facebook: FBSharer(),
                                                 .twitter: TwitterSharer(),
                                                 .reddit: RedditPoster()]

    private lazy var redditPoster = RedditPoster()

    public func share(message: String,
                      serviceType: Platform) {
        guard let service = services[serviceType] else {
            return
        }
        service.post(message: message)
    }

    public func shareEverywhere(message: String) {
        for service in services.values {
            service.post(message: message)
        }
    }
}

// Testing
let sharer = Sharer()
sharer.shareEverywhere(message: "First post!")
