/*
 1. Создать энум с шахматными фигурами (король, ферзь и т.д.). Каждая фигура должна иметь цвет белый либо черный (надеюсь намек понят), а так же букву и цифру для позиции. Создайте пару фигур с расположением на доске, так, чтобы черному королю был мат :) Поместите эти фигуры в массив фигур
 */

enum Pieces {
    case king(color: ColorOfPieces, coordinates: (column: String, row: Int))
    case queen(color: ColorOfPieces, coordinates: (column: String, row: Int))
    case bishop(color: ColorOfPieces, coordinates: (column: String, row: Int))
    case knight(color: ColorOfPieces, coordinates: (column: String, row: Int))
    case rook(color: ColorOfPieces, coordinates: (column: String, row: Int))
    case pawn(color: ColorOfPieces, coordinates: (column: String, row: Int))
}

enum ColorOfPieces: String {
    case white = "White"
    case black = "Black"
}

var blackKing = Pieces.king(color: .black, coordinates: (column: "D", row: 8))
var whiteQueen = Pieces.queen(color: .white, coordinates: (column: "C", row: 6))
var whiteRook = Pieces.rook(color: .white, coordinates: (column: "G", row: 5))

var chessboardArray = [blackKing, whiteQueen, whiteRook]

 /*
 2. Сделайте так, чтобы энумовские значения имели rawValue типа String. Каждому типу фигуры установите соответствующее английское название. Создайте функцию, которая выводит в консоль (текстово, без юникода) название фигуры, цвет и расположение. Используя эту функцию распечатайте все фигуры в массиве.
 */

print("Lesson 12: Enume. Part 2")

enum PiecesName: String {
    case king = "King"
    case queen = "Queen"
    case bishop = "Bishop"
    case knight = "Knight"
    case rook = "Rook"
    case pawn = "Pawn"
}

func printPiecePoint(piece: Pieces) {
    switch piece {
    case .king(let color, (let x, let y)):
        print("\(PiecesName.king.rawValue) \(color), on \(x)\(y)")
    case .queen(let color, (let x, let y)):
        print("\(PiecesName.queen.rawValue) \(color), on \(x)\(y)")
    case .bishop(let color, (let x, let y)):
        print("\(PiecesName.bishop.rawValue) \(color), on \(x)\(y)")
    case .knight(let color, (let x, let y)):
        print("\(PiecesName.knight.rawValue) \(color), on \(x)\(y)")
    case .rook(let color, (let x, let y)):
        print("\(PiecesName.rook.rawValue) \(color), on \(x)\(y)")
    case .pawn(let color, (let x, let y)):
        print("\(PiecesName.pawn.rawValue) \(color), on \(x)\(y)")
    }
}

for figure in chessboardArray {
    printPiecePoint(piece: figure)
}

 /*
 3. Используя красивые юникодовые представления шахматных фигур, выведите в консоли вашу доску. Если клетка не содержит фигуры, то используйте белую или черную клетку. Это должна быть отдельная функция, которая распечатывает доску с фигурами (принимает массив фигур и ничего не возвращает)
 */
print("\nLesson 12: Enume. Part 3")

func printChessboard(array: [Pieces]) {
    print("\n   A B C D E F G H")
    for y in 1...8 {
        print(y, terminator: " ")
        var xPoint = 1 // переменная для работы условий свитча в следующем цикле, так как цикл я сделал на "чарах", после работы цикла увеличивается на +1
        for x in "ABCDEFGH" {
            var check = 0 // а эта переменная с дефолтным значением 0 необходима для проверки в строке 122, если после работы свитча мы напечатали фигуру, то клетку печатать не надо
            for value in array {
                switch value {
                case .king(let color, (String(x), y)):
                    print(color == ColorOfPieces.white ? "♔" : "♚", terminator: "")
                    check = 1
                case .queen(let color, (String(x), y)):
                    print(color == ColorOfPieces.white ? "♕" : "♛", terminator: "")
                    check = 1
                case .bishop(let color, (String(x), y)):
                    print(color == ColorOfPieces.white ? "♗" : "♝", terminator: "")
                    check = 1
                case .knight(let color, (String(x), y)):
                    print(color == ColorOfPieces.white ? "♘" : "♞", terminator: "")
                    check = 1
                case .rook(let color, (String(x), y)):
                    print(color == ColorOfPieces.white ? "♖" : "♜", terminator: "")
                    check = 1
                case .pawn(let color, (String(x), y)):
                    print(color == ColorOfPieces.white ? "♙" : "♟", terminator: "")
                    check = 1
                default:
                    break
                }
            }
            // вот проверка
            if check == 0 {
                print(xPoint % 2 == y % 2 ? "⬛️" : "⬜️", terminator: "")
            }
        xPoint += 1
        }
        print(" \(y)")
    }
    print("   A B C D E F G H")
}

printChessboard(array: chessboardArray)

 /*
 4. Создайте функцию, которая будет принимать шахматную фигуру и тюпл новой позиции. Эта функция должна передвигать фигуру на новую позицию, причем перемещение должно быть легальным: нельзя передвинуть фигуру за пределы поля и нельзя двигать фигуры так, как нельзя их двигать в реальных шахматах (для мегамонстров программирования). Вызовите эту функцию для нескольких фигур и распечатайте поле снова.
 
 5. Следите чтобы ваш код был красивым!
 */

print("\nLesson 12: Enume. Part 4")

func turn(figure: inout Pieces, newPos: (String, Int)) {
    switch figure {
    case .pawn(let color, (_, _)): figure = .pawn(color: color, coordinates: newPos)
    case .rook(let color, (_, _)): figure = .rook(color: color, coordinates: newPos)
    case .knight(let color, (_, _)): figure = .knight(color: color, coordinates: newPos)
    case .bishop(let color, (_, _)): figure = .bishop(color: color, coordinates: newPos)
    case .queen(let color, (_, _)): figure = .queen(color: color, coordinates: newPos)
    case .king(let color, (_, _)): figure = .king(color: color, coordinates: newPos)
    }
}

turn(figure: &chessboardArray[0], newPos: ("C", 8))
turn(figure: &chessboardArray[1], newPos: ("E", 8))
turn(figure: &chessboardArray[2], newPos: ("D", 8))

printChessboard(array: chessboardArray)

/*
 Swift. lesson 12. Энумы - Энумчики

enum Direction: String {
    case Left = "Left!"
    case Right = "Right!"
}

enum Action {
    case Walk(meters: Int)
    case Run(meters: Int, speed: Double)
    case Stop
    case Turn(direction: Direction)
}

var action = Action.Run(meters: 20, speed: 15.0)

action = .Stop

action = .Walk(meters: 100)

action = .Walk(meters: 10)

action = .Turn(direction: .Left)

var direction = Direction(rawValue: "Right!")!

action = .Turn(direction: direction)

switch action {
    case .Stop:
        print("Stop")
    
    case .Walk(let meters) where meters < 100:
        print("short walk")
    
    case .Walk(let meters):
        print("long walk \(meters) meters")
    
    case .Run(let m, let s):
        print("run \(m) meters with speed \(s)")
    
    case .Turn(let dir) where dir == .Left:
        print("Turn left")
    
    case .Turn(let dir) where dir == .Right:
        print("Turn right")
    
    default: break
}

//print(Direction.Left.rawValue)

*/
