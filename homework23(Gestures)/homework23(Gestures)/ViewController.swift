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
     5! Если я делаю свайп вправо, то давайте картинке анимацию поворота по часовой стрелке на 360 градусов
     6! То же самое для свайпа влево, только анимация должна быть против часовой (не забудьте остановить предыдущее кручение)
     7. По двойному тапу двух пальцев останавливайте анимацию
     
     Супермен
     8. Добавьте возможность зумить и отдалять картинку используя пинч
     9. Добавьте возможность поворачивать картинку используя ротейшн
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let image = UIImage.init(named: "maincable_midspan.jpeg");
        let imageView = UIImageView.init(image: image);
        
        let viewWithImage = UIView.init(frame: CGRect(x: 0, y: 0, width: 768, height: 1024));
        viewWithImage.addSubview(imageView);
        self.view.addSubview(viewWithImage);
        
        let rectWidth: CGFloat = 100.0;
        let rectHeight: CGFloat = 100.0;
        let x = self.view.frame.midX - rectWidth / 2;
        let y = self.view.frame.midY - rectHeight / 2;
        
        let view = UIView.init(frame: CGRect(x: x, y: y, width: rectWidth, height: rectHeight));
        view.backgroundColor = UIColor.black;
        
        self.testView = view;
        self.view.addSubview(view);
        
        //UIGestureRecognizer
        //One tap Gesture
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(self.handleTap(_:)));
        self.view.addGestureRecognizer(tapGesture);
        
        //Swipe Gesture
        let verticalSwipeGesture = UISwipeGestureRecognizer.init(target: self, action: #selector(self.handleVertialSwipe(_:)));
        let horizontalSwipeGesture = UISwipeGestureRecognizer.init(target: self, action: #selector(self.handleHorizontalSwipe(_:)));
        verticalSwipeGesture.direction = [.down, .up];
        horizontalSwipeGesture.direction = [.left, .right];
        self.view.addGestureRecognizer(verticalSwipeGesture);
        self.view.addGestureRecognizer(horizontalSwipeGesture);
        
        //Double tap & Double touch Gesture
        let doubleTapDoubleTouchGesture = UITapGestureRecognizer.init(target: self, action: #selector(self.handleDoubleTapDoubleTouch(_:)));
        doubleTapDoubleTouchGesture.numberOfTapsRequired = 2;
        doubleTapDoubleTouchGesture.numberOfTouchesRequired = 2;
        self.view.addGestureRecognizer(doubleTapDoubleTouchGesture);
    }
    
    @objc func handleTap(_ tapGesture: UITapGestureRecognizer) {
        print(tapGesture.location(in: self.view));
        UIView.animate(withDuration: 5,
                        delay: 0,
                        options: [.beginFromCurrentState],
                        animations: {
                            self.testView.backgroundColor = self.randomColor();
                            self.testView.center = tapGesture.location(in: self.view);
                        }) { (Bool) in
                        };
    }
    
    @objc func handleVertialSwipe(_ verticalSwipeGesture: UISwipeGestureRecognizer) {
        let currentTransform = self.testView.transform;
        let newTransform = currentTransform.rotated(by: 3.14159);
        UIView.animate(withDuration: 5,
                       delay: 0,
                       options: [.beginFromCurrentState],
                       animations: {
                        self.testView.backgroundColor = UIColor.black;
                        self.testView.alpha = 1.0;
                        self.testView.transform = newTransform;
        }) { (Bool) in
        };
    }
    
    @objc func handleHorizontalSwipe(_ horizontalSwipeGesture: UISwipeGestureRecognizer) {
        let currentTransform = self.testView.transform;
        let newTransform = currentTransform.rotated(by: -3.14159);
        UIView.animate(withDuration: 5,
                       delay: 0,
                       options: [.beginFromCurrentState],
                       animations: {
                        self.testView.backgroundColor = UIColor.white;
                        self.testView.alpha = 1.0;
                        self.testView.transform = newTransform;
        }) { (Bool) in
        };
    }
    
    @objc func handleDoubleTapDoubleTouch(_ tapGesture: UISwipeGestureRecognizer) {
        UIView.animate(withDuration: 2,
                       delay: 0,
                       options: [.beginFromCurrentState],
                       animations: {
                        self.testView.backgroundColor = self.randomColor();
                        self.testView.alpha = 1.0;
        }) { (Bool) in
        };
    }
    
    func randomColor () -> (UIColor) {
        let r = CGFloat.random(in: 0...256) / 255;
        let g = CGFloat.random(in: 0...256) / 255;
        let b = CGFloat.random(in: 0...256) / 255;
        let randomAlpha = CGFloat.random(in: 0.6...0.9);
        return UIColor.init(red: r, green: g, blue: b, alpha: randomAlpha);
    }
    
}

