class Address {
    var street = "Deribasovskaya"
    var number = "1"
    var city = "Odessa"
    var country = "Ukrain"
}

struct Garage {
    var size = 2
}

class House {
    var rooms = 1
    var address = Address()
    var garage: Garage? = Garage()
}

class Car {
    var model = "Zaporojec"
    
    func start() {
    }
}

class Person {
    var cars: [Car]? = [Car()]
    var house: House? = House()
}

let p = Person()

if (p.house?.garage?.size = 3) != nil {
    print("upgrade!")
} else {
    print("failure!")
}


if let size = p.house?.garage?.size {
    size
}

p.cars?[0].model

if p.cars?[0].start() != nil {
    print("start!")
} else {
    print("failure!")
}

////////////////////////////

class Symbol {
    
}

class A: Symbol {
    func aa(){}
}

class B: Symbol {
    func bb(){}
}

//AnyObject
//Any
let array: [Any] = [A(), B(), Symbol(), A(), A(), B(), 5, "a"]
let array2: [AnyObject] = [A(), B(), Symbol(), A(), A(), B()]

var aCount = 0
var bCount = 0
var sCount = 0

for value in array {
    
    if value is A {
        //let a = value as! A
        aCount += 1
    } else if value is B {
        bCount += 1
    } else {
        sCount += 1
    }
    
    if let a = value as? A {
        a.aa()
    } else if let b = value as? B {
        b.bb()
    }
    //let a = value as A
}

aCount
bCount
sCount

