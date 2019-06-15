//
//  DrawingView.swift
//  hw24(Drawings)
//
//  Created by Алексей on 15/06/2019.
//  Copyright © 2019 Aleksey Suslov. All rights reserved.
//

import UIKit

class DrawingView: UIView {

    /*
     Ученик.
     1! Нарисуйте пятиконечную звезду :)
     2! Добавьте окружности на концах звезды
     3! Соедините окружности линиями
     
     Студент.
     4! Закрасте звезду любым цветом оО
     5. При каждой перерисовке рисуйте пять таких звезд (только мелких) в рандомных точках экрана
     
     Мастер
     6. После того как вы попрактиковались со звездами нарисуйте что-то свое, проявите творчество :)
     
     Супермен
     7. Сделайте простую рисовалку - веду пальцем по экрану и рисую :)
    */
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    
    override func draw(_ rect: CGRect) {
        
        let context: CGContext = UIGraphicsGetCurrentContext()!;
        
        //Star is made by lines
        let offset: CGFloat = 50.0
        let maxRectSize = min((rect.width - offset * 2), (rect.height - offset * 2))
        
        let starRect = CGRect.init(x: (rect.width - maxRectSize) / 2,
                                   y: (rect.height - maxRectSize) / 2,
                                   width: maxRectSize,
                                   height: maxRectSize)
        
        let serviceOffset1 = starRect.height / 4
        
        let point1 = CGPoint.init(x: starRect.minX, y: starRect.maxY)
        let point2 = CGPoint.init(x: starRect.midX, y: starRect.minY)
        let point3 = CGPoint.init(x: starRect.maxX, y: starRect.maxY)
        let point4 = CGPoint.init(x: starRect.minX, y: starRect.minY + serviceOffset1)
        let point5 = CGPoint.init(x: starRect.maxX, y: starRect.minY + serviceOffset1)
        
        let starPoints = [point2, point3, point4, point5, point1];
        
        context.setFillColor(self.randomColor().cgColor)
        
        context.move(to: point1)
        for point in starPoints {
            context.addLine(to: point)
        }
        
        context.fillPath()
        //context.strokePath()
        
        //Ellipses are made by gectangles
        context.setStrokeColor(UIColor.green.cgColor)
        context.setLineWidth(2.0)
        
        let serviseOffset2 = serviceOffset1 / 6
        
        for point in starPoints {
            let ellipseRect = CGRect.init(x: point.x - serviseOffset2,
                                          y: point.y - serviseOffset2,
                                          width: serviseOffset2 * 2,
                                          height: serviseOffset2 * 2)
            
            context.strokeEllipse(in: ellipseRect)
        }
        
        context.strokePath()
        
        //Make lines both ellipses
        let ellipsesPoints = [point1, point4, point2, point5, point3];
        
        context.setStrokeColor(UIColor.blue.cgColor)
        context.setLineWidth(2.0)
        
        context.move(to: point3)
        for point in ellipsesPoints {
            context.addLine(to: point)
        }
        
        context.strokePath()
    }
    
    func randomColor () -> (UIColor) {
        let r = CGFloat.random(in: 0...256) / 256
        let g = CGFloat.random(in: 0...256) / 256
        let b = CGFloat.random(in: 0...256) / 256
        return UIColor.init(red: r, green: g, blue: b, alpha: 1.0)
    }
}
