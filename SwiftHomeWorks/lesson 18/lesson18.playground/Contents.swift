//____________________________First Task_____________
class Artist {
    var firstName = "firstName"
    var secondName = "secondName"
    
    var fullName: String {
        return firstName + " " + secondName
    }
    
    func action() -> String {
        return fullName + " plays a role"
    }
}

class Dancer: Artist {
    override func action() -> String {
        return fullName + " dancing"
    }
}

class Singer: Artist {
    override func action() -> String {
        return fullName + " sings"
    }
}

class Painter: Artist {
    
    override var firstName: String {
        set {
            super.firstName = "Monsieur"
        }
        get {
            return super.firstName
        }
    }
    
    override var secondName: String {
        set {
            super.secondName = "Painter"
        }
        get {
            return super.secondName
        }
    }
    
    override func action() -> String {
        return fullName + " draws"
    }
}

let dancer = Dancer()
let singer = Singer()
let painter = Painter()

dancer.firstName = "Michael"
dancer.secondName = "Jackson"
dancer.fullName

singer.firstName = "James"
singer.secondName = "Brown"
singer.fullName

painter.firstName = "Salvador"
painter.secondName = "Dali"
painter.fullName

let artists = [dancer, singer, painter]

for value in artists {
    print(value.action())
}

print()
//____________________________Second Task_____________
class Transport {
    var speed: Int {
        return 0
    }
    var capacity: Int {
        return 0
    }
    var prisePerPerson: Int {
        return 0
    }
    
    var nameTransport: String {
        return ""
    }
    
    func totalInfo(passengers: Int, distance: Int) {
        
        print("\nTransport - \(self.nameTransport), Passengers - \(passengers), Distanse - \(distance)")
        
        //_____Computing count
        let count = (Double(passengers) / Double(capacity)) > Double(passengers / capacity)
            && (Double(passengers) / Double(capacity)) < Double(passengers / capacity) + 1
            ? (passengers / capacity + 1) : (passengers / capacity)
        
        //_____Computing time
        let time = Double(distance) / Double(self.speed) * Double(count)
        let hour = time
        let minute = 60 * (time - Double(Int(hour)))
        
        //_____Computing Total prise
        let totalPrise = passengers * self.prisePerPerson
        
        print("Total Time - \(Int(hour)):\(Int(minute))")
        print("Total prise - \(totalPrise) RUB")
        print("Number of trips - \(count)")
        
    }
}

class AirPlane: Transport {
    override var speed: Int {
        return 900
    }
    override var capacity: Int {
        return 180
    }
    override var prisePerPerson: Int {
        return 11450
    }
    override var nameTransport: String {
        return "AirPlane"
    }
}

class Ship: Transport {
    override var speed: Int {
        return 55
    }
    override var capacity: Int {
        return 3500
    }
    override var prisePerPerson: Int {
        return 7250
    }
    override var nameTransport: String {
        return "Ship"
    }
}

class Train: Transport {
    override var speed: Int {
        return 90
    }
    override var capacity: Int {
        return 538
    }
    override var prisePerPerson: Int {
        return 6550
    }
    override var nameTransport: String {
        return "Train"
    }
}

class Bus: Transport {
    override var speed: Int {
        return 80
    }
    override var capacity: Int {
        return 51
    }
    override var prisePerPerson: Int {
        return 950
    }
    override var nameTransport: String {
        return "Bus"
    }
}

let airPlane = AirPlane()
let ship = Ship()
let train = Train()
let bus = Bus()

let transports = [airPlane, ship, train, bus]

let passengers = 7000
let distanse = 388

for value in transports {
    value.totalInfo(passengers: passengers, distance: distanse)
}

print()
//____________________________Third Task_____________
enum KindOfCreatures: String {
    case human = "Human"
    case animal = "Animal"
}

class LivingCreatures {
    var legs: Int
    var kind: KindOfCreatures
    
    class func printing(livingCreatures: [LivingCreatures]) {
        var legs = 0
        var animals = 0
        var allLivingCreatures = 0
        
        for value in livingCreatures {
            allLivingCreatures += 1
            legs += value.legs == 4 ? 1 : 0
            animals += value.kind == .animal ? 1 : 0
        }
        
        print("Count of then living creatures whus have four legs = \(legs)")
        print("Count of \(KindOfCreatures.animal.rawValue) = \(animals)")
        print("Count of all living creatures = \(allLivingCreatures)")
    }
    
    init(legs: Int, kind: KindOfCreatures) {
        self.legs = legs
        self.kind = kind
    }
}

class Human: LivingCreatures {
    init() {
        super.init(legs: 2, kind: .human)
    }
}

class Crocodile: LivingCreatures {
    init() {
        super.init(legs: 4, kind: .animal)
    }
}

class Monkey: LivingCreatures {
    init() {
        super.init(legs: 2, kind: .animal)
    }
}

class Dog: LivingCreatures {
    init() {
        super.init(legs: 4, kind: .animal)
    }
}

class Giraffe: LivingCreatures {
    init() {
        super.init(legs: 4, kind: .animal)
    }
}

let kris = Human()
let bretta = Human()
let sharik = Dog()
let muhtar = Dog()
let monkey1 = Monkey()
let monkey2 = Monkey()
let giraffe1 = Giraffe()
let giraffe2 = Giraffe()
let crocodile1 = Crocodile()
let crocodile2 = Crocodile()

let livingCreatures = [kris, bretta, sharik, muhtar, monkey1, monkey2, giraffe1, giraffe2, crocodile1, crocodile2]

LivingCreatures.printing(livingCreatures: livingCreatures)

/*
 ______________________________________________________________________________________________________________________________
 
 3. Есть 5 классов: люди, крокодилы, обезьяны, соßбаки, жирафы. (в этом задании вы будете создавать не дочерние классы, а родительские и ваша задача создать родительский таким образом, что бы группировать эти 5).
 
 - Создайте по пару объектов каждого класса.
 - Посчитайте присмыкающихся (создайте масив, поместите туда присмыкающихся и скажите сколько в нем объектов)
 - Сколько четвероногих?
 - Сколько здесь животных?
 - Сколько живых существ?
______________________________________________________________________________________________________________________________
 
class Human {
    
    var firstName: String = ""
    var lastName: String = ""
    
    var fullName: String {
        return firstName + " " + lastName
    }
    
    func sayHello() -> String {
        return "Hello"
    }
    
}

class SmartHuman: Human {
    
}

class Student: SmartHuman {
    
    override func sayHello() -> String {
        return super.sayHello() + " my friend"
    }
    
}

class Kid: Human {
    
    var favoriteToy: String = "iMac"
    
    override func sayHello() -> String {
        return "agu"
    }
    
    override var fullName: String {
        return firstName
    }
    
    override var firstName: String {
        set {
            super.firstName = newValue + " :)"
        }
        get {
            return super.firstName
        }
    }
    
    override var lastName: String {
        didSet {
            print("new value " + self.lastName)
        }
    }
    
}

let human = Human()
human.firstName = "Alex"
human.lastName = "Skutarenko"
human.fullName
human.sayHello()

let student = Student()
student.firstName = "Max"
student.lastName = "Mix"
student.fullName
student.sayHello()

let kid = Kid()
kid.firstName = "Kid"
kid.lastName = "123456"
kid.fullName
kid.sayHello()

let array = [kid, student, human]

for value in array {
    print(value.sayHello())
}

*/
