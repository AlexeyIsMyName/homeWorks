 /*
 1. Создайте расширение для Int с пропертисами isNegative, isPositive, bool
 
 2. Добавьте проперти, которое возвращает количество символов в числе
 
 3. Добавьте сабскрипт, который возвращает символ числа по индексу:
 
 let a = 8245
 
 a[1] // 4
 a[3] // 8
 
 Профи могут определить и сеттер :)
 */

extension Int {
    var isNegative: Bool {
        return self < 0
    }
    
    var isPositive: Bool {
        return !isNegative
    }
    
    var countSymbols: Int {
        var temp = self
        var count = 0
        
        while temp > 0 {
            count += 1
            temp = temp / 10
        }
        
        return count
    }
    
    subscript(index: Int) -> String {
        let temp = String(self)
        var char = ""
        var round = 0
        
        for value in temp {
            round += 1
            if round == index {
            char = String(value)
            break
            }
        }
        return char
    }
}

var x = 158901
x.isNegative
x.isPositive
x.countSymbols
x[3]

 /*
 4. Расширить String, чтобы принимал сабскрипт вида s[0..<3] и мог также устанавливать значения используя его

 5. Добавить стрингу метод truncate, чтобы отрезал лишние символы и , если таковые были, заменял их на троеточие:
 
 let s = "Hi hi hi"
 
 s.truncate(4) // Hi h...
 
 s.truncate(10) // Hi hi hi
 */

 extension String {
    subscript(range: CountableRange<Int>) -> Substring {
        get {
            return self[index(startIndex, offsetBy: range.lowerBound)..<index(startIndex, offsetBy: range.upperBound)]
        }
        set {
            let start = self[..<index(startIndex, offsetBy: range.lowerBound)]
            let end = self[index(startIndex, offsetBy: range.upperBound)...]
            self = String(start) + newValue + String(end)
        }
    }
    
    func truncate(_ count: Int) -> String {
        switch count {
        case _ where count < self.count:
            return self[0..<count] + "..."
        default:
            return self
        }
    }
 }

 var b = "Happy new year!"
 b[0..<10]
 b
 b[6..<9] = "NEW"
 b
 b.truncate(5)
