//
//  DrawingView.swift
//  hw24(Drawings)
//
//  Created by Алексей on 15/06/2019.
//  Copyright © 2019 Aleksey Suslov. All rights reserved.
//

import UIKit

class DrawingView: UIView {
    var isWillTransition = false
    var starsRects = [CGRect]()
    /*
     Ученик.
     1! Нарисуйте пятиконечную звезду :)
     2! Добавьте окружности на концах звезды
     3! Соедините окружности линиями
     
     Студент.
     4! Закрасте звезду любым цветом оО
     5! При каждой перерисовке рисуйте пять таких звезд (только мелких) в рандомных точках экрана
     
     Мастер
     6. После того как вы попрактиковались со звездами нарисуйте что-то свое, проявите творчество :)
     
     Супермен
     7. Сделайте простую рисовалку - веду пальцем по экрану и рисую :)
    */
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()!
        let offset: CGFloat = 50.0
        let maxRectSize = min((rect.width - offset * 2), (rect.height - offset * 2))
        
        let starRect = CGRect.init(x: (rect.width - maxRectSize) / 2,
                                   y: (rect.height - maxRectSize) / 2,
                                   width: maxRectSize,
                                   height: maxRectSize)

        self.drawStar(starRect: starRect, context: context)
        
        if self.starsRects.count > 40 {
            self.starsRects.removeAll()
        }
        
        if isWillTransition {
            self.drawRandomStar(context: context)
        }
    }
    
    func randomColor () -> (UIColor) {
        let r = CGFloat.random(in: 0...256) / 256
        let g = CGFloat.random(in: 0...256) / 256
        let b = CGFloat.random(in: 0...256) / 256
        return UIColor.init(red: r, green: g, blue: b, alpha: 1.0)
    }
    
    func drawRandomStar (context: CGContext) -> () {
        let scaleByBigStar: CGFloat = 0.1
        let maxRectSize = min(self.frame.width * scaleByBigStar, self.frame.height * scaleByBigStar)
        let minRectSize = maxRectSize / 2;
        
        for _ in 1...5 {
            let randomRectSize = CGFloat.random(in: minRectSize...maxRectSize)
            let randomX = CGFloat.random(in: self.frame.minX...self.frame.maxX)
            let randomY = CGFloat.random(in: self.frame.minY...self.frame.maxY)
            
            let starRect = CGRect.init(x: randomX,
                                       y: randomY,
                                       width: randomRectSize,
                                       height: randomRectSize)
            
            self.starsRects.append(starRect)
        }
        
        for starRect in self.starsRects {
            self.drawStar(starRect: starRect, context: context)
        }
    }
    
    func drawStar (starRect: CGRect, context: CGContext) -> () {
        //Star is made by lines
        let serviceOffsetForStar = starRect.height / 4
        
        let point1 = CGPoint.init(x: starRect.minX, y: starRect.maxY)
        let point2 = CGPoint.init(x: starRect.midX, y: starRect.minY)
        let point3 = CGPoint.init(x: starRect.maxX, y: starRect.maxY)
        let point4 = CGPoint.init(x: starRect.minX, y: starRect.minY + serviceOffsetForStar)
        let point5 = CGPoint.init(x: starRect.maxX, y: starRect.minY + serviceOffsetForStar)
        
        let starPoints = [point2, point3, point4, point5, point1];
        
        context.setFillColor(self.randomColor().cgColor)
        
        context.move(to: point1)
        for point in starPoints {
            context.addLine(to: point)
        }
        
        context.fillPath()
        
        //Make lines both ellipses
        let ellipsesPoints = [point1, point4, point2, point5, point3];
        
        context.setStrokeColor(self.randomColor().cgColor)
        context.setLineWidth(2.0)
        
        context.move(to: point3)
        for point in ellipsesPoints {
            context.addLine(to: point)
        }
        
        context.strokePath()
        
        //Ellipses are made by gectangles
        context.setFillColor(self.randomColor().cgColor)
        
        let serviseOffsetForEllipse = serviceOffsetForStar / 6
        
        for point in starPoints {
            let ellipseRect = CGRect.init(x: point.x - serviseOffsetForEllipse,
                                          y: point.y - serviseOffsetForEllipse,
                                          width: serviseOffsetForEllipse * 2,
                                          height: serviseOffsetForEllipse * 2)
            context.fillEllipse(in: ellipseRect)
        }
        
        context.fillPath()
    }
}
