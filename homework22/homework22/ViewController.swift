//
//  ViewController.swift
//  homework22
//
//  Created by Алексей on 07/06/2019.
//  Copyright © 2019 Aleksey Suslov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var mainFieldView = UIView();
    var figures = Array<UIView>();
    weak var draggingView = UIView();
    var touchOffSet = CGPoint();
    
    /*
     Уровень супермен (остальных уровней не будет)
     1! Создайте шахматное поле (8х8), используйте черные сабвьюхи
     2! Добавьте бeлые и красные шашки на черные клетки (используйте начальное расположение в шашках)
     3! Реализуйте механизм драг'н'дроп подобно тому, что я сделал в примере, но с условиями:
     4! Шашки должны ставать в центр черных клеток.
     5! Даже если я отпустил шашку над центром белой клетки - она должна переместиться в центр ближайшей к отпусканию черной клетки.
     6! Шашки не могут становиться друг на друга
     7! Шашки не могут быть поставлены за пределы поля.
     */

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let cellLength = self.view.frame.width / 8;
        let positionY = self.view.frame.midY - cellLength * 4;
        
        mainFieldView = .init(frame: CGRect.init(x: 0,
                                                    y: positionY,
                                                    width: cellLength * 8,
                                                    height: cellLength * 8));
        
        mainFieldView.autoresizingMask = [.flexibleLeftMargin,
                                          .flexibleRightMargin,
                                          .flexibleTopMargin,
                                          .flexibleBottomMargin];
        
        self.view.addSubview(mainFieldView);
        self.view.backgroundColor = randomColor();
        
        for indexY in 0..<8 {
            for indexX in 0..<8 {
                let view: UIView = .init(frame: CGRect.init(x: 0 + cellLength * CGFloat(indexX),
                                                            y: 0 + cellLength * CGFloat(indexY),
                                                            width: cellLength,
                                                            height: cellLength));
                
                view.backgroundColor = (indexY % 2 == indexX % 2) ? .white : .black;
                mainFieldView.addSubview(view);
            }
        }
        
        var correctCell = 1;
        for view in mainFieldView.subviews where view.backgroundColor!.isEqual(UIColor.black) {
            let figereLength = view.frame.width / 2;
            
            if view.backgroundColor!.isEqual(UIColor.black) && correctCell <= 12 {
                let x = view.frame.minX;
                let y = view.frame.minY;
                let figureView: UIView = .init(frame: CGRect.init(x: x + figereLength / 2,
                                                            y: y + figereLength / 2,
                                                            width: figereLength,
                                                            height: figereLength));
                figureView.backgroundColor = .red;
                figureView.tag = 1;
                figures.append(figureView);
                self.mainFieldView.addSubview(figureView);
            }
            
            if view.backgroundColor!.isEqual(UIColor.black) && correctCell >= 21 {
                let x = view.frame.minX;
                let y = view.frame.minY;
                let figureView: UIView = .init(frame: CGRect.init(x: x + figereLength / 2,
                                                                  y: y + figereLength / 2,
                                                                  width: figereLength,
                                                                  height: figereLength));
                figureView.backgroundColor = .white;
                figureView.tag = 1;
                figures.append(figureView);
                self.mainFieldView.addSubview(figureView);
            }
            correctCell += 1;
        }
    }
    
    func randomColor () -> (UIColor) {
        let r = CGFloat.random(in: 0.0 ..< 256.0) / 255.0;
        let g = CGFloat.random(in: 0.0 ..< 256.0) / 255.0;
        let b = CGFloat.random(in: 0.0 ..< 256.0) / 255.0;
        return UIColor.init(red: r, green: g, blue: b, alpha: 1.0);
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        guard let touch = touches.randomElement() else {
            return
        }
        
        let pointOnField = touch.location(in: self.view);
        let selectedView = self.view.hitTest(pointOnField, with: event)
        
        if let view = selectedView, view.tag == 1 {
            self.draggingView = view;
            let touchPoint = touch.location(in: self.view);
            self.touchOffSet = CGPoint(x: view.frame.midX - touchPoint.x,
                                       y: view.frame.midY - touchPoint.y);
            
            self.view.bringSubviewToFront(self.draggingView!);
            self.mainFieldView.bringSubviewToFront(self.draggingView!);
            self.draggingView?.layer.removeAllAnimations();
            
            UIView.animate(withDuration: 0.3) {
                view.transform = view.transform.scaledBy(x: 1.2, y: 1.2);
                view.alpha = 0.8;
            }
        } else {
            self.draggingView = nil;
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if ((self.draggingView) != nil) {
            
            guard let touch = touches.randomElement() else {
                return
            }
            
            let touchPoint = touch.location(in: self.view);
            let correction = CGPoint(x: touchPoint.x + self.touchOffSet.x,
                                     y: touchPoint.y + self.touchOffSet.y);
         
            self.draggingView?.center = correction;
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        var tempDelta = Float.greatestFiniteMagnitude;
        var nearPoint = CGPoint();
        
        if let tempDraggingView: UIView = self.draggingView {
            for view in mainFieldView.subviews where view.backgroundColor!.isEqual(UIColor.black) {
                let deltaX = fabsf(Float(view.center.x - (tempDraggingView.center.x)));
                let deltaY = fabsf(Float(view.center.y - (tempDraggingView.center.y)));
                
                var figureIsNotHere: Bool = true;
                for figure in figures {
                    if figure.center == view.center {
                        figureIsNotHere = false;
                    }
                }
                
                if tempDelta > sqrtf(Float(deltaX * deltaX + deltaY * deltaY)) && figureIsNotHere {
                    nearPoint = view.center;
                    tempDelta = sqrtf(Float(deltaX * deltaX + deltaY * deltaY));
                }
            }
        }
        
        UIView.animate(withDuration: 0.3) {
            self.draggingView?.center = nearPoint;
            self.draggingView?.transform = CGAffineTransform.identity;
            self.draggingView?.alpha = 1.0;
        }
        self.draggingView = nil;
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
}

