//
//  JCDropDownViewController.swift
//  SwiftDropdownViewDemo
//
//  Created by JAVIER CALATRAVA LLAVERIA on 22/12/15.
//  Copyright © 2015 JAVIER CALATRAVA LLAVERIA. All rights reserved.
//

import UIKit

class JCDropDownViewController: UIViewController {

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
            
        }else if(recognizer.state == UIGestureRecognizerState.Ended){
            print("end")
        }
        
        let point:CGPoint = recognizer.translationInView(self.btnFoldButton.superview)
        
        cnsUpperViewHeight.constant = heightUpperView + point.y
        /*
        var frameButtonDropdown = self.btnFoldButton.frame
        frameButtonDropdown.origin.y = heightUpperView + point.y + frameButtonDropdown.size.height/2
        self.btnFoldButton.frame = frameButtonDropdown
        */
        print("\(point)")
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
