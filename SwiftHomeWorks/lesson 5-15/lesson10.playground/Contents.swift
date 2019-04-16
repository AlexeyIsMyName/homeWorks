/*
 SWIFT Марафон. Урок 10: Функции
 1. Создайте пару функций с короткими именами, которые возвращают строку с классным символом или символами. Например heart() возвращает сердце и т.п. Вызовите все эти функции внутри принта для вывода строки этих символов путем конкатенации.
 */
print("Homework. Task 10. Part 1")
func football() -> String {
    return "⚽️"
}
func basketball() -> String {
    return "🏀"
}
print("My favorite sportgame is " + football() + " and " + basketball())
 /*
 2. Опять шахматные клетки. Реализовать функцию, которая принимает букву и символ и возвращает строку “белая” или “черная”. Строку потом распечатайте в консоль
 */
print("\nHomework. Task 10. Part 2")
func checkCell(cell: (String, Int)) -> String {
    var chess = [String:Bool]()
    var column = [String]()
    for i in "ABCDEFGH" {
        column.append(String(i))
    }
    for indexColumn in 0..<column.count {
        for indexLine in 1...8 {
            chess["\(column[indexColumn])\(String(indexLine))"] = indexColumn % 2 == indexLine % 2
        }
    }
    var whiteAndBlack = ""
    switch chess[cell.0 + String(cell.1)] {
        case false: whiteAndBlack = "Cell \(cell.0 + String(cell.1)) is White"
        case true: whiteAndBlack = "Cell \(cell.0 + String(cell.1)) is Black"
        default: break
    }
    return whiteAndBlack
}
let cell = ("D", 5)
print(checkCell(cell: cell))
//print(checkCell(inColumn: cell.0, line: cell.1))
 /*
 3. Создайте функцию, которая принимает массив, а возвращает массив в обратном порядке. Можете создать еще одну, которая принимает последовательность и возвращает массив в обратном порядке. Чтобы не дублировать код, сделайте так, чтобы функция с последовательностью вызывала первую.
 */
print("\nHomework. Task 10. Part 3")

func reverseArrey(array: [Any]) -> [Any] {
    var tempArray: [Any] = []
    for obj in array {
        tempArray.insert(obj, at: 0)
    }
    return tempArray
}

func reverseArrayFromSequence(sequence: Any...) -> [Any] {
    
    var array: [Any] = []
    for i in sequence {
        array += [i]
    }
    
    return reverseArrey(array: array)
}

print(reverseArrey(array: ["1", "2", "3"]))
print(reverseArrayFromSequence(sequence: 1, 2, 3, 4, 5, 6))
let x = reverseArrayFromSequence(sequence: 1...6)
x
 /*
 4. Разберитесь с inout самостоятельно и выполните задание номер 3 так, чтобы функция не возвращала перевернутый массив, но меняла элементы в существующем. Что будет если убрать inout?
 */
print("\nHomework. Task 10. Part 4 (inout)")

func funcMass2(mass: inout [String]){
    mass = mass.reversed()
}

var mass2 = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
print("\(mass2) - Заданный массив")
funcMass2(mass: &mass2)
print("\(mass2) - Массив после выполнения функции")

 /*
 5. Создайте функцию, которая принимает строку, убирает из нее все знаки препинания, делает все гласные большими буквами, согласные маленькими, а цифры меняет на соответствующие слова (9 -> nine и тд)
 */
print("\nHomework. Task 10. Part 5")

func funcPhrase2(phrase: inout String) {
    
    var newPrase = ""
    let numbers = ["0": "zero",
                   "1": "one",
                   "2": "two",
                   "3": "three",
                   "4": "four",
                   "5": "five",
                   "6": "six",
                   "7": "seven",
                   "8": "eight",
                   "9": "nine"]
    for value in phrase.lowercased() {
        switch String(value) {
        case "a", "e", "i", "o", "u", "y": newPrase += String(value).uppercased() // гласные
        case "a"..."z": newPrase.append(contentsOf: String(value)) // согласные
        case "0"..."9":
            if numbers[String(value)] != nil {
                newPrase += numbers[String(value)]!     // числа
            }
        case " ": newPrase.append(contentsOf: "  ")
        default:
            break
        }
    }
    phrase = newPrase
    
}
var phrase2 = "1. Little leaves fall softly down, Red and yellow, orange and brown, Whirling, twirling round and round, Falling softly to the ground 2. Little leaves fall softly down, To make a carpet on the ground. Then, swish, the wind comes whistling by, And sends them dancing to the sky."
print("String befor run option")
print(phrase2)
funcPhrase2(phrase: &phrase2)
print("\nString after run option")
print(phrase2)

/* 10.  Функции теория
DRY - Don't repeat yourself!

func calculateMoney(wallet: [Int], type: Int? = nil) -> (total: Int, count: Int) {
    
    var sum = 0
    var count = 0
    
    for value in wallet {
        
        if (type == nil) ||
            (type == value) {
            
            sum += value
            count += 1
        }
        
    }
    
    return (sum, count)
}

let wallet = [100, 5, 1, 5, 5, 20, 50, 100, 1, 1]

var money = calculateMoney(wallet: wallet, type: nil)

money

money = calculateMoney(wallet: wallet, type: 5)

money

let (money1, count1) = calculateMoney(wallet: wallet)

money1
count1

var sum = calculateMoney(wallet: wallet, type: 5).total

print("sum = \(sum)")



func calculateMoney(inSequence range: Int...) -> Int {
    
    var sum = 0
    
    for value in range {
        sum += value
    }
    
    return sum
}

calculateMoney(inSequence: 5,5,10,2,3,4,3,23,34,1,1)

func sayHi() -> () {
    print("hi")
}

//sayHi()
//sayHi()
//sayHi()
//sayHi()
//
//let hi = sayHi
//
//hi()
//hi()

let hi : () -> () = sayHi
hi()


func sayPhrase(phrase: String) -> Int? {
    print(phrase)
    return nil
}

sayPhrase(phrase: "aaa")

let phrase : (String) -> (Int?) = sayPhrase // (тип принимающиго значения) -> (тип возвращаемого значение)

phrase("bbb")


//func doSomething(whatToDo: () -> ()) {
//    whatToDo()
//}
//
//doSomething(whatToDo: hi)


func whatToDo() -> () -> () {
    
    func printSomething() {
        print("hello world")
    }
    return printSomething
}


whatToDo()()


let iShouldDoThis = whatToDo()
iShouldDoThis()

 
 */

