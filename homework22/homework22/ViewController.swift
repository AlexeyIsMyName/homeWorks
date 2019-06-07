//
//  ViewController.swift
//  homework22
//
//  Created by Алексей on 07/06/2019.
//  Copyright © 2019 Aleksey Suslov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let cellLength = self.view.frame.width / 8;
        let positionY = self.view.frame.midY - cellLength * 4;
        
        let mainFieldView: UIView = .init(frame: CGRect.init(x: 0,
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
                let figureView: UIView = .init(frame: CGRect.init(x: 0 + figereLength / 2,
                                                            y: 0 + figereLength / 2,
                                                            width: figereLength,
                                                            height: figereLength));
                figureView.backgroundColor = .red;
                view.addSubview(figureView);
            }
            if view.backgroundColor!.isEqual(UIColor.black) && correctCell >= 21 {
                let figureView: UIView = .init(frame: CGRect.init(x: 0 + figereLength / 2,
                                                                  y: 0 + figereLength / 2,
                                                                  width: figereLength,
                                                                  height: figereLength));
                figureView.backgroundColor = .white;
                view.addSubview(figureView);
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
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
}

