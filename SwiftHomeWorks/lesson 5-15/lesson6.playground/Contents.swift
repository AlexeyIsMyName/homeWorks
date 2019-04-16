/*
 1. Выполните задание о базовых операторах,
 только вместо forced unwrapping и optional binding используйте оператор ??
 
 Когда посчитаете сумму, то представьте свое выражение в виде строки
 Например: 5 + nil + 2 + 3 + nil = 10
 
 но в первом случае используйте интерполяцию строк, а во втором конкатенацию
 
 2. Поиграйтесь с юникодом и создайте строку из 5 самых классных по вашему мнению символов,
 можно использовать составные символы. Посчитайте длину строки методом SWIFT и Obj-C
 
 3. Создайте строку английский алфавит, все буквы малые от a до z
 задайте константу - один из символов этого алфавита
 Используя цикл for определите под каким индексов в строке находится этот символ
 */
import Foundation

//Homework part 1
let constant1 = "15"
let constant2 = "December, 10"
let constant3 = "September, "
let constant4 = "31"
let constant5 = "July, 6"

var day1 = Int(constant1) ?? 0
var day2 = Int(constant2) ?? 0
var day3 = Int(constant3) ?? 0
var day4 = Int(constant4) ?? 0
var day5 = Int(constant5) ?? 0
var dayZ = day1 + day2 + day3 + day4 + day5

let strDay1 = (Int(constant1) != nil) ? constant1 : "nil"
let strDay2 = (Int(constant2) != nil) ? constant2 : "nil"
let strDay3 = (Int(constant3) != nil) ? constant3 : "nil"
let strDay4 = (Int(constant4) != nil) ? constant4 : "nil"
let strDay5 = (Int(constant5) != nil) ? constant5 : "nil"
//Интерполяция строк
print("\(strDay1) + \(strDay2) + \(strDay3) + \(strDay4) + \(strDay5) = \(dayZ)")
//Конкатинация строк
print("\(strDay1)" + " + " + "\(strDay2)" + " + " + "\(strDay3)" + " + " + "\(strDay4)" + " + " + "\(strDay5)" + " = " + "\(dayZ)")

//Homework part 2
let strFun1 : Character = "\u{1f969}"
let strFun2 : Character = "\u{1f336}"
let strFun3 : Character = "\u{1f355}"
let strFun4 : Character = "\u{1f9c0}"
let strFun5 : Character = "\u{1f953}"

var funSpring = ""
funSpring.append(strFun1)
funSpring.append(strFun2)
funSpring.append(strFun3)
funSpring.append(strFun4)
funSpring.append(strFun5)

print(funSpring)

let swiftCount = funSpring.count
let objCCount = (funSpring as NSString).length

print("Swift count is \(swiftCount) and Obj-C count is \(objCCount)")

//Homework part 3
let alfabet = "abcdefghijklmnopqrstuvwxyz"
let letter : Character = "k"
var count = 1

for c in alfabet {
    if c == letter {
        print("Letter \(letter) is \(count)")
    }
    count += 1
}
