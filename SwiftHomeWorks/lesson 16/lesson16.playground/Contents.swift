import Foundation

class Room {
    var width: Int = 0
    var height: Int = 0
    
    var x: Int = 0
    var y: Int = 0
    
    func PrintGameField(hero: Hero, ball: Ball, house: House) {
        for height in 1...height {
            for width in 1...width {
                switch (height, width) {
                    case (hero.y, hero.x):
                        print("🐶", terminator: "")
                    case (ball.y, ball.x):
                        print("🥎", terminator: "")
                    case (house.y, house.x):
                        print("🏠", terminator: "")
                    default:
                        print("⬜️", terminator: "")
                }
            }
            print("\n", terminator: "")
        }
    }
    
    func PrintRoom() {
        PrintGameField(hero: hero, ball: ball, house: house)
    }
}

class Hero: Room {
    func Up() -> Bool {
        return self.y > 1 ? true : false
    }
    
    func Down() -> Bool {
        return self.y < room.height ? true : false
    }
    
    func Left() -> Bool {
        return self.x > 1 ? true : false
    }
    
    func Right() -> Bool {
        return self.x < room.width ? true : false
    }
    
    func Move(direction: Direction) {
        switch direction {
        case .up:
            print("Up!")
            if Up() {
                y -= 1
                if x == ball.x && y == ball.y && ball.Up() {
                    ball.y -= 1
                }
            }
        case .down:
            print("Down!")
            if Down() {
                y += 1
                if x == ball.x && y == ball.y {
                    ball.y += 1
                }
            }
        case .left:
            print("Left!")
            if Left() {
                x -= 1
                if x == ball.x && y == ball.y {
                    ball.x -= 1
                }
            }
        case .right:
            print("Right!")
            if Right() {
                x += 1
                if x == ball.x && y == ball.y {
                    ball.x += 1
                }
            }
        }
    room.PrintRoom()
    }
}

class Ball: Room {
    func Up() -> Bool {
        return self.y > 1 ? true : false
    }
}

class House: Room {
}

enum Direction {
    case up, down, left, right
}

var room = Room()
room.width = 5
room.height = 5

var hero = Hero()
hero.x = 2
hero.y = 3

var ball = Ball()
ball.x = 3
ball.y = 3

var house = House()
house.x = 4
house.y = 3

room.PrintRoom()
hero.Move(direction: .down)
hero.Move(direction: .right)
hero.Move(direction: .up)
hero.Move(direction: .up)
hero.Move(direction: .up)

/*
 !1. Ящик также не может покидать пределы комнаты
 
 Сделаем с вами небольшую игру
 
 1. Создайте тип Комната. У комнаты есть размеры W на H. И создайте тип Персонаж. У негоесть координата в комнате X и Y. Реализуйте функцию, которая красивенько текстом будет показывать положение персонажа в комнате
 
 2. Персонажу добавьте метод идти, который принимает энумчик лево, право, верх, вниз
 Этот метод должен передвигать персонажа. Реализуйте правило что персонаж не должен покинуть пределы комнаты. Подвигайте персонажа и покажите это графически
 
 3. Создать тип Ящик. У ящика также есть координата в комнате X и Y. Ящик также не может покидать пределы комнаты и ящик также должен быть распечатан вместе с персонажем в функции печати.
 
 4. Теперь самое интересное, персонаж может двигать ящик, если он стоит на том месте, куда персонаж хочет попасть. Главное что ни один объект не может покинуть пределы комнаты. Подвигайте ящик :)
 
 5. Добавьте точку в комнате, куда надо ящик передвинуть и двигайте :)
 
 Для суперменов: можете добавить массив ящиков и можете сделать консольное приложение
 */



/*
struct Point {
    var x: Int
    var y: Int
    
    mutating func moveByX(x: Int, andY y: Int) {
        self = Point(x: self.x + x, y: self.y + y)
    }
}

enum Color {
    
    static func namberOfElements() -> Int {
        return 2
    }
    
    case White
    case Black
    
    mutating func invert() {
        if self == .White {
            self = .Black
        } else {
            self = .White
        }
    }
    
}

var c = Color.White
c
c.invert()
c

Color.namberOfElements()

var p = Point(x: 1, y: 1)
print(p)
p.moveByX(x: 5, andY: 7)
print(p)
*/

