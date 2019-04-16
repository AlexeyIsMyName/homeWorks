//  Сегодня будем строить свою небольшую социальную сеть.
//  1. Сделать класс Человек, у этого класса будут проперти Папа, Мама, Братья, Сестры (всё опционально).
//  Сделать примерно 30 человек, взять одного из них, поставить ему Папу/Маму. Папе и Маме поставить Пап/Мам/Братьев/Сестер. Получится большое дерево иерархии.
//  Посчитать, сколько у этого человека двоюродных Братьев, троюродных Сестёр, Теть, Дядь, итд

class Human {
    var father: Man?
    var mother: Woman?
    var brother: [Man]?
    var sister: [Woman]?
    var pet: [Pet]?
}

class Man: Human {
    func moveSofa() {
        print("move Sofa")
    }
}

class Woman: Human {
    func cookBorsch() {
        print("cook borsch")
    }
}

class Pet {
    var name: String {
        return ""
    }
    
    func giveVoice() {
        print("")
    }
}

class Dog: Pet {
    override var name: String {
        return super.name + "dog"
    }
    
    override func giveVoice() {
        print("\(self.name) GavGavGav!!!")
    }
}

class Cat: Pet {
    override var name: String {
        return super.name + "cat"
    }
    
    override func giveVoice() {
        print("\(self.name) MayMayMay!!!")
    }
}

class Fish: Pet {
    override var name: String {
        return super.name + "fish"
    }
    override func giveVoice() {
        print("\(self.name) .......!!!")
    }
}

class Carrot: Pet {
    override var name: String {
        return super.name + "carrot"
    }
    override func giveVoice() {
        print("\(self.name) VovkaDurak!!!")
    }
}


var family = [Human]()

for i in 1...20 {
    if (i % 2) == 0 {
        family.append(Man())
    } else {
        family.append(Woman())
    }
}

//for index in 1...family.count {
//    let i = index - 1
//    if family[i] is Man {
//        print("Number \(i) is Man")
//    } else if family[i] is Woman {
//        print("Number \(i) is Woman")
//    }
//}

family[19].mother = family[0] as? Woman
family[19].father = family[1] as? Man

family[19].brother = [family[3], family[5], family[7]] as? [Man]
family[19].sister = [family[2], family[4], family[6], family[16]] as? [Woman]

family[19].mother?.mother = family[8] as? Woman
family[19].mother?.father = family[9] as? Man

family[19].father?.mother = family[18] as? Woman

family[19].mother?.brother = [family[11], family[13], family[15], family[17]] as? [Man]
family[19].mother?.sister = [family[10], family[12], family[14]] as? [Woman]

var mother = family[19].mother != nil ? "Mother" : ""
var father = family[19].father != nil ? "Father" : ""

var grandMother = 0
var grandFather = 0
grandMother += family[19].mother?.mother != nil ? 1 : 0
grandMother += family[19].father?.mother != nil ? 1 : 0

grandFather += family[19].mother?.father != nil ? 1 : 0
grandFather += family[19].father?.father != nil ? 1 : 0

var brotherCount = 0
brotherCount += family[19].brother?.count ?? 0

var sisterCount = 0
sisterCount += family[19].sister?.count ?? 0

var auntsCount = 0
auntsCount += family[19].mother?.sister?.count ?? 0

var unclesCount = 0
unclesCount += family[19].mother?.brother?.count ?? 0

print("""
    My family, I have:
    \(mother) \(father)
    \(grandMother) - Grandmothers
    \(grandFather) - Grandfathers
    \(brotherCount) - Brothers
    \(sisterCount) - Sisters
    \(auntsCount) - Aunts
    \(unclesCount) - Uncles
    """)

//2. Все сестры, матери,... должны быть класса Женщина, Папы, братья,... класса Мужчины.
//У Мужчин сделать метод Двигать_диван, у Женщин Дать_указание (двигать_диван). Всё должно работать как и ранее.
//Всех этих людей положить в массив Семья, пройти по массиву посчитать количество Мужчин и Женщин, для каждого Мужчины вызвать метод Двигать_диван, для каждой женщины Дать_указание.

var manCount = 0
var womanCount = 0

for value in family {
    if let v = value as? Man {
        manCount += 1
        v.moveSofa()
    } else if let v = value as? Woman {
        womanCount += 1
        v.cookBorsch()
    }
}

print("manCount - \(manCount), womanCount - \(womanCount)")

// 3. Расширить класс человек, у него будет проперти Домашние_животные. Животные могут быть разные (попугаи, кошки, собаки...) их может быть несколько, может и не быть вообще.
// Раздать некоторым людям домашних животных. Пройти по всему массиву людей. Проверить каждого человека на наличие питомца, если такой есть - добавлять всех животных в массив животных. Посчитать сколько каких животных в этом массиве.
// Вся эта живность должна быть унаследована от класса Животные. У всех животных должен быть метод Издать_звук(крик) и у каждого дочернего класса этот метод переопределён на свой, т.е. каждое животное издаёт свой звук.
// Когда проходим по массиву животных, каждый представитель вида животных должен издать свой звук.
// Обязательно используем в заданиях Optional chaining и Type casting

family[0].pet = [Dog(), Cat()]
family[1].pet = [Carrot(), Fish()]
family[2].pet = [Dog()]
family[3].pet = [Cat()]
family[4].pet = [Carrot(), Cat()]
family[5].pet = [Fish()]
family[10].pet = [Dog(), Cat(), Fish()]
family[13].pet = [Dog()]
family[15].pet = [Cat(), Cat(), Cat(), Cat()]
family[16].pet = [Dog(), Dog(), Cat()]
family[18].pet = [Fish()]

var pets = [Pet]()

for value in family {
    if let petsValue = value.pet {
        for pet in petsValue {
            pets.append(pet)
        }
    }
}

pets.count
var dog = 0
var cat = 0
var fish = 0
var carrot = 0

for value in pets {
    value.giveVoice()
    switch value {
    case is Cat:
        cat += 1
    case is Dog:
        dog += 1
    case is Fish:
        fish += 1
    case is Carrot:
        carrot += 1
    default:
        break
    }
}

print("""
    My family, we have:
    \(dog) - Dogs
    \(cat) - Cats
    \(fish) - Fishes
    \(carrot) - Carrots
    """)
