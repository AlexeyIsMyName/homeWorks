let space = "⬜️"
let wall = "⬛️"
let pers = "😁"
let box = "📦"

var map = [["x", "x", "x", "x", "x", "x", "x", "x", "x", "x"],
           ["x", "t", " ", " ", " ", " ", " ", " ", " ", "x"],
           ["x", " ", "b", " ", " ", "b", " ", " ", " ", "x"],
           ["x", " ", " ", " ", " ", " ", " ", " ", " ", "x"],
           ["x", " ", " ", " ", " ", " ", " ", " ", " ", "x"],
           ["x", " ", " ", " ", " ", "p", " ", " ", " ", "x"],
           ["x", " ", " ", " ", " ", " ", " ", " ", " ", "x"],
           ["x", " ", "b", " ", " ", " ", " ", " ", " ", "x"],
           ["x", " ", " ", " ", " ", " ", " ", " ", " ", "x"],
           ["x", "x", "x", "x", "x", "x", "x", "x", "x", "x"]]

struct Point: Hashable {
    var x: Int
    var y: Int
}


class Object {
    var point: Point
    var type: Type
    
    enum `Type`: String {
        case space = "⬜️"
        case wall = "⬛️"
        case pers = "😁"
        case box = "📦"
        case target = "🔴"
    }
    init(point: Point, type: Type) {
        self.point = point
        self.type = type
    }
}

typealias Map = [[String]]
typealias GameField = [Point: Object]

struct Level {
    var map: Map
    var gameField: GameField
    
    mutating func move(object: inout Object, by action: Direction) {
        let x = object.point.x
        let y = object.point.y
        switch object.type {
        case .pers, .box:
            switch action {
            case .up:
                object.point = Point(x: x, y: y + 1)
            case .down:
                object.point = Point(x: x, y: y - 1)
            case .left:
                object.point = Point(x: x - 1, y: y)
            case .right:
                object.point = Point(x: x + 1, y: y)
            }
            let nextObject = gameField[object.point]
            gameField[object.point] = object
            nextObject?.point = Point(x: x, y: y)
            gameField[nextObject!.point] = nextObject
//            let temp = object.type
//            let nextObject = gameField[object.point]
//
//
//            object.type = nextObject!.type
//            nextObject!.type = temp
            
            
        default:
            break
        }
    }
}

enum Direction {
    case up
    case down
    case left
    case right
}


func makeFieldFrom(map: Map) -> GameField {
    var field = [Point: Object]()
    for (x, array) in map.enumerated() {
        for (y, char) in array.enumerated() {
            let point = Point(x: x, y: y)
            switch char {
            case "x":
                field[point] = (Object(point: point, type: .wall))
            case " ":
                field[point] = (Object(point: point, type: .space))
            case "b":
                field[point] = (Object(point: point, type: .box))
            case "t":
                field[point] = (Object(point: point, type: .target))
            case "p":
                field[point] = (Object(point: point, type: .pers))
            default:
                break
            }
        }
    }
    return field
}

func show(level: Level) {
    for (x, array) in level.map.enumerated() {
        var result = ""
        for y in 0..<array.count {
            if let cellImage = level.gameField[Point(x: x, y: y)]?.type.rawValue {
                result += cellImage
            }
        }
        print(result)
    }
}

var map2 = [["x", "x", "x", "x", "x", "x", "x", "x", "x", "x"],
            ["x", "t", " ", " ", "x", " ", " ", " ", "t", "x"],
            ["x", " ", "b", " ", "x", "b", " ", " ", " ", "x"],
            ["x", " ", " ", " ", "x", " ", "t", "x", " ", "x"],
            ["x", " ", " ", " ", "x", " ", " ", "x", "t", "x"],
            ["x", " ", " ", " ", "x", "p", " ", "x", " ", "x"],
            ["x", " ", " ", " ", "x", " ", " ", "x", " ", "x"],
            ["x", " ", "b", " ", "x", " ", " ", "x", " ", "x"],
            ["x", " ", " ", " ", " ", " ", " ", " ", " ", "x"],
            ["x", "x", "x", "x", "x", "x", "x", "x", "x", "x"]]


var lvl1 = Level(map: map2, gameField: makeFieldFrom(map: map2))
show(level: lvl1)

if var pers = lvl1.gameField[Point.init(x: 5, y: 5)] {
    lvl1.move(object: &pers, by: .up)
    lvl1.move(object: &pers, by: .left)

}

show(level: lvl1)

