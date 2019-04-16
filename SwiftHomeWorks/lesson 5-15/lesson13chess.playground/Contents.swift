class ChessBoard {
    enum PieceType {
        case pawnWhite, pawnBlack, rook, knight, bishop, king, queen
    }
    
    enum PieceColor {
        case black, white
    }
    
    struct Piece {
        let type: PieceType
        let color: PieceColor
    }
    
    var board: Array<Piece?>
    let boardWidth = 8
    let boardSize: Int
    let boardXLetters: [Character:Int] = ["a": 0, "b": 1, "c": 2, "d": 3, "e": 4, "f": 5, "g": 6, "h": 7]
    let boardYLetters: [Character:Int] = ["1": 7, "2": 6, "3": 5, "4": 4, "5": 3, "6": 2, "7": 1, "8": 0]
    
    init() {
        boardSize = boardWidth * boardWidth
        board = Array(repeating: nil, count: boardSize)
    }
    
    func setStartPosition() {
        for i in "abcdefgh" {
            addPiece(.pawnBlack, .black, "\(i)7")
            addPiece(.pawnWhite, .white, "\(i)2")
        }
        addPiece(.rook, .black, "a8")
        addPiece(.knight, .black, "b8")
        addPiece(.bishop, .black, "c8")
        addPiece(.queen, .black, "d8")
        addPiece(.king, .black, "e8")
        addPiece(.bishop, .black, "f8")
        addPiece(.knight, .black, "g8")
        addPiece(.rook, .black, "h8")
        addPiece(.rook, .white, "a1")
        addPiece(.knight, .white, "b1")
        addPiece(.bishop, .white, "c1")
        addPiece(.queen, .white, "d1")
        addPiece(.king, .white, "e1")
        addPiece(.bishop, .white, "f1")
        addPiece(.knight, .white, "g1")
        addPiece(.rook, .white, "h1")
    }
    
    func posString2Index(_ pos: String) -> Int {
        var pos = pos
        if pos.count == 3 {
            pos.remove(at: pos.startIndex)
        }
        let index = boardYLetters[pos.last!]! * boardWidth + boardXLetters[pos.first!]!
        return index
    }
    
    func addPiece(_ pieceType: PieceType, _ pieceColor: PieceColor, _ pos: Int) {
        board[pos] = Piece(type: pieceType, color: pieceColor)
    }
    
    func addPiece(_ pieceType: PieceType, _ pieceColor: PieceColor, _ pos: String) {
        addPiece(pieceType, pieceColor, posString2Index(pos))
    }
    
    func printBoard() {
        let colorWhite = "\u{2b1c}", colorBlack = "\u{2b1b}"
        let unicodeBlackChess: [PieceType:String] = [
            .pawnBlack: "\u{265f}",
             .rook: "\u{265c}",
             .knight: "\u{265e}",
             .bishop: "\u{265d}",
             .king: "\u{265a}",
             .queen: "\u{265b}"
        ]
        
        let unicodeWhiteChess: [PieceType:String] = [
            .pawnWhite: "\u{2659}",
             .rook: "\u{2656}",
             .knight: "\u{2658}",
             .bishop: "\u{2657}",
             .king: "\u{2654}",
             .queen: "\u{2655}"
        ]
        
        for y in 0..<boardWidth {
            for x in 0..<boardWidth {
                if let piece = board[x + y * boardWidth] {
                    print("\(piece.color == .white ? unicodeWhiteChess[piece.type]! : unicodeBlackChess[piece.type]!)", terminator: "")
                } else {
                    print("\(y % 2 == x % 2 ? colorWhite : colorBlack)", terminator: "")
                }
            }
            print()
        }
    }
    
    enum Directions {
        case n, ne, e, se, s, sw, w, nw
    }
    
    let rules: [PieceType:(Int, [Directions:Int])] = [
        .pawnWhite:(2, [.n: -8, .ne: -7, .nw: -9]),
        .pawnBlack:(2, [.s: 8, .se: 9, .sw: 7]),
        .rook:(7, [.n: -8, .s: 8, .e: 1, .w: -1]),
        .knight:(1, [.n: -15, .ne: -6, .e: 10, .se: 17, .s: 15, .sw: 6, .w: -10, .nw: -17]),
        .bishop:(7, [.ne: -7, .se: 9, .sw: 7, .nw: -9]),
        .king:(1, [.n: -8, .ne: -7, .e: 1, .se: 9, .s: 8, .sw: 7, .w: -1, .nw: -9]),
        .queen:(7, [.n: -8, .ne: -7, .e: 1, .se: 9, .s: 8, .sw: 7, .w: -1, .nw: -9])
    ]
    
    func getDirection(_ delta: Int) -> Directions? {
        switch delta {
        case let(d) where d < 0 && (d % 8 == 0 || d == -15): return Directions.n
        case let(d) where d < 0 && (d  == -1 || d == -10): return Directions.w
        case let(d) where d < 0 && (d % 7 == 0 || d == -6): return Directions.ne
        case let(d) where d < 0 && (d % 9 == 0 || d == -17): return Directions.nw
        case let(d) where d < 0 && (d % 8 == 0 || d == 15): return Directions.s
        case let(d) where d < 0 && (d == 1 || d == 10): return Directions.e
        case let(d) where d < 0 && (d % 7 == 0 || d == 6): return Directions.sw
        case let(d) where d < 0 && (d % 9 == 0 || d == 17): return Directions.se
        default: return nil
        }
    }
    
    func makeMove(_ move: String) {
        print("\(move)")
        let moves = move.split(separator: "-")
        let startAddress = moves[0].description, finishAddress = moves[1].description
        let startIndex = posString2Index(startAddress), finishIndex = posString2Index(finishAddress)
        let delta = finishIndex - startIndex
        guard let piece = board[startIndex] else {
            print("No piece in address: \(startAddress)")
            return
        }
        guard let direction = getDirection(delta) else {
            print("Invalid direction")
            return
        }
        let rule = rules[piece.type]!
        switch rule {
        case let(distance, directionList):
            guard let delta = directionList[direction] else {
                print("Illegal rule")
                return
            }
            var newIndex = startIndex
            for _ in 1...distance {
                newIndex += delta
                if board[newIndex] != nil || newIndex == finishIndex {
                    break
                }
            }
            guard newIndex == finishIndex else {
                print("can't move")
                return
            }
        }
        board[finishIndex] = board[startIndex]
        board[startIndex] = nil
        printBoard()
    }
}

let board = ChessBoard()
board.setStartPosition()
board.makeMove("e2-e4")
board.makeMove("d7-d4")
board.makeMove("Bf1-c4")
board.makeMove("Nb8-c6")
board.makeMove("Qd1-h5")
board.makeMove("Ng8-f6")
board.makeMove("Qh5-f7")

board.makeMove("e2-f7")
board.makeMove("d2-f7")
board.makeMove("Ra1-a3")
board.makeMove("Bc4-b4")

