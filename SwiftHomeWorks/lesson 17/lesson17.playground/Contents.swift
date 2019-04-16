class Field {
    var width: Int = 3
    var height: Int = 3
}

enum Player: String {
    case x = "❌"
    case o = "⭕️"
    case isEmpty = "⬜️"
}

class Game {
    var field = Field()
    var gameData = [String: Player]()
    
    func NewGame() {
        print("New Game")
        gameData.removeAll()
        PrintField()
    }
    
    func PrintField() {
        for height in 1...field.height {
            for wigth in 1...field.width {
                var cell = String()
                switch gameData[MakeKeyForGameData(ferstChar: wigth, secondChar: height)] ?? Player.isEmpty {
                case Player.x:
                    cell = Player.x.rawValue
                case Player.o:
                    cell = Player.o.rawValue
                case Player.isEmpty:
                    cell = Player.isEmpty.rawValue
                }
                print(cell, terminator: "")
            }
            print("\n", terminator: "")
        }
        print("\n", terminator: "")
    }
    
    func MakeKeyForGameData(ferstChar: Int, secondChar: Int) -> String {
        return String(ferstChar) + String(secondChar)
    }
    
    subscript(x: Int, y: Int) -> Player {
        get {
            return gameData[MakeKeyForGameData(ferstChar: x, secondChar: y)] ?? .isEmpty
        }
        set {
            if MayGetData(x: x, y: y, value: newValue) {
                gameData[MakeKeyForGameData(ferstChar: x, secondChar: y)] = newValue
                PrintField()
                CheckVictory()
            }
        }
    }
    
    func MayGetData(x: Int, y: Int, value: Player) -> Bool {
        if  gameData[MakeKeyForGameData(ferstChar: x, secondChar: y)] != Player.o &&
            gameData[MakeKeyForGameData(ferstChar: x, secondChar: y)] != Player.x &&
            x > 0 && x <= field.width &&
            y > 0 && y <= field.height {
                print("move \(value.rawValue) on \(x),\(y) is correct")
                return true
            
        } else {
            print("move \(value.rawValue) on \(x),\(y) isn't correct")
            return false
        }
    }
    
    func CheckVictory() {
        var valueOfChar = ["00", "00", "00"]
        
        for height in 1...field.height {
            for width in 1...field.width {
                valueOfChar.append(gameData[MakeKeyForGameData(ferstChar: height, secondChar: width)]?.rawValue ?? "00")
            }
        }

        for height in 1...field.height {
            for width in 1...field.width {
                valueOfChar.append(gameData[MakeKeyForGameData(ferstChar: height, secondChar: width)]?.rawValue ?? "00")
            }
        }

        for width in 1...field.width {
            valueOfChar.append(gameData[MakeKeyForGameData(ferstChar: width, secondChar: width)]?.rawValue ?? "00")
        }

        for height in 1...field.height {
            valueOfChar.append(gameData[MakeKeyForGameData(ferstChar: height, secondChar: field.height - height)]?.rawValue ?? "00")
        }

        for index in 2...valueOfChar.count - 1 {
            switch valueOfChar[index] + valueOfChar[index - 1] + valueOfChar[index - 2] {
            case Player.x.rawValue + Player.x.rawValue + Player.x.rawValue:
                print(Player.x.rawValue + " is Victory")
            case Player.o.rawValue + Player.o.rawValue + Player.o.rawValue:
                print(Player.o.rawValue + " is Victory")
            default:
                break
            }
        }
    }
}

var game = Game()

game.NewGame()

game[1, 1] = .o
game[1, 2] = .x
game[2, 2] = .o
game[3, 3] = .x
game[3, 1] = .o
game[2, 1] = .x
game[1, 3] = .o

/*
 
 Ferst level: Шахматная доска (Легкий уровень)
 
 1. Создайте тип шахматная доска.
 
 2. Добавьте сабскрипт, который выдает цвет клетки по координате клетки (буква и цифра).
 
 3. Если юзер ошибся координатами - выдавайте нил
 
 
 Second level: Крестики нолики (Средний уровень)
 
 1. Создать тип, представляющий собой поле для игры в крестики нолики
 На каждой клетке может быть только одно из значений: Пусто, Крестик, Нолик
 Добавьте возможность красиво распечатывать поле
 
 2. Добавьте сабскрипт, который устанавливает значение клетки по ряду и столбцу,
 причем вы должны следить за тем, чтобы программа не падала если будет введен не существующий ряд или столбец.
 
 3. Также следите за тем, чтобы нельзя было устанавливать крестик либо нолик туда, где они уже что-то есть. Добавьте метод очистки поля.
 
 4. Если хотите, добавте алгоритм, который вычислит победителя
 
 
 Third level: Морской бой (Тяжелый уровень)
 
 1. Создайте тип корабль, который будет представлять собой прямоугольник. В нем может быть внутренняя одномерная система координат (попахивает сабскриптом). Корабль должен принимать выстрелы по локальным координатам и вычислять когда он убит
 
 2. Создайте двумерное поле, на котором будут располагаться корабли врага. Стреляйте по полю и подбейте вражеский четырех трубник :)
 
 3. Сделайте для приличия пару выстрелов мимо, красивенько все выводите на экран :)
 
 
 
let array = ["a", "b", "c"]
array[0]
array[1]
array[2]


struct Family {
    var father = "Father"
    var mother = "Mother"
    var kids = ["Kid1", "Kid2", "Kid3"]
    
    var count: Int {
        return 2 + kids.count
    }
    
    subscript(index: Int) -> String? {
        get {
            switch(index) {
            case 0: return father
            case 1: return mother
            case 2..<(2+kids.count): return kids[index - 2]
            default: return nil
            }
        }
        set {
            
            let value = newValue ?? ""
            
            switch(index) {
            case 0: return father = value
            case 1: return mother = value
            case 2..<(2+kids.count): return kids[index - 2] = value
            default: break
            }
        }
    }
    subscript(index: Int, suffix: String) -> String? {
        var name = self[index] ?? ""
        name += " " + suffix
        return name
    }
}

var family = Family()
family.father
family.mother
family.count
family[0]
family[1]
family[2]

family[0] = "Daddy"
family.father

family[3] = "Bubby"
family.kids[1]

family[3]
family[3, "the great!"]

struct Field {
    
    var dict = [String: String]()
    
    func KeyForColumn(column: String, andRow row: Int) -> String {
        
        return column + String(row)
        
    }
    
    subscript(column: String, row: Int) -> String? {
        
        get {
            return dict[KeyForColumn(column: column, andRow: row)]
        }
        
        set {
            dict[KeyForColumn(column: column, andRow: row)] = newValue
        }
    }
    
}

var field = Field()

field["a", 5]
field["a", 5] = "X"
field["a", 5]

*/
