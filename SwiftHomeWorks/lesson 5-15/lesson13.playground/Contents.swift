/*
1. Создайте структуру студент. Добавьте свойства: имя, фамилия, год рождения, средний бал. Создайте несколько экземпляров этой структуры и заполните их данными. Положите их всех в массив (журнал).
*/
 
struct Student {
    var name: String
    var surname: String
    var yearOfBirth: Int
    var averageGrade: Int
}

let student1 = Student(name: "Aleksandr", surname: "Kuznecov", yearOfBirth: 1989, averageGrade: 5)
let student2 = Student(name: "Vlodimir", surname: "Ivanov", yearOfBirth: 1988, averageGrade: 4)
let student3 = Student(name: "Sergey", surname: "Romanov", yearOfBirth: 1990, averageGrade: 4)
let student4 = Student(name: "Viktor", surname: "Frolov", yearOfBirth: 1987, averageGrade: 3)
let student5 = Student(name: "James", surname: "Bond", yearOfBirth: 1988, averageGrade: 5)

var studentBase = [student1, student2, student3, student4, student5]

/*
2. Напишите функцию, которая принимает массив студентов и выводит в консоль данные каждого. Перед выводом каждого студента добавляйте порядковый номер в “журнале”, начиная с 1.
*/

func printStudentBase(_ studentBase: [Student]) {
    var studentNumber = 1
    for student in studentBase {
        print("\(studentNumber). \(student.name) \(student.surname), year of birth \(student.yearOfBirth), average grade \(student.averageGrade)")
        studentNumber += 1
    }
}

print("Student Base")
printStudentBase(studentBase)
 
/*
3. С помощью функции sorted отсортируйте массив по среднему баллу, по убыванию и распечатайте “журнал”.
*/

print("\nStudent Base sorted by average grade")
printStudentBase(studentBase.sorted { $0.averageGrade < $1.averageGrade })

/*
4. Отсортируйте теперь массив по фамилии (по возрастанию), причем если фамилии одинаковые, а вы сделайте так чтобы такое произошло, то сравниваются по имени. Распечатайте “журнал”.
*/
let student6 = Student(name: "Boris", surname: "Frolov", yearOfBirth: 1988, averageGrade: 4)
studentBase.append(student6)

print("\nStudent Base sorted by surname and name")
printStudentBase(studentBase.sorted { $0.surname != $1.surname ? $0.surname < $1.name : $0.name < $1.name })
/*
5. Создайте переменную и присвойте ей ваш существующий массив. Измените в нем данные всех студентов. Изменится ли первый массив? Распечатайте оба массива.
*/

var studentBase2 = studentBase
studentBase2[0].name = "David"
studentBase2[1].name = "David"
studentBase2[2].name = "David"
studentBase2[3].name = "David"
studentBase2[4].name = "David"
studentBase2[5].name = "David"

print("\nStudent Base")
printStudentBase(studentBase)

print("\nStudent Base2")
printStudentBase(studentBase2)
 
/*
6. Теперь проделайте все тоже самое, но не для структуры Студент, а для класса. Какой результат в 5м задании? Что изменилось и почему?
*/

class Studentik {
    var name: String
    var surname: String
    var yearOfBirth: Int
    var averageGrade: Int
    
    init(name: String, surname: String, yearOfBirth: Int, averageGrade: Int) {
        self.name = name
        self.surname = surname
        self.yearOfBirth = yearOfBirth
        self.averageGrade = averageGrade
    }
}

func printBaseStudentik(studentBase: [Studentik]) {
    var valueNumber = 1
    for value in studentBase {
        print("\(valueNumber). \(value.name) \(value.surname), year of birth \(value.yearOfBirth), average grade \(value.averageGrade)")
        valueNumber += 1
    }
}

let studentik1 = Studentik(name: "Aleksandr", surname: "Kuznecov", yearOfBirth: 1989, averageGrade: 5)
let studentik2 = Studentik(name: "Vlodimir", surname: "Ivanov", yearOfBirth: 1988, averageGrade: 4)
let studentik3 = Studentik(name: "Sergey", surname: "Romanov", yearOfBirth: 1990, averageGrade: 4)
let studentik4 = Studentik(name: "Viktor", surname: "Frolov", yearOfBirth: 1987, averageGrade: 3)
let studentik5 = Studentik(name: "James", surname: "Bond", yearOfBirth: 1988, averageGrade: 5)
let studentik6 = Studentik(name: "Boris", surname: "Frolov", yearOfBirth: 1988, averageGrade: 4)

let studentikBase = [studentik1, studentik2, studentik3, studentik4, studentik5, studentik6]

print("\nStudentikBase1 before replase data")
printBaseStudentik(studentBase: studentikBase)

var studentikBase2 = studentikBase
studentikBase2[0].name = "David"
studentikBase2[1].name = "David"
studentikBase2[2].name = "David"
studentikBase2[3].name = "David"
studentikBase2[4].name = "David"
studentikBase2[5].name = "David"

print("\nStudentikBase1 after replase data")
printBaseStudentik(studentBase: studentikBase)

print("\nStudentikBase2")
printBaseStudentik(studentBase: studentikBase2)

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
 
/*
let student1 = (name: "Alex", age: 20)
let student2 = (name: "Bob", age: 22)

student1.name
student2.name

let student3 = (nam: "Sam", ag: 23)

student3.nam

class Student {
    var name = "No name"
    var age = 20
}

class StudentClass {
    var name: String
    var age: Int
    
    init() {
        name = "No name"
        age = 20
    }
    
    init(_name: String, _age: Int) {
        self.name = _name
        self.age = _age
    }
}

struct StudentStruct {
    var name: String
    var age: Int
}

func addOneYear(student: StudentClass) {
    student.age += 1
}

func addOneYear(student: inout StudentStruct) {
    //var studentF = student
    student.age += 1
}

let stClass = StudentClass(_name: "Bob", _age: 18)

stClass.name = "Alex"
stClass.age = 21

var stStruct = StudentStruct(name: "Sam", age: 24)

//stStruct.name = "Sam2"
//stStruct.age = 21

stStruct

var stStruct2 = stStruct
stStruct2.age
stStruct2.name
stStruct2.age = 25
stStruct2.name = "Samuel"

var stClass2 = stClass

stClass2.age = 20
stClass2.name = "AAA"
stClass2
stClass

stStruct
addOneYear(student: &stStruct)
stStruct

stClass
addOneYear(student: stClass)
stClass

var arrayStructs = [stStruct]
arrayStructs[0]

arrayStructs[0].age = 50
stStruct

var arrayClasses = [stClass]
arrayClasses[0]

arrayClasses[0].age = 50
stClass
*/
