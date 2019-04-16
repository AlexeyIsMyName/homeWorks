enum SpaceColor: String {
    case white = "White"
    case black = "Black"
}
enum FigureName: String {
    case king = "King"
    case queen = "Queen"
    case bishop = "Bishop"
    case pawn = "Pawn"
    case knight = "Knight"
    case rook = "Rook"
}
enum Column: Int {
    case A = 1, B, C, D, E, F, G, H
}

struct Figure {
    var color: SpaceColor
    var name: FigureName
    var position: (x: Column, y: Int)
}

let blackQueen = Figure(color: .black, name: .queen, position: (.B, 3))
let blackKing = Figure(color: .black, name: .king, position: (.E, 5))
let whiteKing = Figure(color: .white, name: .king, position: (.A, 1))
var figureArray = [blackQueen, blackKing, whiteKing]
func printPiece(piece: Figure) {
    print("\(piece.name.rawValue) \(piece.color.rawValue) \(piece.position.x) \(piece.position.y)")
}
for piece in figureArray {
    printPiece(piece: piece)
}
print("\n")

func symbolPiece(piece: Figure) -> Character {
    switch (piece.name, piece.color) {
    case (.king, let color):
        return color == .white ? "\u{2654}" : "\u{265A}"
    case (.queen, let color):
        return color == .white ? "\u{2655}" : "\u{265B}"
    case (.bishop, let color):
        return color == .white ? "\u{2657}" : "\u{265D}"
    case (.pawn, let color):
        return color == .white ? "\u{2659}" : "\u{265F}"
    case (.rook, let color):
        return color == .white ? "\u{2656}" : "\u{265C}"
    case (.knight, let color):
        return color == .white ? "\u{2658}" : "\u{265E}"
    }
}

func blackOrWhiteCell(x: Int, y: Int) -> Character {
    return x % 2 == y % 2 ? "\u{25FE}" : "\u{25FD}"
}

func chessField(pieces: [Figure]) {
    print("  A B C D E F G H")
    for y in 1...8 {
        var row = String()
        row += "\(y)"
        for x in 1...8 {
            var symbol = blackOrWhiteCell(x: x, y: y)
            for piece in pieces {
                if piece.position.x.rawValue == x && piece.position.y == y {
                    symbol = symbolPiece(piece: piece)
                }
            }
            row.append(symbol)
        }
        row += "\(y)"
        print(row)
    }
    print("  A B C D E F G H")
}

chessField(pieces: figureArray)

func canMoveFigure(piece: Figure, to: (x: Int, y: Int)) -> Bool {
    if piece.position.x.rawValue == to.x && piece.position.y == to.y {
        return false
    }
    if to.y < 1 || to.y > 8 {
        return false
    }
    let desX = abs(piece.position.x.rawValue - to.x)
    let desY = abs(piece.position.y - to.y)
    switch piece.name {
    case .king:
        return (desX == 1 && desY == 0) || (desX == 0 && desY == 1)
    case .queen:
        return (desX == 0) || (desY == 0) || (desX == desY)
    case .bishop:
        return (desX == desY)
    case .rook:
        return (desX == 0) || (desY == 0)
    case .pawn:
        return (desX <= 1) && (desY <= 1)
    case .knight:
        return (desX == 1 && desY == 2) || (desX == 2 && desY == 1)
    }
}

func moveFigure(piece: inout Figure, newPosition: (x: Column, y: Int)) -> Bool {
    if canMoveFigure(piece: piece, to: (newPosition.x.rawValue, newPosition.y)) {
        piece.position.x = newPosition.x
        piece.position.y = newPosition.y
        return true
    }
    return false
}

moveFigure(piece: &figureArray[1], newPosition: (.H, 8))
moveFigure(piece: &figureArray[2], newPosition: (.A, 5))
moveFigure(piece: &figureArray[0], newPosition: (.C, 4))
chessField(pieces: figureArray)
