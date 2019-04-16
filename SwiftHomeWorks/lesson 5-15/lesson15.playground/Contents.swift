/*
 1. Создать структуру “Описание файла” содержащую свойства:
 - путь к файлу
 - имя файла
 - максимальный размер файла на диске
 - путь к папке, содержащей этот файл
 - тип файла (скрытый или нет)
 - содержимое файла (можно просто симулировать контент)
 
 Главная задача - это использовать правильные свойства там, где нужно, чтобы не пришлось хранить одни и те же данные в разных местах и т.д. и т.п.
 */

let sizeOneCharacter = 64 // There is 64 bit system
let defaultFolder = "C:/Users/Documents/" // There is default folder whith document's

struct TextFile {
    var path: String {
        return defaultFolder + ("\(name).txt ")
    }
    var name: String
    static let maxSize = 4096
    var folder: String {
        return defaultFolder
    }
    enum `Type` {
        case hidden
        case `public`
    }
    var type: Type
    var content: String {
        didSet {
            if content.count * sizeOneCharacter > TextFile.maxSize {
                print("Error - Content overload!")
                content = oldValue
            } else {
                print("Data updated")
            }
        }
    }
}

var text = TextFile(name: "Kursovaya", type: .public, content: "")

text.content
text.content = "London is a capital of Great Britain!"

text.content
text.path
text.folder
text.type

text.content = "lkjhasifuhsadiufas ufdasdf asdfh lasdfhlasdjhf lasjdhf lahjsdgf asdhgf kasfgh kasdjhfg sakdhfg"
text.content

/*
 2. Создайте энум, который будет представлять некую цветовую гамму. Этот энум должен быть типа Int и как raw значение должен иметь соответствующее 3 байтное представление цвета. Добавьте в этот энум 3 свойства типа: количество цветов в гамме, начальный цвет и конечный цвет.
*/

enum Gamma: Int {
    case red = 0xFF0000
    case orange = 0xff8800
    case yellow = 0xffff00
    case green = 0x00fa00
    case blue = 0x00b0fa
    case indigo = 0x0d00fa
    case violet = 0xa600b5

    static let countOfColors = 7
    static let firstColor = Gamma.red
    static let lastColor = Gamma.violet
}
 
 /*
 3. Создайте класс человек, который будет содержать имя, фамилию, возраст, рост и вес. Добавьте несколько свойств непосредственно этому классу чтобы контролировать:
 - минимальный и максимальный возраст каждого объекта
 - минимальную и максимальную длину имени и фамилии
 - минимально возможный рост и вес
 - самое интересное, создайте свойство, которое будет содержать количество созданных объектов этого класса
*/

let errorMassage = "a data-entry error"

class Human {
    static let minMaxAge = 18...80
    static let minMaxLenghtNameSurname = 2...10
    static let minMaxHeight = 150...210
    static let minMaxWeight = 45...120
    static var totalHumans = 0
    
    var name: String {
        didSet {
            if !(Human.minMaxLenghtNameSurname ~= name.count) {
                name = oldValue
                print(errorMassage)
            }
        }
    }
    
    var surname: String {
        didSet {
            if !(Human.minMaxLenghtNameSurname ~= surname.count) {
                surname = oldValue
                print(errorMassage)
            }
        }
    }
    
    var age: Int {
        didSet {
            if !(Human.minMaxAge ~= age) {
                age = oldValue
                print(errorMassage)
            }
        }
    }
    
    var height: Int {
        didSet {
            if !(Human.minMaxHeight ~= height) {
                height = oldValue
                print(errorMassage)
            }
        }
    }
    
    var weight: Int {
        didSet {
            if !(Human.minMaxWeight ~= weight) {
                weight = oldValue
                print(errorMassage)
            }
        }
    }
    
    init(name: String, surname: String, age: Int, height: Int, weight: Int) {
        self.name = Human.minMaxLenghtNameSurname ~= name.count ? name : errorMassage
        self.surname = Human.minMaxLenghtNameSurname ~= surname.count ? surname : errorMassage
        self.age = Human.minMaxAge ~= age ? age : Human.minMaxAge.first ?? 10
        self.height = Human.minMaxHeight ~= age ? age : Human.minMaxHeight.first ?? 220
        self.weight = Human.minMaxWeight ~= age ? age : Human.minMaxWeight.first ?? 120
        Human.totalHumans += 1
    }
}

Human.totalHumans

func PrintHuman(human: Human) {
    print("\(human.name) \(human.surname), age - \(human.age), height - \(human.height), weight - \(human.weight)")
}

var gleb = Human(name: "Gleb", surname: "Sorokin", age: 30, height: 195, weight: 80)

PrintHuman(human: gleb)
gleb.age = 100
Human.totalHumans
PrintHuman(human: gleb)

var borya = Human(name: "Boris", surname: "Golovin", age: 15, height: 145, weight: 39)

PrintHuman(human: borya)
borya.name = "Asdfghj"
borya.surname = "Aqwertyu"
borya.age = 75
borya.height = 210
borya.weight = 100
Human.totalHumans
PrintHuman(human: borya)

/*
let MaxNameLenght = 20

class Human {
    
    var name: String {
        didSet {
            if name.count > MaxNameLenght {
                name = oldValue
            }
        }
    }
    
    lazy var storyOfMyLife = "This is story of my entire life..."
    
    class var maxAge: Int {
        return 100
    }
    
    var age: Int {
        didSet {
            if age > Human.maxAge {
                age = oldValue
            }
        }
    }
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
}

enum Direction {
    
    static let enumDescription = "Directions in the game"
    
    case Left
    case Right
    case Top
    case Bottom
    
    var isVertical: Bool {
        return self == .Top || self == .Bottom
    }
    
    var isHorizontal: Bool {
        return !isVertical
    }
}

Direction.enumDescription

let d = Direction.Right
d.isHorizontal


let guman = Human(name: "Peter", age: 40)

guman.storyOfMyLife
guman

guman.name

struct Cat {
    
    var name: String {
        didSet {
            if name.count > MaxNameLenght {
                name = oldValue
            }
        }
    }
    
    static let maxAge = 20
    
    static var totalcats = 0
    
    var age: Int {
        didSet {
            if age > Cat.maxAge {
                age = oldValue
            }
        }
    }
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
        
        Cat.totalcats += 1
    }
}

var cat = Cat(name: "Whiten", age: 10)

guman.age = 1000
cat.age = 50

Cat.totalcats

let cat1 = Cat(name: "Whiten1", age: 10)
let cat2 = Cat(name: "Whiten2", age: 10)

Cat.totalcats

cat.name = "ahsgcyascy acsasuiocya sociua ocuya"

*/
