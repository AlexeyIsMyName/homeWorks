struct Point {
    var x: Int
    var y: Int
}

var p1 = Point(x: 2, y: 3)
var p2 = Point(x: 3, y: 5)

func + (a: Point, b: Point) -> Point {
    return Point(x: a.x + b.x, y: a.y + b.y)
}

func * (a: Point, b: Point) -> Point {
    return Point(x: a.x * b.x, y: a.y * b.y)
}


var p3 = p1 + p2
p3.x
p3.y

p3 = p1 * p2
p3.x
p3.y

func += (a: inout Point, b: Point) {
    a = a + b
}

p3 += p1
p3.x
p3.y

func == (a: Point, b: Point) -> Bool {
    return a.x == b.x && a.y == b.y
}

p1 == p1
p1 == p2

prefix func ++ (a: inout Point) -> Point {
    a.x += 1
    a.y += 1
    return a
}

postfix func ++ (a: inout Point) -> Point {
    let b = a
    ++a
    return b
}

p1 = Point(x: 2, y: 3)
p2 = Point(x: 3, y: 5)

p1++
p1.x
p1.y
++p2
p2.x
p2.y

var i = 7
if i == 8 {
    print("8")
} else {
    print("not 8")
}

p1 = Point(x: 2, y: 3)
p2 = Point(x: 3, y: 5)

p1++ + p2++

p1 = Point(x: 2, y: 3)
p2 = Point(x: 3, y: 5)

++p1 + ++p2

p1 = Point(x: 2, y: 3)
p2 = Point(x: 3, y: 5)

p1++ + ++p2

p1 = Point(x: 2, y: 3)
p2 = Point(x: 3, y: 5)

++p1 + p2++

//%%%
infix operator %%%

func %%% (a: inout Point, b: Point) -> Point {
    a.x += b.y
    a.y -= b.y
    return a
}

p1
p2
p1 %%% p2

var j = 5

i
j
i * 5 + j
i * (5 + j)

(((i / 5) * j) / 5) * i

precedencegroup myName {
    higherThan: AdditionPrecedence
    lowerThan: MultiplicationPrecedence
    associativity: right
    assignment: true
}

infix operator **: myName

func ** (a: Point, b: Point) -> Point {
    return Point(x: 2 * (a.x + b.x), y: 2 * (a.y + b.y))
}

p1 = Point(x: 2, y: 3)
p2 = Point(x: 3, y: 5)

p1 ** p2 ** p1 ** p2

p1 + p2 ** p2 ** p1
((p1 + p2) ** p2) ** p1
p1 + ((p2 ** p2) ** p1)
p1 + (p2 ** (p2 ** p1))
(p1 + p2) ** (p2 ** p1)

var s = "Hello, World!"

import Foundation
func -= (s1: inout String, s2: String) {
    
    let set = NSCharacterSet(charactersIn: s2)
    let components: NSArray = s1.components(separatedBy: set as CharacterSet) as NSArray
    s1 = components.componentsJoined(by: "")
    
}

s -= "lo"
s -= "H"

func -= (s1: inout String, i: Int) {
    s1 -= String(i)
}

s = "0123456789"
s -= 5784440

