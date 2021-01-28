//
//  ViewController.swift
//  hw24(Drawings)
//
//  Created by Алексей on 15/06/2019.
//  Copyright © 2019 Aleksey Suslov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var drawingView: DrawingView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    //Orientation
    override func viewWillTransition(to size: CGSize,
                                     with coordinator: UIViewControllerTransitionCoordinator) {
        
        self.drawingView.setNeedsDisplay()
        self.drawingView.isWillTransition = true;
    }

}

