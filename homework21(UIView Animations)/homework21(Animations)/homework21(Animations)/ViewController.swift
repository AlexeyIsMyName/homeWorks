//
//  ViewController.swift
//  homework21(Animations)
//
//  Created by Алексей on 31/05/2019.
//  Copyright © 2019 Aleksey Suslov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let imageView3: UIImageView = .init(frame: CGRect(x: 0, y: 0, width: 768, height: 1024));
        imageView3.backgroundColor = .clear;
        let image0: UIImage = .init(imageLiteralResourceName: "space.jpg");
        imageView3.image = image0;
        self.view.addSubview(imageView3);
        
        /*
         Ученик.
         1! Создайте 4 вьюхи у левого края ипада.
         2! Ваша задача всех передвинуть горизонтально по прямой за одно и тоже время
         3! Для каждой вьюхи используйте свою интерполяцию (EasyInOut, EasyIn и т.д.). Это для того, чтобы вы увидели разницу своими собственными глазами :)
         4! Добавте реверсивную анимацию и бесконечные повторения
         5! добавьте смену цвета на рандомный
        */
        
        let rectHeight: CGFloat = 100;
        let rectWidth: CGFloat = 100;
        
        let xMin = self.view.frame.minX;
        let yMin = self.view.frame.minY;
        let xMax = self.view.frame.maxX;
        let yMax = self.view.frame.maxY;
        
        let view1: UIView = .init(frame: CGRect(x: xMin, y: 200, width: rectWidth, height: rectHeight));
        let view2: UIView = .init(frame: CGRect(x: xMin, y: 350, width: rectWidth, height: rectHeight));
        let view3: UIView = .init(frame: CGRect(x: xMin, y: 500, width: rectWidth, height: rectHeight));
        let view4: UIView = .init(frame: CGRect(x: xMin, y: 650, width: rectWidth, height: rectHeight));
        
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
                        view1.center = CGPoint(x: xMax - rectWidth / 2, y: view1.center.y);
                        view1.backgroundColor = randomColor();
        }) { (Bool) in
        }
        
        UIView.animate(withDuration: 5,
                       delay: 0,
                       options: [.curveEaseIn, .repeat, .autoreverse],
                       animations: {
                        view2.center = CGPoint(x: xMax - rectWidth / 2, y: view2.center.y);
                        view2.backgroundColor = randomColor();
        }) { (Bool) in
        }
        
        UIView.animate(withDuration: 5,
                       delay: 0,
                       options: [.curveEaseOut, .repeat, .autoreverse],
                       animations: {
                        view3.center = CGPoint(x: xMax - rectWidth / 2, y: view3.center.y);
                        view3.backgroundColor = randomColor();
        }) { (Bool) in
        }
        
        UIView.animate(withDuration: 5,
                       delay: 0,
                       options: [.curveLinear, .repeat, .autoreverse],
                       animations: {
                        view4.center = CGPoint(x: xMax - rectWidth / 2, y: view4.center.y);
                        view4.backgroundColor = randomColor();
        }) { (Bool) in
        }
        
        /*
         Студент
         5! Добавьте еще четыре квадратные вьюхи по углам - красную, желтую, зеленую и синюю
         6! За одинаковое время и при одинаковой интерполяции двигайте их всех случайно, либо по, либо против часовой стрелки в другой угол.
         7! Когда анимация закончиться повторите все опять: выберите направление и передвиньте всех :)
         8! Вьюха должна принимать в новом углу цвет той вьюхи, что была здесь до него ;)
        */
        
        let view5: UIView = .init(frame: CGRect(x: xMin,
                                                y: yMin,
                                                width: rectWidth,
                                                height: rectHeight));
        
        let view6: UIView = .init(frame: CGRect(x: xMin,
                                                y: yMax - rectWidth,
                                                width: rectWidth,
                                                height: rectHeight));
        
        let view7: UIView = .init(frame: CGRect(x: xMax - rectWidth,
                                                y: yMax - rectWidth,
                                                width: rectWidth,
                                                height: rectHeight));
        
        let view8: UIView = .init(frame: CGRect(x: xMax - rectWidth,
                                                y: yMin,
                                                width: rectWidth,
                                                height: rectHeight));
        
        view5.backgroundColor = .red;
        view6.backgroundColor = .yellow;
        view7.backgroundColor = .green;
        view8.backgroundColor = .blue;
        
        view5.alpha = 0.7;
        view6.alpha = 0.7;
        view7.alpha = 0.7;
        view8.alpha = 0.7;
        
        self.view.addSubview(view5);
        self.view.addSubview(view6);
        self.view.addSubview(view7);
        self.view.addSubview(view8);
        
        randomAnimate(view: self.view);
        
        /*
         Мастер
         8! Нарисуйте несколько анимационных картинок человечка, который ходит.
         9! Добавьте несколько человечков на эту композицию и заставьте их ходить
        */
    
        let scale = 0.8;
        
        let imageView2: UIImageView = .init(frame: CGRect(x: 500, y: 500, width: 480 * scale, height: 480 * scale));
        imageView2.backgroundColor = .clear;
        let imageRocket0: UIImage = .init(imageLiteralResourceName: "rocket0.gif");
        let imageRocket1: UIImage = .init(imageLiteralResourceName: "rocket1.gif");
        let imageRocket2: UIImage = .init(imageLiteralResourceName: "rocket2.gif");
        let imageRocket3: UIImage = .init(imageLiteralResourceName: "rocket3.gif");
        
        let imagesRocket: Array = [imageRocket0, imageRocket1, imageRocket2, imageRocket3];
        
        imageView2.animationImages = imagesRocket;
        imageView2.animationDuration = 0.8;
        imageView2.startAnimating();
        self.view.addSubview(imageView2);
        randomAnimateImage(imageView: imageView2);
        
        let imageView: UIImageView = .init(frame: CGRect(x: 100, y: 100, width: 348 * scale, height: 273 * scale));
        imageView.backgroundColor = .clear;
        let imageCat0: UIImage = .init(imageLiteralResourceName: "cat0.gif");
        let imageCat1: UIImage = .init(imageLiteralResourceName: "cat1.gif");
        let imageCat2: UIImage = .init(imageLiteralResourceName: "cat2.gif");
        let imageCat3: UIImage = .init(imageLiteralResourceName: "cat3.gif");
        
        let imagesCat: Array = [imageCat0, imageCat1, imageCat2, imageCat3];
        
        imageView.animationImages = imagesCat;
        imageView.animationDuration = 0.8;
        imageView.startAnimating();
        self.view.addSubview(imageView);
        randomAnimateImage(imageView: imageView);
    }
}

