    
let space = "⬜️"
let wall = "⬛️"
let pers = "😁"
let box = "📦"

    
struct Cell {
    
    var map = [["x", "x", "x", "x", "x", "x", "x", "x", "x", "x"],
               ["x", "t", " ", " ", " ", " ", " ", " ", " ", "t"],
               ["x", " ", "b", " ", " ", "b", " ", " ", " ", " "],
               ["x", " ", " ", " ", " ", " ", " ", " ", " ", " "],
               ["x", " ", " ", " ", " ", " ", " ", " ", " ", " "],
               ["x", " ", " ", " ", " ", "p", " ", " ", " ", " "],
               ["x", " ", " ", " ", " ", " ", " ", " ", " ", " "],
               ["x", " ", "b", " ", " ", " ", " ", " ", " ", " "],
               ["x", " ", " ", " ", " ", " ", " ", " ", " ", "t"],
               ["x", "x", "x", "x", "x", "x", "x", "x", "x", "x"]]
    
    
    var wallsArray: [Cell.Wall]
    var floorsArray = [Cell.Floor]()
    var boxesArray = [Cell.Box]()
    var targetsArray = [Cell.Target]()

    
    struct Wall {
        var x: Int
        var y: Int
    }
    
    struct Floor {
        var x: Int
        var y: Int
    }
    
    struct Box {
        var x: Int
        var y: Int
    }
    
    struct Pers {
        var x: Int
        var y: Int
    }
    
    struct Target {
        var x: Int
        var y: Int
    }
    
    enum Direction {
        case up
        case down
        case left
        case right
    }
    
    mutating func addToField() {
        for (i, array) in map.enumerated() {
            for (index, char) in array.enumerated() {
                switch char {
                case "x":
                    wallsArray.append(Cell.Wall(x: i, y: index))
                case " ":
                    floorsArray.append(Cell.Floor(x: i, y: index))
                case "b":
                    boxesArray.append(Cell.Box(x: i, y: index))
                case "t":
                    targetsArray.append(Cell.Target(x: i, y: index))
                default:
                    Pers(x: i, y: index)
                }
            }
        }
    }
    
   func printBoard() {
        for (i, array) in map.enumerated() {
            var result = ""
            for (index, _) in array.enumerated() {
                for (_, type) in wallsArray.enumerated() {
                    switch type {
                    case _ where type.x == i && type.y == index:
                        result += wall
                    default:
                        continue
                    }
                }
                result += space
            }
            print(result)
        }
    }
}

    
