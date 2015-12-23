//
//  ViewController.swift
//  SwiftDropdownViewDemo
//
//  Created by JAVIER CALATRAVA LLAVERIA on 22/12/15.
//  Copyright © 2015 JAVIER CALATRAVA LLAVERIA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnFoldButton: UIButton!
    @IBOutlet weak var cnsUpperViewHeight: NSLayoutConstraint!
    
    
    var heightUpperView:CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        heightUpperView = self.cnsUpperViewHeight.constant;
        
        self.setupUIControls()
        
        // Do any additional setup after loading the view.
    }
    
    func setupUIControls(){
        
        self.btnFoldButton.addGestureRecognizer(UIPanGestureRecognizer.init(target: self, action: "panDetected:"))
    }
    
    
    func panDetected(recognizer: UIPanGestureRecognizer){
        
        if(recognizer.state == UIGestureRecognizerState.Began){
            heightUpperView = self.cnsUpperViewHeight.constant
        }
        
        let point:CGPoint = recognizer.translationInView(self.btnFoldButton.superview)
        
        let newHeight =  heightUpperView + point.y
        
        if(newHeight >= UIScreen.mainScreen().bounds.height * 0.15 &&
            newHeight <= UIScreen.mainScreen().bounds.height * 0.66){
                cnsUpperViewHeight.constant = newHeight
        }
        
        //print("\(point)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

