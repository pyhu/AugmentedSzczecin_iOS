//
//  ASRegistrationViewController.swift
//  AugmentedSzczecin
//
//  Created by Patronage on 14.03.2015.
//  Copyright (c) 2015 BLStream. All rights reserved.
//

import UIKit

class ASRegistrationViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    

    @IBAction func registerButtonTapped(sender: AnyObject) {
        var alert = ASAlertController()
        alert.showAlertWithDelay("Rejestruję...", alertMessage: "Proszę czekać...", viewController: self, delay: 2.0)
        self.performSegueWithIdentifier("RegisterSegue", sender: nil)
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
}

