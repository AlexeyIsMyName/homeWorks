//1. Создайте тип Комната. У комнаты есть размеры W на H. И создайте тип Персонаж. У негоесть координата в комнате X и Y. Реализуйте функцию, которая красивенько текстом будет показывать положение персонажа в комнате

//2. Персонажу добавьте метод идти, который принимает энумчик лево, право, верх, вниз
//Этот метод должен передвигать персонажа. Реализуйте правило что персонаж не должен покинуть пределы комнаты. Подвигайте персонажа и покажите это графически

//3. Создать тип Ящик. У ящика также есть координата в комнате X и Y. Ящик также не может покидать пределы комнаты и ящик также должен быть распечатан вместе с персонажем в функции печати.
//
//4. Теперь самое интересное, персонаж может двигать ящик, если он стоит на том месте, куда персонаж хочет попасть. Главное что ни один объект не может покинуть пределы комнаты. Подвигайте ящик :)
//
//5. Добавьте точку в комнате, куда надо ящик передвинуть и двигайте :)
//
//Для суперменов: можете добавить массив ящиков и можете сделать консольное приложение


let space = "⬜️"
let wall = "⬛️"
let pers = "😁"
let boxx = "📦"
let targett = "🔴"

struct Point {
    var x: Int
    var y: Int
}

struct Room {
    var w: Int
    var h: Int
}

enum Move: String {
    case up
    case down
    case left
    case right
}

struct Game {
    
    func printError() {
        print("Wrong move!")
    }
    
    func checkBox() -> Bool {
        return hero.x == box.x && hero.y == box.y
    }
    
    func checkEnd() -> Bool {
        return box.x == target.x && box.y == target.y
    }
    
    var room: Room
    
    var target: Point
    
    var hero: Point {
        didSet {
            if hero.x < 2 || hero.x == room.w || hero.y < 2 || hero.y == room.h {
                hero.x = oldValue.x
                hero.y = oldValue.y
                printError()
            }
        }
    }
    
    var box: Point {
        didSet {
            if box.x < 2 || box.x == room.w || box.y < 2 || box.y == room.h {
                box.x = oldValue.x
                box.y = oldValue.y
                printError()
            }
        }
    }
    
    mutating func movePerson(action: Move) {
        switch action {
        case .right:
            hero.x += 1
            checkBox() ? (box.x += 1) : (box.x = box.x)
            checkBox() ? (hero.x -= 1) : (hero.x = hero.x)
        case .left:
            hero.x -= 1
            checkBox() ? (box.x -= 1) : (box.x = box.x)
            checkBox() ? (hero.x += 1) : (hero.x = hero.x)
        case .up:
            hero.y -= 1
            checkBox() ? (box.y -= 1) : (box.y = box.y)
            checkBox() ? (hero.y += 1) : (hero.y = hero.y)
        case .down:
            hero.y += 1
            checkBox() ? (box.y += 1) : (box.y = box.y)
            checkBox() ? (hero.y -= 1) : (hero.y = hero.y)
        }
        printBoard()
        if checkEnd() {
            print("***** YOU WON!!! ****")
        }
    }
    
    func printBoard() {
        for h in 1...room.h {
            var result = ""
            for w in 1...room.w {
                switch (w, h) {
                case (hero.x, hero.y): result += pers
                case (box.x, box.y): result += boxx
                case (target.x, target.y): result += targett
                case (2...room.w-1, 2...room.h-1): result += space
                default: result += wall
                }
            }
            print(result)
        }
    }
}

let room = Room(w: 10, h: 10)
let hero = Point(x: 2, y: 2)
let box = Point(x: 4, y: 4)
let target = Point(x: 6, y: 4)

var game = Game(room: room, target: target, hero: hero, box: box)

game.printBoard()
game.movePerson(action: .down)
game.movePerson(action: .right)
