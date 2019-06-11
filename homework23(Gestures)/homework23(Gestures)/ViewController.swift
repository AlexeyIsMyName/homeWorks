//
//  ViewController.swift
//  homework23(Gestures)
//
//  Created by Алексей on 08/06/2019.
//  Copyright © 2019 Aleksey Suslov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var testView = UIView();
    
    /*
     Ученик
     1! Добавьте квадратную картинку на вьюху вашего контроллера
     2! Если хотите, можете сделать ее анимированной
     
     Студент
     3! По тачу анимационно передвигайте картинку со ее позиции в позицию тача
     4! Если я вдруг делаю тач во время анимации, то картинка должна двигаться в новую точку без рывка (как будто она едет себе и все)
     
     Мастер
     5. Если я делаю свайп вправо, то давайте картинке анимацию поворота по часовой стрелке на 360 градусов
     6. То же самое для свайпа влево, только анимация должна быть против часовой (не забудьте остановить предыдущее кручение)
     7. По двойному тапу двух пальцев останавливайте анимацию
     
     Супермен
     8. Добавьте возможность зумить и отдалять картинку используя пинч
     9. Добавьте возможность поворачивать картинку используя ротейшн
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let rectWidth: CGFloat = 100.0;
        let rectHeight: CGFloat = 100.0;
        let x = self.view.frame.midX - rectWidth / 2;
        let y = self.view.frame.midY - rectHeight / 2;
        
        let view = UIView.init(frame: CGRect(x: x, y: y, width: rectWidth, height: rectHeight));
        view.backgroundColor = UIColor.black;
        
        self.testView = view;
        self.view.addSubview(view);
        
        //UIGestureRecognizer
        //One tap
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(self.handleTap(_:)));
        self.view.addGestureRecognizer(tapGesture);
    }
    
    @objc func handleTap(_ tapGesture: UITapGestureRecognizer) {
        print(tapGesture.location(in: self.view));
        UIView.animate(withDuration: 3,
                        delay: 0,
                        options: [UIView.AnimationOptions.beginFromCurrentState],
                        animations: {
                            self.testView.backgroundColor = UIColor.green;
                            self.testView.center = tapGesture.location(in: self.view);
                        }) { (Bool) in
                        };
    }
    
    
}

