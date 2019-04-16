/*
 SWIFT Марафон. Урок 9: Switch
 1. Создать строку произвольного текста, минимум 200 символов. Используя цикл и оператор свитч посчитать количество гласных, согласных, цифр и символов.
*/
print("Lesson 9: Switch. Part 1")
let phrase = "1. Little leaves fall softly down, Red and yellow, orange and brown, Whirling, twirling round and round, Falling softly to the ground 2. Little leaves fall softly down, To make a carpet on the ground. Then, swish, the wind comes whistling by, And sends them dancing to the sky."
var countVowels = 0 // гласные буквы
var countConsonants = 0 //  согласные буквы
var countNumbers = 0 // числа
var countSymbol = 0 // символы
let vowels = ["a", "e", "i", "o", "u", "y"]

for value in phrase.lowercased() {
    
    switch String(value) {
    case let a where vowels.contains(a): countVowels += 1 // гласные
    case "a"..."z": countConsonants += 1 // согласные
    case "0"..."9": countNumbers += 1 // цифры
    case "\u{0020}"..."\u{002F}": countSymbol += 1 // диапазон символов Unicode
    case "\u{003A}"..."\u{0040}": countSymbol += 1 // диапазон символов Unicode
    case "\u{005B}"..."\u{0060}": countSymbol += 1 // диапазон символов Unicode
    case "\u{007B}"..."\u{007E}": countSymbol += 1 // диапазон символов Unicode
    default:
        break
    }
}
print(phrase)
print("The number of vowels in the phrase is \(countVowels)")
print("The number of consonants in the phrase is \(countConsonants)")
print("The number of numbers in the phrase is \(countNumbers)")
print("The number of symbol in the phrase is \(countSymbol)")

// 2. Создайте свитч который принимает возраст человека и выводит описание жизненного этапа
print()
print("Lesson 9: Switch. Part 2")

let age = 29

switch age {
    case 0...3: print("Early childhood")
    case 3...12: print("Younger school age")
    case 12...21: print("Teenage years")
    case 21...35: print("Adulthood 1")
    case 35...60: print("Adulthood 2")
    case 60...75: print("Elderly age")
    case 75...90: print("Old age")
    case 90...200: print("Long-livers")
    default: break
}

 /*
 3. У вас есть имя отчество и фамилия студента (русские буквы). Имя начинается с А или О, то обращайтесь к студенту по имени, если же нет, то если у него отчество начинается на В или Д, то обращайтесь к нему по имени и отчеству, если же опять нет, то в случае если фамилия начинается с Е или З, то обращайтесь к нему только по фамилии. В противном случае обращайтесь к нему по полному имени.
 */
print()
print("Lesson 9: Switch. Part 3")

let student = ("Суслов", "Алексей", "Михайлович")

switch student {
    case let (_, firstName, _) where firstName.first == "А" || firstName.first == "О": print("Студент \(firstName)")
    case let (_, firstName, thirdName) where thirdName.first == "В" || thirdName.first == "Д": print("Студент \(firstName) \(thirdName)")
    case let (surname, _, _) where surname.first == "Е" || surname.first == "З": print("Студент \(surname)")
    default: print("Студент \(student.0) \(student.1) \(student.2)")
}

/*
 4. Представьте что вы играете в морской бои и у вас осталось некоторое количество кораблей на поле 10Х10 (можно буквы и цифры, а можно только цифры). Вы должны создать свитч, который примет тюпл с координатой и выдаст один из вариантов: мимо, ранил, убил.
 */
print()
print("Lesson 9: Switch. Part 4")

var gameField = [String:String]()

var column = [String]()

let alfabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
let endColumn = "J"

for i in alfabet {
    column.append(String(i))
    if String(i) == endColumn {
        break
    }
}

let endLine = 10
for indexColumn in 0..<column.count {
    for indexLine in 1...endLine {
        gameField["\(column[indexColumn])\(String(indexLine))"] = "\u{2B1C}"
    }
}

print()
print("Empty field")
// print gameField empty

print(" ", terminator: "  ")
for indexColumn in 0..<column.count {
    print(indexColumn + 1, terminator: " ")
}

print()

for indexColumn in 0..<column.count {
    
    print(column[indexColumn], terminator: " ")
    
    for indexLine in 1...endLine {
        if indexLine == endLine {
        print(gameField["\(column[indexColumn])\(String(indexLine))"]!, terminator: "")
        print()
        } else {
        print(gameField["\(column[indexColumn])\(String(indexLine))"]!, terminator: "")
        }
    }
}

//create five ships
//ship #1 (B2, C2)
//ship #2 (B9, C9, D9, E9)
//ship #3 (E5)
//ship #4 (G2, H2, I2)
//ship #5 (I5, I6, I7)

var ship1 = ["B2", "C2"]
var ship2 = ["B9", "C9", "D9", "E9"]
var ship3 = ["E5"]
var ship4 = ["G2", "H2", "I2"]
var ship5 = ["I5", "I6", "I7"]

