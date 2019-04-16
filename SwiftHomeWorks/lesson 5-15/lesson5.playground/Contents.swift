/*Swift - 05, Базовые операторы
1. Посчитать кол-во секунд от начала года до своего дня рождения
2. Посчитать в каком квартале родился и вывести на экран
3. На шахматной доске 8х8 вывести формулу, которая при запросе
   возвращала цвет клетки
 */

// значение = значение + (дни х часы х минуты х секунды)
// сразу узнаю количество секунд в первом квартале и во втором
var amountOfSeconds = 0
let secInDay = 24 * 60 * 60
let quarter1 = (31 * secInDay) + (28 * secInDay) + (31 * secInDay)
let quarter2 = quarter1 + (30 * secInDay) + (31 * secInDay) + (30 * secInDay)
let quarter3 = quarter2 + (31 * secInDay) + (31 * secInDay) + (30 * secInDay)

amountOfSeconds = amountOfSeconds + (31 * secInDay)
amountOfSeconds = amountOfSeconds + (28 * secInDay)
amountOfSeconds = amountOfSeconds + (31 * secInDay)

amountOfSeconds = amountOfSeconds + (30 * secInDay)
amountOfSeconds = amountOfSeconds + (31 * secInDay)
amountOfSeconds = amountOfSeconds + (30 * secInDay)

amountOfSeconds = amountOfSeconds + (5 * secInDay) + 1

print("Amount of Seconds from begin year to my Birthday - ", amountOfSeconds)

let myMonth = 7
let monthsInQuarter = 3
let myQuarter = myMonth / monthsInQuarter + (myMonth % monthsInQuarter > 0 ? 1 : 0)
print("I was born in the", myQuarter, " quater")


if amountOfSeconds >= 0 &&  amountOfSeconds < quarter1 {
    print("I was born in the first quater")
}

if amountOfSeconds >= quarter1 &&  amountOfSeconds < quarter2 {
    print("I was born in the second quater")
}

if amountOfSeconds >= quarter2 &&  amountOfSeconds < quarter3 {
    print("I was born in the third quater")
}


// задача с шахматной доской 8х8, создаем начальные данные X = 1, Y = 1

var dot = (x: 2, y: 2)

// создаю цикл из 4 повторений, чтобы проверить работу программы с разными значениями Х и Y
for i in 1...4 {
   if dot.x % 2 == dot.y % 2 {
       print("X =", dot.x, "Y =", dot.y, "Cell black")
   } else {
       print("X =", dot.x, "Y =", dot.y, "White cell")
   }
dot.x = dot.x + i
dot.y = dot.y + 1
}
