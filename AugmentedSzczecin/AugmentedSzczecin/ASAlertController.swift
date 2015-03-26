//
//  ASAlertController.swift
//  AugmentedSzczecin
//
//  Created by Wojciech Tyziniec on 20/03/15.
//  Copyright (c) 2015 BLStream. All rights reserved.
//

import Foundation
import UIKit

class ASAlertController: UIAlertController
{
    var timer = NSTimer()
    
    func showAlert(alertTitle: String, withMessage alertMessage: String, fromController controller: UIViewController) {
        var alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .Alert)
        controller.presentViewController(alert, animated: true, completion: nil)
    }
    
    //Because of NSTimer class I had to use kinda "linker" method, it's impossible to pass parameters directly.
    func parametersLinker(timer: NSTimer) {
        let dict = timer.userInfo as! NSDictionary
        
        showAlert(dict["title"] as! String,
            withMessage: dict["message"] as! String,
            fromController: dict["controller"] as! UIViewController)
    }
    
    func showAlertWithDelay(alertTitle: String, alertMessage: String, controller: UIViewController, delay: Double) {
        timer = NSTimer.scheduledTimerWithTimeInterval(delay, target: self, selector: Selector("parametersLinker:"), userInfo: ["title":alertTitle, "message": alertMessage, "controller": controller], repeats: false)
    }
    
    func stopTimer() {
        timer.invalidate()
    }
    
    func dismissAlert(controller: UIViewController) {
        controller.presentedViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
}