for value in ship1 {
    gameField[value] = "\u{2B1B}"
}

for value in ship2 {
    gameField[value] = "\u{2B1B}"
}

for value in ship3 {
    gameField[value] = "\u{2B1B}"
}

for value in ship4 {
    gameField[value] = "\u{2B1B}"
}

for value in ship5 {
    gameField[value] = "\u{2B1B}"
}

print()
print("Field with ships")
// print gameField with ships

print(" ", terminator: "  ")
for indexColumn in 0..<column.count {
    print(indexColumn + 1, terminator: " ")
}
print()

for indexColumn in 0..<column.count {
    
    print(column[indexColumn], terminator: " ")
    
    for indexLine in 1...endLine {
        if indexLine == endLine {
            print(gameField["\(column[indexColumn])\(String(indexLine))"]!, terminator: "")
            print()
        } else {
            print(gameField["\(column[indexColumn])\(String(indexLine))"]!, terminator: "")
        }
    }
}

// Получаем координаты выстрела

let pointShot = "E5"

print()
print("Coordinates of shot - \(pointShot)")
print()

switch gameField[pointShot] {
    case "\u{2B1B}":
//________________________________
        for i in 0..<ship1.count {
            if ship1[i] == pointShot {
                ship1.remove(at: i)
                break
            }
        }
        
        for i in 0..<ship2.count {
            if ship2[i] == pointShot {
                ship2.remove(at: i)
                break
            }
        }
        
        for i in 0..<ship3.count {
            if ship3[i] == pointShot {
                ship3.remove(at: i)
                break
            }
        }
        
        for i in 0..<ship4.count {
            if ship4[i] == pointShot {
                ship4.remove(at: i)
                break
            }
        }
        
        for i in 0..<ship5.count {
            if ship5[i] == pointShot {
                ship5.remove(at: i)
                break
            }
        }
        
        gameField[pointShot] = "\u{1F525}"
        print("Hit! :)")
        
        if ship1.isEmpty {
           print("Ship1 killed! :)")
        }
    
        if ship2.isEmpty {
            print("Ship2 killed! :)")
        }
    
        if ship3.isEmpty {
            print("Ship3 killed! :)")
        }
        
        if ship4.isEmpty {
            print("Ship4 killed! :)")
        }
    
        if ship5.isEmpty {
            print("Ship5 killed! :)")
        }
//________________________________
    case "\u{2B1C}":
        print("Mishit! :(")
    default: break
}


print()
print("Field after shot")
// print gameField after shot
print(" ", terminator: "  ")
for indexColumn in 0..<column.count {
    print(indexColumn + 1, terminator: " ")
}

print()

for indexColumn in 0..<column.count {
    
    print(column[indexColumn], terminator: " ")
    
    for indexLine in 1...endLine {
        if indexLine == endLine {
            print(gameField["\(column[indexColumn])\(String(indexLine))"]!, terminator: "")
            print()
        } else {
            print(gameField["\(column[indexColumn])\(String(indexLine))"]!, terminator: "")
        }
    }
}

/*
Swift - 09. Оператор swith / Control flow

var age = 21

if age == 21 {
    
} else if age == 22 {
    
} else {
    
}
 

mainLoop: for _ in 0...1000 {

for i in 0..<20 {
    
    if (i < 9) {
        continue //  прыгает в начало цикла
    }
    
    if i == 10 {
        break mainLoop // останавливает цикл принудительно под ярлыком mainLoop
    }
    print(i)
}
}

var age = 15
var name = "Alex"

switch age {
    case 0...16:
        print("школота"); fallthrough
    
    case 17...21:
        print("студент")
    
    //case 51:
    //case 52:
    //case 51, 56, 57, 60:
    
    case 22...50:
        break
    
    default: break  // всегда надо делать дефолд, если кейсы могут быть не использованы
}

switch name {
case "Alex" where age < 50:
    print("hi buddy!")
case "Alex" where age >= 50:
    print("I don't know you")
default:
    break
}

age = 59
var tuple = (name, age)


var optional: Int? = 5

if let a = optional {
    print("\(a) != nil")
}

tuple.1 = 67
switch tuple {
    
    case ("Alex", 60): print("hi Alex 60")
    case ("Alex", 59): print("hi Alex 59")
    
    case (_, let number) where number >= 65 && number <= 70:
    print("Hi oldman!")
    
    case ("Alex", _): print("hi Alex")
    
    default: break
}

let point = (5,-9)
switch point {
    case let (x,y) where x == y:
        print("x == y")
    case let (x,y) where x == -y:
        print("x == -y")
    case let (_,y) where y > 0:
        print("y < 0")
    case (_, let y) where y < 7:
        print("y < 7")
    default:
        break
}

let array: [CustomStringConvertible] = [5, 5.4, Float(5.4)] // [CustomStringConvertible] as a [Printable]

switch array[0] {
    case _ as Int: print("Int")
    case _ as Float: print("Float")
    case _ as Double: print("Double")
default:
    break
}

*/
