//
//  ViewController.swift
//  hw25(UIButton)
//
//  Created by Алексей on 18/06/2019.
//  Copyright © 2019 Aleksey Suslov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    enum ArithmeticOperator {
        case addition, subtraction, multiplication, division
    }
    
    var outputNumber = String()
    var firstOperand = Float()
    var secondOperand = Float()
    var binaryOperator = ArithmeticOperator.addition
    var isPushArithmeticButton = Bool()
    
    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    @IBAction func numberButton(_ sender: UIButton) {
        var digit = Int()
        switch sender.tag {
            case 0: digit = 0
            case 1: digit = 1
            case 2: digit = 2
            case 3: digit = 3
            case 4: digit = 4
            case 5: digit = 5
            case 6: digit = 6
            case 7: digit = 7
            case 8: digit = 8
            case 9: digit = 9
        default:
            error()
        }
        outputNumber.append(String(digit))
        outputLabel.text = outputNumber
    }
    
    @IBAction func addDot(_ sender: UIButton) {
        if !isDotHere(string: outputNumber) && !outputNumber.isEmpty {
            outputNumber.append(".")
        }
        outputLabel.text = outputNumber
    }
    
    @IBAction func removeLastDigit(_ sender: UIButton) {
        if !outputNumber.isEmpty {
            outputNumber.removeLast()
        }
        outputLabel.text = outputNumber
    }
    
    @IBAction func operationBatton(_ sender: UIButton) {
        switch sender.tag {
        case 0: cleanAll(text: "AC")
        case 1: cleanEntry(text: "CE")
        case 2: multiplication(text: "X")
        case 3: division(text: "/")
        case 4: addition(text: "+")
        case 5: subtraction(text: "-")
        case 6: assignment(text: "=")
        default:
            error()
        }
        outputLabel.text = outputNumber
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        /*
         Ученик.
         1! Создайте и разместите кнопки цифр и операторов, создайте нужные акшины
         2! Добавьте лейбл и создайте соответствующий проперти
         3! По нажатию на кнопку на индикатор должна выводиться либо цифра, либо оператор (никаких вычислений - выводим просто значения кнопок)
         
         Студент.
         4. Наведите более / менее красоту, можете насоздавать линий (вьюхи с малой шириной)б ставить бэкграундыб используйте картинки если надо и тд. - проявите творчество :)
         5! Сделайте так, чтобы когда нажимаешь на цифровую кнопку, то число росло
         6! Сделайте кнопку сброса
         
         Мастер.
         7! Сохраняйте вводимое число
         8! Первую операцию тоже надо сохранить, пока не ввели второе число (используйте енумы!)
         9! Когда нажимаешь равно то первое число выболняет операцию над вторым и выводится результат
         10! После того, как результат вывелся на экран, он автоматом становиться первым числом и к нему уже можно прибавлять, вычитать и т.д. - как в калькуляторе
         
         Супермен
         11! Добавьте точку, теперь можно вводить и дробное число, точка должна работать также, как и точка на обычном калькуляторе (имею в виду, что двух точек в числе быть не может в случае повторного нажатия)
         12! С дробным вводом будет посложнее - задание для настоящих суперменов :)
        */
    }
    
    
    // Checking string for dot charecter -> bool
    func isDotHere (string: String) -> (Bool) {
        var bool = false
        for char in string {
            if char == "." {
                bool = true
            }
        }
        return bool
    }
    
    // Funnctions which need to work calculator
    // AC - Clean All
    func cleanAll (text: String) {
        infoLabel.text = text
        outputNumber.removeAll()
    }
    
    // CE - Clean Entry
    func cleanEntry (text: String) {
        infoLabel.text = text
        outputNumber.removeAll()
    }
    
    // Arithmetic operations (addition, subtraction, multiplication, division)
    func addition (text: String) {
        setFirstOperand()
        binaryOperator = .addition
        infoLabel.text = String(firstOperand) + " " + text
        outputNumber.removeAll()
        isPushArithmeticButton = true
    }
    
    func subtraction (text: String) {
        setFirstOperand()
        binaryOperator = .subtraction
        infoLabel.text = String(firstOperand) + " " + text
        outputNumber.removeAll()
        isPushArithmeticButton = true
    }
    
    func multiplication (text: String) {
        setFirstOperand()
        binaryOperator = .multiplication
        infoLabel.text = String(firstOperand) + " " + text
        outputNumber.removeAll()
        isPushArithmeticButton = true
    }
    
    func division (text: String) {
        setFirstOperand()
        binaryOperator = .division
        infoLabel.text = String(firstOperand) + " " + text
        outputNumber.removeAll()
        isPushArithmeticButton = true
    }
    
    
    // Assignment operator
    func assignment (text: String) {
        var result = Float()
        
        if isPushArithmeticButton {
            setSecondOperand()
        }
        
        switch binaryOperator {
        case .addition:
            result = firstOperand + secondOperand
            infoLabel.text = String(firstOperand) + " + " + String(secondOperand) + text
        case .subtraction:
            result = firstOperand - secondOperand
            infoLabel.text = String(firstOperand) + " - " + String(secondOperand) + text
        case .multiplication:
            result = firstOperand * secondOperand
            infoLabel.text = String(firstOperand) + " X " + String(secondOperand) + text
        case .division:
            result = firstOperand / secondOperand
            infoLabel.text = String(firstOperand) + " / " + String(secondOperand) + text
        }
        
        outputNumber = String(result)
        firstOperand = result
        isPushArithmeticButton = false
    }
    
    func error () {
        infoLabel.text = "Error"
    }
    
    func setFirstOperand () {
        if let number = Float(outputNumber) {
            firstOperand = number
        } else {
            firstOperand = 0
        }
    }
    
    func setSecondOperand () {
        if let number = Float(outputNumber) {
            secondOperand = number
        } else {
            secondOperand = 0
        }
    }
    
}

