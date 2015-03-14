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
        
        var sourceViewController: UIViewController = self.sourceViewController as! UIViewController
        var destinationViewController: UIViewController = self.destinationViewController as! UIViewController
        
        sourceViewController.view.window!.rootViewController = self.destinationViewController as? UIViewController
    }
}