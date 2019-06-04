//
//  ViewController.swift
//  homework21(Animations)
//
//  Created by Алексей on 31/05/2019.
//  Copyright © 2019 Aleksey Suslov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        /*
         Ученик.
         1! Создайте 4 вьюхи у левого края ипада.
         2! Ваша задача всех передвинуть горизонтально по прямой за одно и тоже время
         3! Для каждой вьюхи используйте свою интерполяцию (EasyInOut, EasyIn и т.д.). Это для того, чтобы вы увидели разницу своими собственными глазами :)
         4! Добавте реверсивную анимацию и бесконечные повторения
         5! добавьте смену цвета на рандомный
        */
        
        let x = self.view.frame.minX;
        let xMax = self.view.frame.maxX - 50;
        
        let view1: UIView = .init(frame: CGRect(x: x, y: 100, width: 100, height: 100));
        let view2: UIView = .init(frame: CGRect(x: x, y: 250, width: 100, height: 100));
        let view3: UIView = .init(frame: CGRect(x: x, y: 400, width: 100, height: 100));
        let view4: UIView = .init(frame: CGRect(x: x, y: 550, width: 100, height: 100));
        
        view1.backgroundColor = randomColor();
        view2.backgroundColor = randomColor();
        view3.backgroundColor = randomColor();
        view4.backgroundColor = randomColor();
        
        self.view.addSubview(view1);
        self.view.addSubview(view2);
        self.view.addSubview(view3);
        self.view.addSubview(view4);
        
        UIView.animate(withDuration: 5,
                       delay: 0,
                       options: [.curveEaseInOut, .repeat, .autoreverse],
                       animations: {
                        view1.center = CGPoint(x: xMax, y: view1.center.y);
                        view1.backgroundColor = randomColor();
        }) { (Bool) in
        }
        
        UIView.animate(withDuration: 5,
                       delay: 0,
                       options: [.curveEaseIn, .repeat, .autoreverse],
                       animations: {
                        view2.center = CGPoint(x: xMax, y: view2.center.y);
                        view2.backgroundColor = randomColor();
        }) { (Bool) in
        }
        
        UIView.animate(withDuration: 5,
                       delay: 0,
                       options: [.curveEaseOut, .repeat, .autoreverse],
                       animations: {
                        view3.center = CGPoint(x: xMax, y: view3.center.y);
                        view3.backgroundColor = randomColor();
        }) { (Bool) in
        }
        
        UIView.animate(withDuration: 5,
                       delay: 0,
                       options: [.curveLinear, .repeat, .autoreverse],
                       animations: {
                        view4.center = CGPoint(x: xMax, y: view4.center.y);
                        view4.backgroundColor = randomColor();
        }) { (Bool) in
        }
        
        
    }

    /*
     Студент
     5. Добавьте еще четыре квадратные вьюхи по углам - красную, желтую, зеленую и синюю
     6. За одинаковое время и при одинаковой интерполяции двигайте их всех случайно, либо по, либо против часовой стрелки в другой угол.
     7. Когда анимация закончиться повторите все опять: выберите направление и передвиньте всех :)
     8. Вьюха должна принимать в новом углу цвет той вьюхи, что была здесь до него ;)
     
     Мастер
     8. Нарисуйте несколько анимационных картинок человечка, который ходит.
     9. Добавьте несколько человечков на эту композицию и заставьте их ходить
     
    */

}

func randomColor () -> (UIColor) {
    let r = CGFloat.random(in: 0.0 ..< 256.0) / 255.0;
    let g = CGFloat.random(in: 0.0 ..< 256.0) / 255.0;
    let b = CGFloat.random(in: 0.0 ..< 256.0) / 255.0;
    return UIColor.init(red: r, green: g, blue: b, alpha: 1.0);
}
