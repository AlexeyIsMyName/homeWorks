import Foundation

class Human {
    var weight: Int
    var age: Int
    
    init(weight: Int, age: Int) {
        self.weight = weight
        self.age = age
    }
    
    convenience init(age: Int) {
        self.init(weight: 0, age: age)
    }
    
    convenience init(weight: Int) {
        self.init(weight: weight, age: 0)
    }
    
    convenience init() {
        self.init(weight: 0)
    }
    
    func test(){}
    
    deinit {
        print("Human deinitialized")
    }
}

enum Color: Int {
    case Black
    case White
    
    init?(_ value: Int) {
        switch value {
        case 0: self = .Black
        case 1: self = .White
        default: return nil
        }
    }
}

let a = Color(2)
//let b = Color(rawValue: 0)

struct Size {
    var width: Int
    var height: Int
    
    init?(width: Int, height: Int) {
        self.width = width
        if height < 0 {
            return nil
        }
        self.height = height
    }
}

class Friend: Human {
    var name: String
    
    let skin: Color = {
        let random = Int(arc4random_uniform(2))
        return Color(random)!
    }()
    
    init?(name: String) {
        self.name = name
        super.init(weight: 0, age: 0)
        if name.isEmpty {
            return nil
        }
    }
    
    required init() {
        self.name = "Hi!"
        super.init(weight: 0, age: 0)
    }
    
    deinit {
        print("Friend deinitialized")
    }
}

let f = Friend(name: "a")
f!.name

class BestFriend: Friend {

    override init?(name: String) {
        
        if name.isEmpty {
            super.init()
        } else {
            super.init(name: name)
        }
        
    }
    
    required init() {
        super.init()
    }
    
    deinit {
        print("BestFriend deinitialized")
    }
}

let b = BestFriend(name: "")
b?.name

let f1 = Friend(name: "a")
f1!.skin.rawValue
let f2 = Friend(name: "a")
f2!.skin.rawValue
let f3 = Friend(name: "a")
f3!.skin.rawValue
let f4 = Friend(name: "a")
f4!.skin.rawValue

struct Test {
    var bestFriend: BestFriend? = BestFriend(name: "")
}

var test: Test? = Test()

test!.bestFriend = nil

var f5 = Friend(name: "")
