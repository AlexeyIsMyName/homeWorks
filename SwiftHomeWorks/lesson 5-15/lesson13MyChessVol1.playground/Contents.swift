enum ColorOfPieces: String {
    case white = "White"
    case black = "Black"
}
enum NameOfPieces: String {
    case king = "King"
    case queen = "Queen"
    case bishop = "Bishop"
    case knight = "Knight"
    case rook = "Rook"
    case pawn = "Pawn"
}
enum Symbols: String {
    case kingWhite = "🤴🏻"
    case kingBlack = "🤴🏿"
    case queenWhite = "👸🏼"
    case queenBlack = "👸🏿"
    case bishopWhite = "👶🏻"
    case bishopBlack = "👶🏿"
    case knightWhite = "🦄"
    case knightBlack = "🐴"
    case rookWhite = "🌝"
    case rookBlack = "🌚"
    case pawnWhite = "🐼"
    case pawnBlack = "🐻"
    case cellWhite = "⬜️"
    case cellBlack = "⬛️"
}
struct Piece {
    var name: NameOfPieces
    var color: ColorOfPieces
    var symbol: Symbols
    var column: String
    var row: Int
}
var chessboard = [Piece]()
func resetTheChessField() {
    chessboard.removeAll()
    for y in 1...8 {
        for i in "ABCDEFGH" {
            let x = String(i)
            let i = (x, y)
            switch i {
            case ("D", 1):
                chessboard.append(Piece(name: .queen, color: .black, symbol: .queenBlack, column: x, row: y))
            case ("D", 8):
                chessboard.append(Piece(name: .queen, color: .white, symbol: .queenWhite, column: x, row: y))
            case ("E", 1):
                chessboard.append(Piece(name: .king, color: .black, symbol: .kingBlack, column: x, row: y))
            case ("E", 8):
                chessboard.append(Piece(name: .king, color: .white, symbol: .kingWhite, column: x, row: y))
            case ("C"..."F", 1):
                chessboard.append(Piece(name: .rook, color: .black, symbol: .rookBlack, column: x, row: y))
            case ("C"..."F", 8):
                chessboard.append(Piece(name: .rook, color: .white, symbol: .rookWhite, column: x, row: y))
            case ("B"..."G", 1):
                chessboard.append(Piece(name: .knight, color: .black, symbol: .knightBlack, column: x, row: y))
            case ("B"..."G", 8):
                chessboard.append(Piece(name: .knight, color: .white, symbol: .knightWhite, column: x, row: y))
            case ("A"..."H", 1):
                chessboard.append(Piece(name: .bishop, color: .black, symbol: .bishopBlack, column: x, row: y))
            case ("A"..."H", 8):
                chessboard.append(Piece(name: .bishop, color: .white, symbol: .bishopWhite, column: x, row: y))
            case ("A"..."H", 2):
                chessboard.append(Piece(name: .pawn, color: .black, symbol: .pawnBlack, column: x, row: y))
            case ("A"..."H", 7):
                chessboard.append(Piece(name: .pawn, color: .white, symbol: .pawnWhite, column: x, row: y))
            default:
                break
            }
        }
    }
    printChessboard(array: chessboard)
}
func printChessboard(array: [Piece]) {
    print("\n   A B C D E F G H")
    for y in 1...8 {
        print(y, terminator: " ")
        var xPoint = 1
        for i in "ABCDEFGH" {
            var cell = ""
            let x = String(i)
            for figure in array {
                switch figure {
                case _ where figure.name == NameOfPieces.king && figure.column == x && figure.row == y:
                    cell = figure.symbol.rawValue
                case _ where figure.name == NameOfPieces.queen && figure.column == x && figure.row == y:
                    cell = figure.symbol.rawValue
                case _ where figure.name == NameOfPieces.bishop && figure.column == x && figure.row == y:
                    cell = figure.symbol.rawValue
                case _ where figure.name == NameOfPieces.knight && figure.column == x && figure.row == y:
                    cell = figure.symbol.rawValue
                case _ where figure.name == NameOfPieces.rook && figure.column == x && figure.row == y:
                    cell = figure.symbol.rawValue
                case _ where figure.name == NameOfPieces.pawn && figure.column == x && figure.row == y:
                    cell = figure.symbol.rawValue
                default:
                    break
                }
            }
            if cell.isEmpty {
                print(xPoint % 2 == y % 2 ? Symbols.cellBlack.rawValue : Symbols.cellWhite.rawValue, terminator: "")
            } else {
                print(cell, terminator: "")
            }
            xPoint += 1
        }
        print(" \(y)")
    }
    print("   A B C D E F G H")
}

struct NewPoint {
    var Column: String
    var Row: Int
    var newColumn: String
    var newRow: Int
}

func replaceWordToNumber(word: String) -> Int {
    switch word {
    case "A":   return 1
    case "B":   return 2
    case "C":   return 3
    case "D":   return 4
    case "E":   return 5
    case "F":   return 6
    case "G":   return 7
    case "H":   return 8
    default:    return 0
    }
}

