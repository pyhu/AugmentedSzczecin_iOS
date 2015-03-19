//
//  ASRegistrationSegue.swift
//  AugmentedSzczecin
//
//  Created by Patronage on 14.03.2015.
//  Copyright (c) 2015 BLStream. All rights reserved.
//

import UIKit

class ASRegistrationSegue: UIStoryboardSegue {
    
    override func perform() {
        
        var sourceVC: UIViewController = self.sourceViewController as! UIViewController
        var destinationVC: UIViewController = self.destinationViewController as! UIViewController
        var window: UIWindow! = UIApplication.sharedApplication().delegate!.window!

        window.insertSubview(destinationVC.view, atIndex: 0)
        
        var sourceVCFrame: CGRect = sourceVC.view.frame
        
        sourceVCFrame.origin.y = sourceVCFrame.size.height

        UIView.animateWithDuration(0.55, delay: 0.0, usingSpringWithDamping: 500.0, initialSpringVelocity: 0.0, options: UIViewAnimationOptions.CurveEaseInOut, animations:{ ()
            sourceVC.view.frame = sourceVCFrame
            }, completion: {(Bool finished) in
                window.rootViewController! = destinationVC as UIViewController
                for view in window!.subviews as! [UIView] {
                    if (view != window.rootViewController!.view) {
                        view.removeFromSuperview()
                    }
                }
        })
        
    }
}