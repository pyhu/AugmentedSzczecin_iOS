//
//  ASAlertController.swift
//  AugmentedSzczecin
//
//  Created by Wojciech Tyziniec on 20/03/15.
//  Copyright (c) 2015 BLStream. All rights reserved.
//

import Foundation
import UIKit

class ASAlertController: UIViewController {
    
    func showAlertWithDelay(alertTitle: String, alertMessage: String, viewController: UIViewController, delay: Double){
        var alert: UIAlertView = UIAlertView(title: alertTitle, message: alertMessage, delegate: nil, cancelButtonTitle: "Anuluj")
        var loadingIndicator: UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRectMake(50, 10, 35, 35)) as UIActivityIndicatorView
        loadingIndicator.center = self.view.center
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        
        alert.setValue(loadingIndicator, forKey: "accessoryView")
        loadingIndicator.startAnimating()
        
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))),
            dispatch_get_main_queue(), { alert.show() })
    }
    
}