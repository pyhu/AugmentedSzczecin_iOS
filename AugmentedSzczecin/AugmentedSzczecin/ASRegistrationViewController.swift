//
//  ASRegistrationViewController.swift
//  AugmentedSzczecin
//
//  Created by Patronage on 14.03.2015.
//  Copyright (c) 2015 BLStream. All rights reserved.
//

import UIKit

class ASRegistrationViewController: UIViewController {

    
    @IBAction func registerButtonTapped(sender: AnyObject) {
        self.performSegueWithIdentifier("RegisterSegue", sender: nil)
    }
}

