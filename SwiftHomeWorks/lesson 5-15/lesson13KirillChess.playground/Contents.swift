let whiteCell = "⬜️"
let blackCell = "⬛️"

class Figure {
    var type: Type
    var color: Color
    var picture: Picture
    
    enum `Type`: String {
        case pawn = "Pawn"
        case rook = "Rook"
        case knight = "Knight"
        case bishop = "Bishop"
        case queen = "Queen"
        case king = "King"
    }
    
    enum Color: String {
        case white = "white"
        case black = "black"
    }
    
    enum Picture: String {
        case whitePawn = "👶🏻"
        case whiteRook = "👨🏻‍✈️"
        case whiteKnight = "🦄"
        case whiteBishop = "👨🏻‍⚕️"
        case whiteQueen = "👸🏻"
        case whiteKing = "🤴🏻"
        case blackPawn = "👶🏿"
        case blackRook = "👨🏿‍✈️"
        case blackKnight = "🐴"
        case blackBishop = "👨🏿‍⚕️"
        case blackQueen = "👸🏿"
        case blackKing = "🤴🏿"
    }
    
    init(type: Type, color: Color, picture: Picture) {
        self.type = type
        self.color = color
        self.picture = picture
    }
}

var figureDict = [String: Figure]()

func startPossition() {
    figureDict.removeAll()
    let letters = ["A", "B", "C", "D", "E", "F", "G", "H"]
    for x in 1...letters.count {
        for y in 1...8 {
            let temp = (letters[x-1] + String(y))
            switch temp {
            case "A7", "B7", "C7", "D7", "E7", "F7", "G7", "H7":
                figureDict[temp] = Figure.init(type: .pawn, color: .white, picture: .whitePawn)
            case "A2", "B2", "C2", "D2", "E2", "F2", "G2", "H2":
                figureDict[temp] = Figure.init(type: .pawn, color: .black, picture: .blackPawn)
            case "A8", "H8":
                figureDict[temp] = Figure.init(type: .rook, color: .white, picture: .whiteRook)
            case "A1", "H1":
                figureDict[temp] = Figure.init(type: .rook, color: .black, picture: .blackRook)
            case "B8", "G8":
                figureDict[temp] = Figure.init(type: .knight, color: .white, picture: .whiteKnight)
            case "B1", "G1":
                figureDict[temp] = Figure.init(type: .knight, color: .black, picture: .blackKnight)
            case "C8", "F8":
                figureDict[temp] = Figure.init(type: .bishop, color: .white, picture: .whiteBishop)
            case "C1", "F1":
                figureDict[temp] = Figure.init(type: .bishop, color: .black, picture: .blackBishop)
            case "D1":
                figureDict[temp] = Figure.init(type: .queen, color: .white, picture: .whiteQueen)
            case "D8":
                figureDict[temp] = Figure.init(type: .queen, color: .black, picture: .blackQueen)
            case "E1":
                figureDict[temp] = Figure.init(type: .king, color: .white, picture: .whiteKing)
            case "E8":
                figureDict[temp] = Figure.init(type: .king, color: .black, picture: .blackKing)
            default:
                Void.self
            }
        }
    }
}

startPossition()

func makeBoard() {
    let letters = ["A", "B", "C", "D", "E", "F", "G", "H"]
    print("   A B C D E F G H")
    for line in 1...8 {
        var result = ""
        for row in 1...8 {
            result += (line + row) % 2 == 0 ? whiteCell : blackCell
            for key in figureDict.keys {
                if key == letters[row-1] + String(line) {
                result.removeLast()
                result += figureDict[letters[row-1] + String(line)]!.picture.rawValue
                } else {
                }
            }
        }
        print("\(line) \(result)")
    }
    print("\n")
}

makeBoard()

func chekPossition(posPoint: String) -> Bool {
    let row = ["A": 1, "B": 2, "C": 3, "D": 4, "E": 5, "F": 6, "G": 7, "H": 8]
    let line = ["1": 1, "2": 2, "3": 3, "4": 4, "5": 5, "6": 6, "7": 7, "8": 8]
    var x = posPoint
    let xLine = String(x.removeLast())
    var y = posPoint
    let yRow = String(y.removeLast())
    if line[xLine] != nil && line[xLine]! <= 8 && row[yRow] != nil && row[yRow]! <= 8 {
        return false
    } else {
        return true
    }
}

func separate(posPoint: String) -> (Int, Int) {
    let row = ["A": 1, "B": 2, "C": 3, "D": 4, "E": 5, "F": 6, "G": 7, "H": 8]
    let line = ["1": 1, "2": 2, "3": 3, "4": 4, "5": 5, "6": 6, "7": 7, "8": 8]
    var x = posPoint
    let xLine = String(x.removeLast())
    var y = posPoint
    let yRow = String(y.removeLast())
    if line[xLine] != nil && row[yRow] != nil {
    }
    return (line[xLine]!, row[yRow]!)
}

func move(moveFrom: String, moveTo: String) {
    let moveFrom = moveFrom.uppercased(), moveTo = moveTo.uppercased()
    if figureDict[moveFrom] == nil {
        print("no figure in the cell \(moveFrom)")
    } else if chekPossition(posPoint: moveTo) {
        print("point \(moveTo) out of board")
    } else if figureDict[moveTo] != nil && figureDict[moveTo]?.color == figureDict[moveFrom]?.color {
        print("on \(moveTo) already stay your \(figureDict[moveTo]!.type)")
    } else {
    }
}
