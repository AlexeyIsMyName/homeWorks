
/*
007. Уровень супермен - Выполните задание шахмат из урока по энумам используя структуры либо классы
*/
print("\nChess in struct")
//_______________________________________(Part_1)
enum ColorOfPieces: String {
    case white = "White"
    case black = "Black"
}

enum PiecesName: String {
    case king = "King"
    case queen = "Queen"
    case bishop = "Bishop"
    case knight = "Knight"
    case rook = "Rook"
    case pawn = "Pawn"
}

struct Piece {
    var name: PiecesName
    var color: ColorOfPieces
    var column: String
    var row: Int
}

var blackKing = Piece(name: PiecesName.king, color: ColorOfPieces.black, column: "D", row: 8)
var whiteQueen = Piece(name: PiecesName.queen, color: ColorOfPieces.white, column: "C", row: 6)
var whiteRook = Piece(name: PiecesName.rook, color: ColorOfPieces.white, column: "G", row: 5)

var chessboardArray = [blackKing, whiteQueen, whiteRook]

//_______________________________________(Part_2)
func printPiecePoint(piece: Piece) {
    switch piece.name {
    case PiecesName.king:
        print("\(PiecesName.king.rawValue) \(piece.color.rawValue) on \(piece.column)\(piece.row)")
    case PiecesName.queen:
        print("\(PiecesName.queen.rawValue) \(piece.color.rawValue) on \(piece.column)\(piece.row)")
    case PiecesName.bishop:
        print("\(PiecesName.bishop.rawValue) \(piece.color.rawValue) on \(piece.column)\(piece.row)")
    case PiecesName.knight:
        print("\(PiecesName.knight.rawValue) \(piece.color.rawValue) on \(piece.column)\(piece.row)")
    case PiecesName.rook:
        print("\(PiecesName.rook.rawValue) \(piece.color.rawValue) on \(piece.column)\(piece.row)")
    case PiecesName.pawn:
        print("\(PiecesName.pawn.rawValue) \(piece.color.rawValue) on \(piece.column)\(piece.row)")
    }
}

for figure in chessboardArray {
    printPiecePoint(piece: figure)
}

//_______________________________________(Part_3)
func printChessboard(array: [Piece]) {
    print("\n   A B C D E F G H")
    for y in 1...8 {
        print(y, terminator: " ")
        var xPoint = 1
        for x in "ABCDEFGH" {
            var prin = ""
            for figure in array {
                switch figure {
                case _ where figure.name == PiecesName.king && figure.column == String(x) && figure.row == y:
                    prin = (figure.color == ColorOfPieces.white ? "♔" : "♚")
                case _ where figure.name == PiecesName.queen && figure.column == String(x) && figure.row == y:
                    prin = (figure.color == ColorOfPieces.white ? "♔" : "♚")
                case _ where figure.name == PiecesName.bishop && figure.column == String(x) && figure.row == y:
                    prin = (figure.color == ColorOfPieces.white ? "♔" : "♚")
                case _ where figure.name == PiecesName.knight && figure.column == String(x) && figure.row == y:
                    prin = (figure.color == ColorOfPieces.white ? "♔" : "♚")
                case _ where figure.name == PiecesName.rook && figure.column == String(x) && figure.row == y:
                    prin = (figure.color == ColorOfPieces.white ? "♔" : "♚")
                case _ where figure.name == PiecesName.pawn && figure.column == String(x) && figure.row == y:
                    prin = (figure.color == ColorOfPieces.white ? "♔" : "♚")
                default:
                    break
                }
            }
            if prin.isEmpty {
                print(xPoint % 2 == y % 2 ? "⬛️" : "⬜️", terminator: "")
            } else {
                print(prin, terminator: "")
            }
            xPoint += 1
        }
        print(" \(y)")
    }
    print("   A B C D E F G H")
}

printChessboard(array: chessboardArray)

//_______________________________________(Part_4)
func turn(figure: inout Piece, newPos: (String, Int)) {
    let (x, y) = newPos
    switch figure {
    case _ where figure.name == PiecesName.pawn:
        figure = Piece(name: PiecesName.pawn, color: figure.color, column: x, row: y)
    case _ where figure.name == PiecesName.rook:
        figure = Piece(name: PiecesName.rook, color: figure.color, column: x, row: y)
    case _ where figure.name == PiecesName.knight:
        figure = Piece(name: PiecesName.knight, color: figure.color, column: x, row: y)
    case _ where figure.name == PiecesName.bishop:
        figure = Piece(name: PiecesName.bishop, color: figure.color, column: x, row: y)
    case _ where figure.name == PiecesName.queen:
        figure = Piece(name: PiecesName.queen, color: figure.color, column: x, row: y)
    case _ where figure.name == PiecesName.king:
        figure = Piece(name: PiecesName.king, color: figure.color, column: x, row: y)
    default: break
    }
}

turn(figure: &chessboardArray[0], newPos: ("C", 8))
turn(figure: &chessboardArray[1], newPos: ("E", 8))
turn(figure: &chessboardArray[2], newPos: ("D", 8))

printChessboard(array: chessboardArray)

let x = 15
let y = 315
let z = abs(x - y)

