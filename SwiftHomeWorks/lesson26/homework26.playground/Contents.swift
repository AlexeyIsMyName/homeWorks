/*
1. Для нашей структуры Point перегрузить операторы: -, -=, prefix —, postfix —, /, /=, *=
*/
print("\n***** Part 1 *****")
struct Point {
    var x: Int
    var y: Int
}

var p1 = Point(x: 6, y: 10)
var p2 = Point(x: 2, y: 5)

func - (a: Point, b: Point) -> Point {
    return Point(x: a.x - b.x, y: a.y - b.y)
}

print(p1 - p2)

func -= (a: inout Point, b: Point) {
    a = a - b
}

//p1 -= p2
//print(p1)

func / (a: Point, b: Point) -> Point {
    return Point(x: a.x / b.x, y: a.y / b.y)
}

print(p1 / p2)

func /= (a: inout Point, b: Point) {
    a = a / b
}

//p1 /= p2
//print(p1)

func *= (a: inout Point, b: Point) {
    a = Point(x: a.x * b.x, y: a.y * b.y)
}

//p1 *= p2
//print(p1)

prefix func - (a: inout Point) -> Point {
    a = Point(x: a.x - 1, y: a.y - 1)
    return a
}

postfix operator -
postfix func - (a: inout Point) -> Point {
    var b = a
    b = Point(x: a.x - 1, y: a.y - 1)
    return b
}

print(p1-)
print(-p1)
print(p1- - -p1)
print(-p1 - p1-)

 /*
2. Создать структуру (Size), Rect, аналог CGRect, содержащую структуру Size и Point. Перегрузить операторы +, +=, -, -= для этой структуры.
*/
print("\n***** Part 2 *****")
struct Size {
    var width: Int
    var height: Int
}

struct Rect {
    var origin: Point
    var size: Size
    
    func printRect() {
        print(self.origin)
        print(self.size)
    }
}

func + (a: Rect, b: Rect) -> Rect {
    var tempOrigin = Point(x: 0, y: 0)
    var tempSize = Size(width: 0, height: 0)
    
    if  a.origin.x + a.size.width <= b.origin.x || a.origin.y + a.size.height <= b.origin.x ||
        b.origin.x + b.size.width >= a.origin.x || b.origin.y + b.size.height >= a.origin.y {
        if a.origin.x * a.origin.y <= b.origin.x * b.origin.y {
            tempOrigin = a.origin
        } else {
            tempOrigin = b.origin
        }
        tempSize = Size(width: a.size.width + b.size.width, height: a.size.height + b.size.height)
    } else {
        print("rectangles are crossing")
    }

    return Rect(origin: tempOrigin, size: tempSize)

}

func += (a: inout Rect, b: Rect) {
    a = a + b
}


var r1 = Rect(origin: Point(x: 5, y: 10), size: Size(width: 10, height: 20))
var r2 = Rect(origin: Point(x: 40, y: 50), size: Size(width: 20, height: 40))

(r1 + r2).printRect()
//r1 += r2
//r1.printRect()

func - (a: Rect, b: Rect) -> Rect {
    var tempOrigin = Point(x: 0, y: 0)
    var tempSize = Size(width: 0, height: 0)
    
    if  a.origin.x + a.size.width <= b.origin.x || a.origin.y + a.size.height <= b.origin.x ||
        b.origin.x + b.size.width >= a.origin.x || b.origin.y + b.size.height >= a.origin.y {
        if a.origin.x * a.origin.y <= b.origin.x * b.origin.y {
            tempOrigin = a.origin
        } else {
            tempOrigin = b.origin
        }
        tempSize = Size(width: a.size.width - b.size.width, height: a.size.height - b.size.height)
        if tempSize.height <= 0 || tempSize.width <= 0 {
            tempSize.height = tempSize.height * -1
            tempSize.width = tempSize.width * -1
        }
    } else {
        print("rectangles are crossing")
    }
    
    return Rect(origin: tempOrigin, size: tempSize)
    
}

func -= (a: inout Rect, b: Rect) {
    a = a - b
}

(r1 - r2).printRect()
//r1 -= r2
//r1.printRect()

 /*
3. Перегрузить оператор + и += для String, но второй аргумент должен быть Int
*/
print("\n***** Part 3 *****")

func + (a: String, b: Int) -> String {
    return a + String(b)
}

func += (a: inout String, b: Int) {
    a = a + b
}

var string = "String" + 1234567890
print(string)
string += 777
print(string)
 
 /*
4. Создать свой оператор, который будет принимать 2 String и в первом аргументе, при совпадении буквы с вторым аргументом, менять совпадения на заглавные буквы
*/
print("\n***** Part 4 *****")

extension String {
    func printMe() {
        print(self)
    }
}

import Foundation

infix operator +-
func +- (s1: String, s2: String) -> String {
    var s3 = s1
    let set = Set(s2)
    for (index, value) in s1.enumerated() {
        if set.contains(value) {
            let start = s1.index(s1.startIndex, offsetBy: index)
            let end = start
            s3.replaceSubrange(start...end, with: String(value).uppercased())
        }
    }
    return s3
}

var s = "Hello, World!"
var d = "Lord"
s.printMe()
d.printMe()
(s +- d).printMe()
