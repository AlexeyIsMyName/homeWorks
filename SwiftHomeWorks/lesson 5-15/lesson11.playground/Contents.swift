/* 1. Написать функцию, которая ничего не возвращает и принимает только один клоужер, который ничего не принимает и ничего не возвращает . Функция должна просто посчитать от 1 до 10 в цикле и после этого вызвать клоужер. Добавьте println в каждый виток цикла и в клоужер и проследите за очередностью выполнения команд. */
print("\nHomework 11. Part 1.")
func score(closure: () -> ()) {
    for value in 1...10 {
        print(value)
    }
    closure()
}
score{ print("value") }

/* 2. Используя метод массивов sorted, отсортируйте массив интов по возрастанию и убыванию. Пример показан в методичке. */
print("\nHomework 11. Part 2.")
let arraySort = [1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024]
print(arraySort.sorted{ $0 < $1 })
print(arraySort.sorted{ $0 > $1 })

/* 3. Напишите функцию, которая принимает массив интов и клоужер и возвращает инт. Клоужер должен принимать 2 инта (один опшинал) и возвращать да или нет. В самой функции создайте опшинал переменную. Вы должны пройтись в цикле по массиву интов и сравнивать элементы с переменной используя клоужер. Если клоужер возвращает да, то вы записываете значение массива в переменную. в конце функции возвращайте переменную. Используя этот метод и этот клоужер найдите максимальный и минимальный элементы массива. */
print("\nHomework 11. Part 3.")
func run(array: [Int], closur3: (Int, Int?) -> Bool) -> Int {
    var opt: Int?
    for value in array {
        if opt == nil || closur3(value, opt) {
            opt = value
        }
    }
    return opt ?? 0
}

let arrayOfInt = [1, 3, 9, 27, 81, 243, 729, 2187]
print("Min = \(run(array: arrayOfInt, closur3: { $1 == nil ? true : $0 < $1! }))")
print("Max = \(run(array: arrayOfInt, closur3: { $1 == nil ? true : $0 > $1! }))")

 /* 4. Создайте произвольную строку. Преобразуйте ее в массив букв. Используя метод массивов sorted отсортируйте строку так, чтобы вначале шли гласные в алфавитном порядке, потом согласные, потом цифры, а потом символы */
print("\nHomework 11. Part 4.")
func priority(string: String) -> Int {
    switch(string.lowercased()) {
    case "a", "e", "i", "o", "u", "y": return 0
    case "a"..."z": return 1
    case "0"..."9": return 2
    default: return 3
    }
}

func convertStringToArray(str: String) -> [String] {
    var array = [String]()
    for value in str {
        array.append(String(value))
    }
    return array
}

let str = "My name is Aleksey. I am 29"
let newArrayFromStr = convertStringToArray(str: str)

let sortedArray = newArrayFromStr.sorted {
    switch(priority(string: $0),priority(string: $1)) {
    case let (x,y) where x < y: return true
    case let (x,y) where x > y: return false
    default: return $0.lowercased() <= $1.lowercased()
    }
}

print("Sentence - \(str)")
print("Sorted arrey from sentence - \(sortedArray)")

 /* 5. Проделайте задание №3 но для нахождения минимальной и максимальной буквы из массива букв (соответственно скалярному значению) */
print("\nHomework 11. Part 5.")

func strToArrayOfChar(str: String) -> [Character] {
    var array = [Character]()
    for value in str {
        array.append(value)
    }
    return array
}

func run2(array: [Character], closur5: (Character, Character?) -> Bool) -> Character {
    var opt: Character?
    for value in array {
        if opt == nil || closur5(value, opt) {
            opt = value
        }
    }
    return opt ?? "🚨"
}

let massOfChar = strToArrayOfChar(str: "±!1KhJsakgvhSjkvigshVgaOsuYg)$pz")
print("Min = \(run2(array: massOfChar, closur5: { $1 == nil ? true : $0 > $1! }))")
print("Max = \(run2(array: massOfChar, closur5: { $1 == nil ? true : $0 < $1! }))")

/*
 11. Клоужерсы о_О - Closures 13:00
 - это кусок вашего кода, который Вы передаете в разные функции
 
func filterArray(array: [Int], f: (Int) -> Bool) -> [Int]{
    var filtered = [Int]()
    for i in array {
        if f(i) {
            filtered.append(i)
        }
    }
    return filtered
}

/*
func compare(i: Int) -> Bool {
    return i % 2 == 0
}
*/

let numbers = [4, 3, 12, 7, 6, 3, 56, 7, 8, 9, 10, 4, 3, 1, 8, 11]

filterArray(array: numbers, f: {(i: Int) -> Bool in
    return i % 2 == 0
})

filterArray(array: numbers, f: {(i: Int) -> Bool in
    return i % 2 == 1
})

filterArray(array: numbers, f: {(i: Int) -> Bool in
    return i % 3 == 0
})

filterArray(array: numbers, f: {(i: Int) -> Bool in
    return i < 10
})


// ------
// MARK: [simple form]
// FIXME: [aaa]
// TODO: [fix it :)]

filterArray(array: numbers, f: {i in
    return i % 2 == 0
})

let a =
filterArray(array: numbers, f: {i in i % 2 == 0})

let a1 =
filterArray(array: numbers, f: {$0 % 2 == 0})

let a3 =
filterArray(array: numbers) {$0 % 2 == 0}


var count = 0
let array = [1, 2, 3, 5, 7, 123]

let a4 =
filterArray(array: numbers) {value in
    for include in array {
        count += 1
        if include == value {
            return true
        }
    }
    return false
}

count

count = 0

var dict = [Int: Bool]()
for value in array {
    count += 1
    dict[value] = true

}

let a5 =
    filterArray(array: numbers) {value in
        count += 1
        return dict[value] != nil
}

count


*/
