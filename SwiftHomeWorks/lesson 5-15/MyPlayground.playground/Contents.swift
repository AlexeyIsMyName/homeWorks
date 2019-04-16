class Student {
    var name: String
    var age: Int
    
    init() {
        name = "No Name"
        age = 20
    }
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

let student1 = Student(name: "Bob", age: 18)

student1.name = "Alex"
student1.age = 21

struct StudentStruct {
    var name: String
    var age: Int
}

let stStruct = StudentStruct(name: "Sam", age: 24)


enum CompassPoint {
    case north, south, east, west
    mutating func turnNorth() {
        self = .south
    }
}
var currentDirection = CompassPoint.east
let rememberedDirection = currentDirection
currentDirection.turnNorth()

//print("Текущее направление - \(currentDirection)")

enum Action {
    case Walk(meters: Int)
    case Run(meters: Int, speed: Double)
    case Stop
    case Turn(direction: Direction)
    
    enum Direction : String {
        case Left = "Left!"
        case Right = "Right!"
    }
}

var action = Action.Run(meters: 20, speed: 15.0)
//action = Action.Stop
//action = .Walk(meters: 10)
action = .Turn(direction: .Right)


switch action {
    case .Stop: print("Stop")
    case .Walk(let meters) where meters < 100:
        print("short walk \(meters)")
    case .Walk(let meters) where meters > 100:
        print("long walk \(meters)")
    case .Run(let m, let s):
        print("run \(m) meters with speed \(s)")
    case .Turn(let dir) where dir == .Left:
        print("Turn left!")
    case .Turn(let dir) where dir == .Right:
        print("Turn right!")
    default: break
}

print(Action.Direction.Left.rawValue)