func checkToValidate(piece: [Piece], move: NewPoint) -> Bool {
    if !(1...8 ~= move.newRow) {
        return false
    }
    
    if move.newColumn < "A" || move.newColumn > "H" {
        print("New position out of field")
        return false
    }
    if move.Column == move.newColumn && move.Row == move.newRow {
        print("New position = Old position")
        return false
    }
    
    let oldX = replaceWordToNumber(word: move.Column)
    let newX = replaceWordToNumber(word: move.newColumn)
    
    let oldY = move.Row
    let newY = move.newRow
    
    
    var oldColor = ColorOfPieces.white
    var newColor = ColorOfPieces.black
    for i in 0...piece.count-1 {
        if (piece[i].column == move.Column) && (piece[i].row == move.Row) {
            oldColor = piece[i].color
        }
        if (piece[i].column == move.newColumn) && (piece[i].row == move.newRow) {
            newColor = piece[i].color
        }
    }
    for i in 0...piece.count-1 {
        if (piece[i].column == move.newColumn) && (piece[i].row == move.newRow) && (oldColor == newColor) {
            return false
        }
    }
    
    for i in 0...piece.count-1 {
        switch (piece[i].name, piece[i].column, piece[i].row) {
        case (.pawn, move.Column, move.Row):
            return  (oldY == 7 && newY == 5 && oldX == newX) ||
                    (oldY == 2 && newY == 4 && oldX == newX) ||
                    (newY == oldY + 1 && piece[i].color == .black  && oldX == newX) ||
                    (newY == oldY - 1 && piece[i].color == .white  && oldX == newX)
        case (.bishop, move.Column, move.Row):
            return  (oldY == newY) || (oldX == newX)
        case (.knight, move.Column, move.Row):
            return  (oldY + oldX == newX + newY + 3) || (oldY + oldX == newX + newY + 1) ||
                    (oldY + oldX + 3 == newX + newY) || (oldY + oldX + 1 == newX + newY)
        case (.rook, move.Column, move.Row):
            return  abs(newX - oldX) == abs(newY - oldY)
        case (.queen, move.Column, move.Row):
            return  abs(newX - oldX) == abs(newY - oldY) || (oldY == newY) || (oldX == newX)
        case (.king, move.Column, move.Row):
            return  (newX >= oldX - 1) && (newX <= oldX + 1) && (newY >= oldY - 1) && (newY <= oldY + 1)
        default:
            break
        }
    }
    return false
}

func movePiece(piece: inout [Piece], move: NewPoint) -> () {
    if checkToValidate(piece: piece, move: move) {
        for i in 0...piece.count-1 {
            switch (piece[i].column, piece[i].row)  {
            case (move.Column, move.Row):
                piece[i].column = move.newColumn
                piece[i].row = move.newRow
                printChessboard(array: chessboard)
            default:
                break
            }
        }
    } else {
        print("\nimpossible to move, breaking the rules")
    }
}
resetTheChessField()

movePiece(piece: &chessboard, move: NewPoint(Column: "C", Row: 7, newColumn: "C", newRow: 5))
movePiece(piece: &chessboard, move: NewPoint(Column: "B", Row: 2, newColumn: "B", newRow: 3))

movePiece(piece: &chessboard, move: NewPoint(Column: "H", Row: 7, newColumn: "H", newRow: 5))
movePiece(piece: &chessboard, move: NewPoint(Column: "H", Row: 8, newColumn: "H", newRow: 6))

movePiece(piece: &chessboard, move: NewPoint(Column: "H", Row: 6, newColumn: "A", newRow: 6))
movePiece(piece: &chessboard, move: NewPoint(Column: "G", Row: 8, newColumn: "H", newRow: 6))
movePiece(piece: &chessboard, move: NewPoint(Column: "H", Row: 6, newColumn: "F", newRow: 5))
movePiece(piece: &chessboard, move: NewPoint(Column: "F", Row: 5, newColumn: "D", newRow: 6))

movePiece(piece: &chessboard, move: NewPoint(Column: "B", Row: 1, newColumn: "C", newRow: 3))
movePiece(piece: &chessboard, move: NewPoint(Column: "C", Row: 3, newColumn: "B", newRow: 5))

movePiece(piece: &chessboard, move: NewPoint(Column: "C", Row: 1, newColumn: "A", newRow: 3))
movePiece(piece: &chessboard, move: NewPoint(Column: "A", Row: 3, newColumn: "B", newRow: 4))
movePiece(piece: &chessboard, move: NewPoint(Column: "B", Row: 4, newColumn: "C", newRow: 3))
movePiece(piece: &chessboard, move: NewPoint(Column: "C", Row: 3, newColumn: "F", newRow: 6))

movePiece(piece: &chessboard, move: NewPoint(Column: "D", Row: 8, newColumn: "A", newRow: 5))
movePiece(piece: &chessboard, move: NewPoint(Column: "A", Row: 5, newColumn: "A", newRow: 4))
movePiece(piece: &chessboard, move: NewPoint(Column: "A", Row: 4, newColumn: "H", newRow: 4))
movePiece(piece: &chessboard, move: NewPoint(Column: "H", Row: 4, newColumn: "G", newRow: 3))

movePiece(piece: &chessboard, move: NewPoint(Column: "E", Row: 8, newColumn: "D", newRow: 8))
movePiece(piece: &chessboard, move: NewPoint(Column: "D", Row: 8, newColumn: "C", newRow: 7))
movePiece(piece: &chessboard, move: NewPoint(Column: "C", Row: 7, newColumn: "C", newRow: 6))

movePiece(piece: &chessboard, move: NewPoint(Column: "C", Row: 6, newColumn: "E", newRow: 4))

movePiece(piece: &chessboard, move: NewPoint(Column: "C", Row: 6, newColumn: "D", newRow: 6))

movePiece(piece: &chessboard, move: NewPoint(Column: "D", Row: 6, newColumn: "D", newRow: 9))
