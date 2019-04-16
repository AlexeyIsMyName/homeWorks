/*
 SWIFT Марафон. Урок 8: Дикшинари
 1.
 Создайте дикшинари как журнал студентов, где имя и фамилия студента это ключ,
 а оценка за контрольную значение. Некоторым студентам повысьте оценки - они пересдали.
 Потом добавьте парочку студентов, так как их только что перевели к вам в группу.
 А потом несколько удалите, так как они от вас ушли :(
 
 После всех этих перетрубаций посчитайте общий бал группы и средний бал
 
*/
print("Homework. Task 8. Part 1")
var vocabulary: [String:Int] = ["Aleksey Suslov": 5, "Pavel Durov": 4, "Tim Cook": 2]

vocabulary["Pavel Durov"] = 5
vocabulary["Anton Verenenko"] = 4
vocabulary["Gleb Starcev"] = 3
vocabulary.removeValue(forKey: "Tim Cook")

var sum = 0
for (_, value) in vocabulary {
    sum += value
}

let averagesum = Double(sum) / Double(vocabulary.count)
print("Group total score is \(sum) and Averege score is \(averagesum)")
print("")

/*
 2.
 Создать дикшинари дни в месяцах, где месяц это ключ, а количество дней - значение.
 В цикле выведите ключ-значение попарно, причем один раз выведите через тюплы,
 а другой раз пройдитесь по массиву ключей и для каждого из них доставайте значения.
*/

print("Homework. Task 8. Part 2")
var calendar: [String:Int] = ["Jan": 31, "Feb": 28, "Mar": 31, "Apr": 30, "May": 31, "Jun": 30, "Jul": 31, "Aug": 31, "Sep": 30, "Oct": 31, "Nov": 30, "Dec": 31]

for (keys, value) in calendar {
    print("Month is \(keys), Days in this month is \(value)")
}

print("")

for key in calendar.keys {
    if calendar[key] != nil {
       print("Month is \(key), Days in this month is \(calendar[key]!)")
    }
}
print("")

/*
 3.
 Создать дикшинари , в которой ключ это адрес шахматной клетки (пример: a5, b3, g8),
 а значение это Bool. Если у клетки белый цвет, то значение true, а если черный - false.
 Выведите дикшинари в печать и убедитесь что все правильно.
 
 Рекомендация: постарайтесь все сделать используя вложенный цикл (объяснение в уроке).
*/

print("Homework. Task 8. Part 3")
var chess = [String:Bool]()

var column = [String]()

let alfabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
let endColumn = "H"

for i in alfabet {
    column.append(String(i))
    if String(i) == endColumn {
        break
    }
}

for indexColumn in 0..<column.count {
    for indexLine in 1...8 {
        chess["\(column[indexColumn])\(String(indexLine))"] = indexColumn % 2 == indexLine % 2
    }
}

print("Проверка работы алгоритма")
print(chess)

/* Дикшинари - Dictionaries
Это имеет ключ и значение, все элементы располагаются по ключам, ключ уникальный, ключи все разные.
Обеспечивает быстрый доступ к данным по ключам

протокол кешибл
 
let dict: [String:String] = ["машина" : "car", "мужик" : "man"]
let dict2: [Int:String] = [0 : "car", 1 : "man"]
let dict3: Dictionary<String, Double> = ["a" : 2.0]

dict["мужик"]
dict["машина"]
dict2[0]
dict2[1]
dict3["a"]
 
дикшинари никогда не сохраняет ключи и значения в том  порядке в котором мы положили их туда!

var dict = ["машина" : "car", "мужик" : "man"]

dict["мужик"]

dict.count
dict.isEmpty

var dict3 = [String:String]()

dict3.count
dict3.isEmpty

dict["комп"] = "computer"
dict

dict.keys.description
dict.values.description

//dict["комп"] = "mac"
dict.updateValue("mac", forKey: "комп")
dict

let comp: String? = dict["комп"]

if let comp = dict["комп2"] {
    print("\(comp)")
} else {
    print("no value for key комп2")
}

dict["мужик"] = nil
dict

dict.removeValue(forKey: "hjgkhgfhgf")
dict.removeValue(forKey: "мужик")

dict = [:]
dict.isEmpty

dict["hello"] = "World"
dict

for key in dict.keys {
    print("Key = \(key), value = \(dict[key]!)")
}

for (key, value) in dict {
    print("Key = \(key), value = \(value)")
}
*/
