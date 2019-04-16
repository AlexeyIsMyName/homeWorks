import Foundation

struct Student {
    struct Date {
        var day: Int
        var mounth: Int
        var year: Int
    }
    
    var firstName: String {
        willSet(newFirstName) {
            print("will set " + newFirstName + " instead of " + firstName)
        }
        didSet(oldFirstName) {
            print("did set " + firstName + " instead of " + oldFirstName)
            firstName = firstName.capitalized
        }
    }
    
    var lastName: String {
        didSet(oldFirstName) {
            lastName = lastName.capitalized
        }
    }
    
    var fullName: String {
        get {
            return firstName + " " + lastName
        }
        set {
            print("fullName wants to be set to " + newValue)
            let words = newValue.components(separatedBy: " ")
            if words.count > 0 {
                firstName = words[0]
            }
            if words.count > 1 {
                lastName = words[1]
            }
        }
    }
    
    var birthday: Date
    
    var age: Int {
        get {
            let today = (day: 10, month: 2, year: 2019)
            let correct = today.month == birthday.mounth && today.day >= birthday.day ? 1 : 0
            return ((today.year - birthday.year - 2) * 12 + 12 - birthday.mounth + today.month) / 12 + correct
        }
    }
    
    var sum: Int {
        get {
            if age <= 6 {
                return 0
            } else {
                return age <= 18 ? age - 6 : 12
            }
        }
    }
}

var student = Student(firstName: "Kirill", lastName: "Fedorov", birthday: Student.Date(day: 23, mounth: 02, year: 1986))

student.firstName
student.lastName
student.fullName

student.birthday.day
student.birthday.mounth
student.birthday.year
student.age
student.sum

struct Line {
    struct Point {
        var x: Double
        var y: Double
    }
    var pointA: Point
    var pointB: Point
    var middleOfLine: Point {
        get {
            return Point(x: (pointA.x + pointB.x) / 2, y: (pointA.y + pointB.y) / 2)
        }
        set {
            let differenceX = newValue.x - middleOfLine.x
            let differenceY = newValue.y - middleOfLine.y
            pointA.x += differenceX
            pointA.y += differenceY
            pointB.x += differenceX
            pointB.y += differenceY
        }
    }
    
    var lenght: Double {
        get {
            return sqrt(pow((pointB.x - pointA.x), 2) + pow((pointB.y - pointA.y), 2))
        }
        set {
            pointB = Point(x: pointA.x + (pointB.x - pointA.x) * newValue / lenght,
                           y: pointA.y + (pointB.y - pointA.y) * newValue / lenght)
        }
    }
}
var line1 = Line(pointA: Line.Point(x: -5, y: -10), pointB: Line.Point(x: 10, y: 10))

print(line1.pointA, line1.pointB)
print(line1.middleOfLine)
print(line1.lenght)

line1.middleOfLine = Line.Point(x: 10, y: 10)
print(line1.middleOfLine)
print(line1.pointA, line1.pointB)


line1.pointA = Line.Point(x: 0, y: 0)
line1.pointB = Line.Point(x: 15, y: 20)

line1.lenght = 50
print(line1.lenght)
print(line1.pointA, line1.pointB)


/*
 1. Самостоятельно повторить проделанное в уроке
 
 2. Добавить студенту property «Дата рождения» (пусть это будет еще одна структура, содержащая день, месяц, год) и два computed property: первое — вычисляющее его возраст, второе — вычисляющее, сколько лет он учился (считать, что он учился в школе с 6 лет, если студенту меньше 6 лет — возвращать 0)
 
 3. Создать структуру «Отрезок», содержащую две внутренние структуры «Точки». Структуру «Точка» создать самостоятельно, несмотря на уже имеющуюся в Swift’е. Таким образом, структура «Отрезок» содержит две структуры «Точки» — точки A и B (stored properties). Добавить два computed properties: « середина отрезка» и «длина» (считать математическими функциями)
 
 4. При изменении середины отрезка должно меняться положение точек A и B. При изменении длины, меняется положение точки B
 
 
 */
