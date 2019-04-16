/*
 SWIFT Марафон. Урок 7: Массивы. Задание 1 из 3
 Cоздать массив "дни в месяцах" 12 элементов содержащих количество дней в соответствующем месяце
 
 используя цикл for и этот массив
 
 - выведите количество дней в каждом месяце (без имен месяцев)
 - используйте еще один массив с именами месяцев чтобы вывести название месяца + количество дней
 - сделайте тоже самое, но используя массив тюплов с параметрами (имя месяца, кол-во дней)
 - сделайте тоже самое, только выводите дни в обратном порядке (порядок в массиве не меняется)
 
 - для произвольно выбранной даты (месяц и день) посчитайте количество дней до этой даты от начала года
*/

// homework part #1
let  constMounthDays = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
let  constMounthName = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]

for i in 0..<constMounthDays.count {
    print("Days -> \(constMounthDays[i])")
}

print("")

for i in 0..<constMounthDays.count {
    print("Mounth -> \(constMounthName[i]), Days -> \(constMounthDays[i])")
}

print("")
print("Array Tuples")

var constMounthDays2: [(Name: String, Days: Int)] = [("Jan", 31), ("Feb", 28), ("Mar", 31), ("Apr", 30), ("May", 31), ("Jun", 30), ("Jul", 31), ("Aug", 31), ("Sep", 30), ("Oct", 31), ("Nov", 30), ("Dec", 31)]

for i in 0..<constMounthDays2.count {
    print("Mounth -> \(constMounthDays2[i].Name), Days -> \(constMounthDays2[i].Days)")
}

print("")
print("Array Tuples from last to first")

var index = constMounthDays2.count - 1
for _ in 0..<constMounthDays2.count {
    print("Mounth -> \(constMounthDays2[index].Name), Days -> \(constMounthDays2[index].Days)")
    index -= 1
}

print("")
let myBirthday: (Name: String, Days: Int) = ("Jul", 6)
var sumDays = myBirthday.Days

for i in 0..<constMounthDays2.count {
    if myBirthday.Name != constMounthDays2[i].Name {
    sumDays += constMounthDays2[i].Days
    } else {
        print("Days from New Year to my Birthday is \(sumDays)")
        break
    }
}

/*
2. Сделайте первое задание к уроку номер 4 используя массивы:
(создайте массив опшинал интов и посчитайте сумму)
- в одном случае используйте optional binding
- в другом forced unwrapping
- а в третьем оператор ??
*/

let constant1 = "15"
let constant2 = "December, 10"
let constant3 = "September, "
let constant4 = "31"
let constant5 = "July, 6"

var array = [Int?](repeating: 0, count: 5)
var arrayStr = [constant1, constant2, constant3, constant4, constant5]

// optional binding

var sum = 0

for i in 0..<array.count {
    if let a = Int(arrayStr[i]) {
        array[i] = a
    }
}

for i in 0..<array.count {
    if let a = array[i] {
        sum += a
    }
}

print("")
print("optional binding / sum = \(sum)")

// forced unwrapping
sum = 0
for value in array {
    if value != nil {
        sum += value!
    }
}

print("")
print("forced unwrapping / sum = \(sum)")


// ??
for i in 0..<array.count {
    array[i] = Int(arrayStr[i]) ?? 0
}

sum = 0
for i in 0..<array.count {
    if array[i] != nil {
        sum += array[i]!
    }
}

print("")
print("?? / sum = \(sum)")

/*
3. создайте строку алфавит и пустой массив строк
 в цикле пройдитесь по всем символам строки попорядку, преобразовывайте
 каждый в строку и добавляйте в массив, причем так, чтобы на выходе
 получился массив с алфавитом задом-наперед
*/

let alfabet = "ABCDEFGHIJKLMNOPQRSTUWXYZ"
var alfabetArrow = [String]()

for c in alfabet {
    alfabetArrow.insert(String(c), at: 0)
}

print("")
print("Alfabet Arrow")
print(alfabetArrow)

/*
let  constArray = ["a", "b", "c", "d"]

constArray.count

var array = [String]()

if array.count == 0 {
    print("array is empty")
}

if array.isEmpty {
    print("array is empty")
}

array += constArray

array += ["e"]

array.append("f")

var array2 = array

array
array2

array2[0] = "1" //изъятие данных с индексом 0

array
array2

array[1...4] //изъятие данных с индексом от 1 до 4

array
array[1...4] = ["0"] //Если диапазон запрашиваемы индексов больше длинны масива приложение крашнется
array

array.insert("-", at: 2) //вставка данных в массиве под индексом 2

array.remove(at: 2) //Удаление данных в ячейке под индеком2

array

let test = [Int](repeating: 100, count: 5)

let money = [100, 1, 5, 20, 1, 50, 1, 1, 20, 1]

var sum = 0
for i in 0...8 {
    sum += money[i]
}
sum

sum = 0

money.count

for i in 0..<money.count {
    sum += money[i]
    print("Index = \(i) value = \(money[i]) sum = \(sum)")
}
sum = 0

for i in money {
    sum += i
}
sum

sum = 0
// чтобы НЕ знать индекс
var index = 0
for value in money {
    print("Index = \(index) value = \(value)")
    sum += value
    index += 1
}
sum

sum = 0
// чтобы знать индекс
for (index, value) in money.enumerated() {
    print("Index = \(index) value = \(value)")
    sum += value
}
sum
*/
