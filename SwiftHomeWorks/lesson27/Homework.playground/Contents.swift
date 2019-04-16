 import Foundation
 
 // 1. Объявить протокол Food, который будет иметь проперти name (только чтение) и метод taste(), который будет выводить текст со вкусовыми ощущениями
 
 protocol Food {
    var name: String { get }
    func taste ()
 }
 
 
 // 2. Создайте новый протокол Storable, он наследуется от протокола Food и содержит еще булевую проперти - expired.
 
 protocol Storable {
    var expired: Bool { get }
    var daysToExpire: Int { get }
 }
 
 
 // 3. Все продукты разных типов, которые вы принесли из супермаркета, находятся в сумке (массив) и все, как ни странно, реализуют протокол Food. Вам нужно пройтись по сумке, назвать предмет и откусить кусочек. Можете отсортировать продукты до имени. Используйте для этого отдельную функцию, которая принимает массив продуктов
 
 class Potato: Food {
    var name: String = "Potato"
    
    func taste() {
        print("It tastes good")
    }
    
    
 }
 
 class Carrot: Food {
    var name: String = "Carrot"
    
    func taste() {
        print("It tastes good")
    }
    
    
 }
 
 class Apple: Food {
    var name: String = "Apple"
    
    func taste() {
        print("It so Yummy")
    }
    
    
 }
 
 class Lemon: Food {
    var name: String = "Lemon"
    
    func taste() {
        print("It tastes sour")
    }
    
    
 }
 
 class Beef: Food, Storable {
    var daysToExpire: Int = 35
    
    var expired: Bool = false
    
    var name: String = "Beef"
    
    func taste() {
        print("It tastes great")
    }
    
    
 }
 
 class Pork: Food, Storable {
    var daysToExpire: Int = 25
    
    var expired: Bool = false
    
    var name: String = "Pork"
    
    func taste() {
        print("It is ok, but I have had better")
    }
    
    
 }
 
 class Chicken: Food, Storable {
    var daysToExpire: Int = 14
    
    var expired: Bool = false
    
    var name: String = "Chicken"
    
    func taste() {
        print("That is delicious!")
    }
    
    
 }
 
 class Fish: Food, Storable {
    var daysToExpire: Int = 0
    
    var expired: Bool = true
    
    var name: String = "Fish"
    
    func taste() {
        print("Ew, I don't like that")
    }
    
    
 }
 
 
 let potato = Potato()
 let carrot = Carrot()
 let apple = Apple()
 let lemon = Lemon()
 let beef = Beef()
 let pork = Pork()
 let chicken = Chicken()
 let fish = Fish()
 
 var pork2 = Pork()
 pork2.name = "Pork2"
 pork2.daysToExpire = 35
 
 func sortFood (array: inout [Food]) {
    array.sort(by: {a, b in
        if a.name == b.name {
            return a.name.lowercased() < b.name.lowercased()
        } else {
            return a.name < b.name
        }
    })
 }
 
 
 func printFood (array: [Food]) {
    for value in array {
        print("\n\(value.name)")
        value.taste()
    }
 }
 
 func printFood (array: [Storable]) {
    for value in array {
        if let tempValue = value as? Food {
            print("\n\(tempValue.name)")
            tempValue.taste()
        }
    }
 }
 
 
 var bagWithFood: [Food] = [potato, carrot, apple, lemon, beef, pork, pork2, chicken, fish]
 
 
 sortFood(array: &bagWithFood)
 printFood(array: bagWithFood)

 
 
 // 4. Некоторые продукты могут испортиться, если их не положить в холодильник.  У некоторых продуктов замените Food на Storable. Теперь пройдитесь по всем продуктам и, если продукт надо хранить в холодильнике, то перенесите его туда, но только если продукт не испорчен уже, иначе просто избавьтесь от него. Используйте функцию для вывода продуктов для вывода содержимого холодильника
 
 
 var refrigeratorWithFood = [Storable]()

 
 for i in 0...bagWithFood.count {
    if i >= bagWithFood.count { break } // defender - out of range
    
    if let food = bagWithFood[i] as? Storable & Food {
        if food.expired {
            print("\nfooooooo \(food.name) smells terrible, in the trash!")
            bagWithFood.remove(at: i)
        } else {
            refrigeratorWithFood.append(food)
        }
    }
 }
 
 
 printFood(array: refrigeratorWithFood)
 
 
 // 5. Добавьте проперти daysToExpire в протокол Storable. Отсортируйте массив продуктов в холодильнике. Сначала пусть идут те, кто быстрее портятся. Если срок совпадает, то сортируйте по имени.
 
 func sortFoodByExpire (array: inout [Storable]) {
    
    // Version #1
    print("\nok")
    
    var tempArray = [Food & Storable]()
    
    for value in array {
        if value is Food & Storable {
            tempArray.append(value as! Food & Storable)
        }
    }
    
    tempArray.sort(by: {a, b in
        if a.daysToExpire == b.daysToExpire {
            return a.name.lowercased() < b.name.lowercased()
        } else {
            return a.daysToExpire < b.daysToExpire
        }
    })
    
    for value in tempArray {
        print("\(value.name) - days to expire = \(value.daysToExpire)")
    }
    
    /*
    Version #2
    
    if var tempArray = array as? [Food & Storable] {
        print("\nok")
        tempArray.sort(by: {a, b in
            if a.daysToExpire == b.daysToExpire {
                return a.name.lowercased() < b.name.lowercased()
            } else {
                return a.daysToExpire < b.daysToExpire
            }
        })
        
        for value in tempArray {
            print("\(value.name) - days to expire = \(value.daysToExpire)")
        }
    }
    */
 }

 
 sortFoodByExpire(array: &refrigeratorWithFood)
 
 
 // 5. Не все, что мы кладем в холодильник, является едой. Поэтому сделайте так, чтобы Storable не наследовался от Food. Мы по прежнему приносим еду домой, но некоторые продукты реализуют теперь 2 протокола. Холодильник принимает только те продукты, которые еще и Storable. функция сортировки должна по прежнему работать.

 
