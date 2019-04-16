/*
 007. Уровень супермен - Выполните задание шахмат из урока по энумам используя структуры либо классы
 */
//print("\nChess in struct")
//_______________________________________(Part_1)
struct Piece {
    var name: PiecesName
    var color: ColorOfPieces
    var icon: PiecesIcon
    var column: String
    var row: Int
}

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

enum PiecesIcon: String {
    case whiteKing = "🤴🏻"
    case blackKing = "🤴🏿"
    case whiteQueen = "👸🏻"
    case blackQueen = "👸🏿"
    case whiteBishop = "🧛‍♂️"
    case blackBishop = "🧛🏿‍♂️"
    case whiteKnight = "🧝🏻‍♂️"
    case blackKnight = "🧝🏿‍♂️"
    case whiteRook = "👨🏻‍🌾"
    case blackRook = "👨🏿‍🌾"
    case whitePawn = "👮🏻‍♂️"
    case blackPawn = "👮🏿‍♂️"
}

var chessboardArray = [Piece]()

func startPossition() {
    chessboardArray.removeAll()
    for y in 1...8 {
        for x in "ABCDEFGH" {
            switch (x, y) {
            case ("D", 1):
                chessboardArray.append(Piece(name: .queen, color: .black, icon: .blackQueen, column: String(x), row: y))
            case ("D", 8):
                chessboardArray.append(Piece(name: .queen, color: .white, icon: .whiteQueen, column: String(x), row: y))
            case ("E", 1):
                chessboardArray.append(Piece(name: .king, color: .black, icon: .blackKing, column: String(x), row: y))
            case ("E", 8):
                chessboardArray.append(Piece(name: .king, color: .white, icon: .whiteKing, column: String(x), row: y))
            case ("C"..."F", 8):
                chessboardArray.append(Piece(name: .bishop, color: .white, icon: .whiteBishop, column: String(x), row: y))
            case ("C"..."F", 1):
                chessboardArray.append(Piece(name: .bishop, color: .black, icon: .blackBishop, column: String(x), row: y))
            case ("B"..."G", 8):
                chessboardArray.append(Piece(name: .knight, color: .white, icon: .whiteKnight, column: String(x), row: y))
            case ("B"..."G", 1):
                chessboardArray.append(Piece(name: .knight, color: .black, icon: .blackKnight, column: String(x), row: y))
            case ("A"..."H", 8):
                chessboardArray.append(Piece(name: .rook, color: .white, icon: .whiteRook, column: String(x), row: y))
            case ("A"..."H", 1):
                chessboardArray.append(Piece(name: .rook, color: .black, icon: .blackRook, column: String(x), row: y))
            case ("A"..."H", 7):
                chessboardArray.append(Piece(name: .pawn, color: .white, icon: .whitePawn, column: String(x), row: y))
            case ("A"..."H", 2):
                chessboardArray.append(Piece(name: .pawn, color: .black, icon: .blackPawn, column: String(x), row: y))
            default:
                break
            }
        }
    }
}

//_______________________________________(Part_2)
func printChessboard(array: [Piece]) {
    print("\n   A B C D E F G H")
    for y in 1...8 {
        print(y, terminator: " ")
        var xPoint = 1
        for x in "ABCDEFGH" {
            var prin = ""
            for figure in array {
                switch figure {
                case _ where figure.name == PiecesName.king && figure.column == String(x) && figure.row == y && figure.color == ColorOfPieces.white:
                    prin = figure.icon.rawValue
                case _ where figure.name == PiecesName.king && figure.column == String(x) && figure.row == y && figure.color == ColorOfPieces.black:
                    prin = figure.icon.rawValue
                    
                case _ where figure.name == PiecesName.queen && figure.column == String(x) && figure.row == y:
                    prin = (figure.color == ColorOfPieces.white ? PiecesIcon.whiteQueen.rawValue : PiecesIcon.blackQueen.rawValue)
                case _ where figure.name == PiecesName.bishop && figure.column == String(x) && figure.row == y:
                    prin = (figure.color == ColorOfPieces.white ? PiecesIcon.whiteBishop.rawValue : PiecesIcon.blackBishop.rawValue)
                case _ where figure.name == PiecesName.knight && figure.column == String(x) && figure.row == y:
                    prin = (figure.color == ColorOfPieces.white ? PiecesIcon.whiteKnight.rawValue : PiecesIcon.blackKnight.rawValue)
                case _ where figure.name == PiecesName.rook && figure.column == String(x) && figure.row == y:
                    prin = (figure.color == ColorOfPieces.white ? PiecesIcon.whiteRook.rawValue : PiecesIcon.blackRook.rawValue)
                case _ where figure.name == PiecesName.pawn && figure.column == String(x) && figure.row == y:
                    prin = (figure.color == ColorOfPieces.white ? PiecesIcon.whitePawn.rawValue : PiecesIcon.blackPawn.rawValue)
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


startPossition()
printChessboard(array: chessboardArray)

/*
//_______________________________________(Part_3)
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

*/
