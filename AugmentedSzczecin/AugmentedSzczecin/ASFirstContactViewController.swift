//
//  ASFirstContactViewController.swift
//  AugmentedSzczecin
//
//  Created by Patronage on 14.03.2015.
//  Copyright (c) 2015 BLStream. All rights reserved.
//

import UIKit

class ASFirstContactViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    @IBAction func showLoginViewController(sender: AnyObject) {
        self.performSegueWithIdentifier("ShowLogin", sender: nil)
    }
    @IBAction func showRegistrationViewController(sender: AnyObject) {
        self.performSegueWithIdentifier("ShowRegistration", sender: nil)
    }
    
}
