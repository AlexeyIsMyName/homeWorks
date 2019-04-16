
/*
extension Int8 {
    
    func binary() -> String{
        var result = ""
        for i in 0..<8 {
            let mask = 1 << i
            let set = Int(self) & mask != 0
            result = (set ? "1" : "0") + result
        }
        return result
    }
}

var a: Int8 = 57
a.binary()

a = 0b01111111
a.binary()

a = a &+ 1
a = a + 1

a = 0
a = a - 1
a.binary()
a = a - 1
a.binary()

a = 0b00100001
a = a << 2
a.binary()



extension UInt8 {
    
    func binary() -> String{
        var result = ""
        for i in 0..<8 {
            let mask = 1 << i
            let set = Int(self) & mask != 0
            result = (set ? "1" : "0") + result
        }
        return result
    }
}

var a: UInt8 = 0b00111001
a.binary()

0b11111111
0xff
255
(5 as UInt8).binary()

a = a + 0b00000101
a.binary()


(4 as UInt8).binary()

a = a - 0b00000100
a.binary()

a = a << 1
a.binary()

a = a * 2
a.binary()

a = a &* 2
a.binary()

a = 0b11111111
a = a &+ 1

a = 0b00000000
a = a &- 1
*/


extension UInt8 {
    var bool: Bool { return self != 0 }
    
    func binary() -> String {
        var result = ""
        for i in 0..<8 {
            let mask = 1 << i
            let set = Int(self) & mask != 0
            result = (set ? "1" : "0") + result
        }
        return result
    }
}

var a: UInt8 = 0b00110011
var b: UInt8 = 0b11100001

a.binary()
b.binary()
(a | b).binary()

a.binary()
b.binary()
(a & b).binary()

a.binary()
b.binary()
(a ^ b).binary()

a.binary()
(~a).binary()

b = 0b00010001
b.binary()
(a & b).binary()

b = 0b00000100
a.binary()
b.binary()
(a | b).binary()

b = 0b00000010
a.binary()
b.binary()
(a ^ b).binary()

b = 0b00010000
a.binary()
b.binary()
(a & ~b).binary()

enum CheckList: UInt8 {

    case Bread =    0b00000001
    case Chicken =  0b00000010
    case Apples =   0b00000100
    case Pears =    0b00001000
    
}

var checkList: UInt8 = 0b00001001
let bread = checkList & CheckList.Bread.rawValue
bread.binary()

let chicken = checkList & CheckList.Chicken.rawValue
chicken.binary()

let pears = checkList & CheckList.Pears.rawValue
pears.binary()

extension CheckList {

    var string: String {
        switch self {
        case .Apples: return "apples"
        case .Bread: return "bread"
        case .Chicken: return "chicken"
        case .Pears: return "pears"
        }
    }
    
    static func set(newValue: CheckList, checkList: inout UInt8) {
        checkList = checkList | newValue.rawValue
    }

    static func get(checkList: UInt8) {
        print("Shoping list: ")
        if (checkList & CheckList.Bread.rawValue) == 0b00000001 {
            print(CheckList.Bread.string)
        }
        
        if (checkList & CheckList.Chicken.rawValue) == 0b00000010 {
            print(CheckList.Chicken.string)
        }
        
        if (checkList & CheckList.Apples.rawValue) == 0b00000100 {
            print(CheckList.Apples.string)
        }
        
        if (checkList & CheckList.Pears.rawValue) == 0b00001000 {
            print(CheckList.Pears.string)
        }
    }
}

checkList.binary()
CheckList.set(newValue: .Apples, checkList: &checkList)
checkList.binary()
CheckList.get(checkList: checkList)

extension UInt8 {
    func binar() -> String {
        var result = ""
        for i in 0..<8 {
            let mask: UInt8 = 1 << i
            let set = self & mask != 0
            result = (set ? "*" : " ") + result
        }
        return result
    }
}

let min: UInt8 = 0b00000001
let max: UInt8 = 0b10000000

var prnt: UInt8 = 1
var isMin = true

for _ in 1...22 {
    print(prnt.binar())
    prnt = isMin ? prnt << 1 : prnt >> 1
    if (prnt & max).bool || (prnt & min).bool {
        isMin = !isMin
    }
}

class Chessboard {

    enum Column: UInt64 {
        case a = 1, b, c, d, e, f, g, h
    }
    
    private let black: UInt64 = 0b10101010_01010101_10101010_01010101_10101010_01010101_10101010_01010101
    
    private func mask(_ x: Column, _ y: UInt64) -> UInt64 {
        return 1 << (x.rawValue * 8 + y)
    }
    
    func printColor(_ x: Column, _ y: UInt64) {
        return (black & mask(x, y) != 0) ? print("black") : print("white")
    }
}

let board = Chessboard()
board.printColor(.a, 1)
board.printColor(.a, 2)
board.printColor(.a, 3)

board.printColor(.b, 1)

board.printColor(.h, 1)


