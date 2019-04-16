import Foundation

protocol Priority {
    var order: Int { get }
}

protocol EntryName: Priority {
    var label: String { get }
    
    mutating func printLabel()
    
    init (name: String)
}

class Human {
    
}


class Farmer: Human, EntryName {
    required init(name: String) {
        self.firstName = name
        //self.lastName = "Shmob"
    }
    
    func printLabel() {
        firstName += "newName"
        print(firstName + " farmer")
    }
    
    var firstName: String
    var lastName: String?
    
    var fullName: String {
        return firstName + " " + lastName!
    }
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    var label: String {
        return fullName
    }
    
    let order = 1
}

class Animal {
    
}

class Cow: Animal, EntryName {
    required init(name: String) {
        self.name = name
    }
    
    func printSomeText() {
        print("SomeText = " + label)
    }
    
    
    func printLabel() {
        print(label)
    }
    var name: String?
    
    var label: String {
        return name ?? "a cow"
    }
    
    let order = 2
}

struct Grass: EntryName {
    init(name: String) {
        self.type = name
    }
    
    init(type: String) {
        self.type = type
    }
    
    func printLabel() {
        print("This is grass")
    }
    var type: String
    
    var label: String {
        return "Grass: " + type
    }
    
    let order = 3
}

let farmer1 = Farmer(firstName: "Bob", lastName: "Shmob")
let farmer2 = Farmer(firstName: "Bill", lastName: "Shmill")
let farmer3 = Farmer(firstName: "Brian", lastName: "Shmian")

let cow1 = Cow(name: "Burenka")
let cow2 = Cow(name: "Maria")

let grass1 = Grass(type: "Bermuda")
let grass2 = Grass(type: "St. Augustine")

/*
 for value in array {
 
 if let grass = value as? Grass {
 print(grass.type)
 } else if let farmer = value as? farmer {
 print(farmer.fullName)
 } else if let cow = value as? Cow {
 print(cow.name ?? "a cow")
 }
 
 switch value {
 case let grass as Grass: print(grass.type)
 case let farmer as farmer: print(farmer.fullName)
 case let cow as Cow: print(cow.name ?? "a cow")
 default: break
 }
 }
 */

func printFarm (array: inout [EntryName]) {
    array.sort(by: {a, b in
        if a.order == b.order {
            return a.label.lowercased() < b.label.lowercased()
        } else {
            return a.order < b.order
        }
    })
    
    for value in array {
        print(value.label)
    }
    
}

var array: [EntryName] =
    [cow1, farmer1, grass2, cow2, farmer3, grass1, farmer2]

printFarm(array: &array)

cow1.printLabel()
farmer1.printLabel()
grass1.printLabel()
farmer1.fullName

var someAnimal: EntryName = Cow(name: "someAnimal")



Int.max
Int.min

UInt.max
UInt.min

protocol MidleValue {
    
   static func mid() -> (Int)
    
}


//extension UInt: MidleValue {
//    static func mid() -> (UInt) {
//        return (UInt.max + UInt.min) / 2
//    }
//}

extension Int: MidleValue {
    static func mid() -> (Int) {
        return (Int.max + Int.min) / 2
    }
}

Int.mid()


extension EntryName {
    func printSomeText() {
        print("SomeText")
    }
}

cow1.printSomeText()
farmer1.printSomeText()

var array1: [EntryName & Priority] = [farmer1, cow1]

func someFunc(unit: EntryName & Priority) {
    print(unit.label)
}

let array2: [Any] = [123, "sdasf", farmer2, grass2, cow1]

for obj1 in array2 {
    print(obj1)
    
    
    if var obj2 = obj1 as? EntryName {
        print(obj2.label)
        obj2.printSomeText()
    }
}
