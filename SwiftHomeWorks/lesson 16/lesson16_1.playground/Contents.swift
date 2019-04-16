var cellPic = "⬜️"
var boyPic = "🚶‍♂️"
var dogPic = "🐶"
var ballPic = "🥎"

class Room {
    var width: Int = 6
    var height: Int = 6
}

class Dog {
    var x: Int = 3
    var y: Int = 3
}

class Ball {
    var x: Int = 4
    var y: Int = 4
}

class Boy {
    var x: Int = 5
    var y: Int = 5
}

enum Direction {
    case up, down, left, right
}

class Game {
    var room = Room()
    var dog = Dog()
    var ball = Ball()
    var boy = Boy()
    
    func Move(direction: Direction) {
        switch direction {
        case .up:
            print("Up!")
            if CheckDogMove(direction: .up) {
                dog.y -= 1
                if CheckBallMove(direction: .up) {
                    ball.y -= 1
                    CheckVictory()
                }
            }
        case .down:
            print("Down!")
            if CheckDogMove(direction: .down) {
                dog.y += 1
                if CheckBallMove(direction: .down) {
                    ball.y += 1
                    CheckVictory()
                }
            }
        case .left:
            print("Left!")
            if CheckDogMove(direction: .left) {
                dog.x -= 1
                if CheckBallMove(direction: .left) {
                    ball.x -= 1
                    CheckVictory()
                }
            }
        case .right:
            print("Right!")
            if CheckDogMove(direction: .right) {
                dog.x += 1
                if CheckBallMove(direction: .right) {
                    ball.x += 1
                    CheckVictory()
                }
            }
        }
        PrintGame()
    }
    
    func CheckDogMove(direction: Direction) -> Bool {
        switch direction {
        case .up:
            return dog.y > 1 && !(dog.y + ball.y == 3 && dog.x == ball.x)
        case .down:
            return dog.y < room.width && !(dog.y + ball.y == room.height * 2 - 1 && dog.x == ball.x)
        case .left:
            return dog.x > 1 && !(dog.x + ball.x == 3 && dog.y == ball.y)
        case .right:
            return dog.x < room.height && !(dog.x + ball.x == room.width * 2 - 1 && dog.y == ball.y)
        }
    }
    
    func CheckBallMove(direction: Direction) -> Bool {
        switch direction {
        case .up:
            return dog.x == ball.x && dog.y == ball.y && ball.y > 1
        case .down:
            return dog.x == ball.x && dog.y == ball.y && ball.y < room.height
        case .left:
            return dog.x == ball.x && dog.y == ball.y && ball.x > 1
        case .right:
            return dog.x == ball.x && dog.y == ball.y && ball.x < room.width
        }
    }
    
    func CheckVictory() {
        if ball.x == boy.x && ball.y == boy.y {
            print("You win!")
            cellPic = "❇️"
        }
    }
    
    func PrintGame() {
        for height in 1...room.height {
            for wigth in 1...room.width {
                var cell = String()
                switch (wigth, height) {
                case (dog.x, dog.y):
                    cell = dogPic
                case (ball.x, ball.y):
                    cell = ballPic
                case (boy.x, boy.y):
                    cell = boyPic
                default:
                    cell = cellPic
                }
                print(cell, terminator: "")
            }
            print("\n", terminator: "")
        }
        cellPic = "⬜️"
        print()
    }
}

var game = Game()

game.PrintGame()
game.Move(direction: .right)
game.Move(direction: .down)
game.Move(direction: .left)
game.Move(direction: .down)
game.Move(direction: .right)