func randomAnimateImage (imageView: UIImageView) -> () {
    let randomX = CGFloat.random(in: 0...768);
    let randomY = CGFloat.random(in: 0...1024);
    let randomCGPoint = CGPoint(x: randomX, y: randomY);
    let randomScale = CGFloat.random(in: 0.7...1.3);
    
    var t = CGAffineTransform.identity
    if imageView.frame.height > 350 {
        t = t.rotated(by: CGFloat.pi);
    }
    t = t.scaledBy(x: randomScale, y: randomScale)

    UIView.animate(withDuration: 4,
                   delay: 0,
                   options: [.curveLinear],
                   animations: {
                    imageView.transform = t
                    imageView.center = randomCGPoint;
    }) { (Bool) in
        randomAnimateImage(imageView: imageView);
    }
}

func randomColor () -> (UIColor) {
    let r = CGFloat.random(in: 0.0 ..< 256.0) / 255.0;
    let g = CGFloat.random(in: 0.0 ..< 256.0) / 255.0;
    let b = CGFloat.random(in: 0.0 ..< 256.0) / 255.0;
    return UIColor.init(red: r, green: g, blue: b, alpha: 1.0);
}

func randomAnimate (view: UIView) -> () {
    
    var frames = Array<CGRect>();
    var colors = Array<UIColor>();
    var views = Array<UIView>();
    
    frames.append(view.subviews[8].frame);
    colors.append(view.subviews[8].backgroundColor ?? UIColor.white);
    
    for index in 5...8 {
        frames.append(view.subviews[index].frame);
        colors.append(view.subviews[index].backgroundColor ?? UIColor.white);
        views.append(view.subviews[index]);
    }
    
    colors.append(view.subviews[5].backgroundColor ?? UIColor.white);
    frames.append(view.subviews[5].frame);
    
    let randomBool = Bool.random();
        
        UIView.animate(withDuration: 3,
                       delay: 0,
                       options: [.curveLinear],
                       animations: {
                        for index in 1...4 {
                            let finishView = views[index - 1];
                        
                            if randomBool {
                                finishView.frame = frames[index + 1];
                                finishView.backgroundColor = colors[index + 1];
                            } else {
                                finishView.frame = frames[index - 1];
                                finishView.backgroundColor = colors[index - 1];
                            }
                        }
        }) { (Bool) in
            randomAnimate(view: view);
        }
}

