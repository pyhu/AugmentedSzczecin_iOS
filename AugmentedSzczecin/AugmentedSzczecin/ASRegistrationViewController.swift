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
    var alert = ASAlertController()
    var success = true;
    
    @IBAction func registerButtonTapped(sender: AnyObject) {
    
        //request to api
        alert.showAlertWithDelay("Loading", alertMessage: "Please wait...", controller: self, delay: 2)
        if(success == true) {
            alert.stopTimer()
            self.performSegueWithIdentifier("RegisterSegue", sender: nil)
        }
        else {
            alert.dismissAlert(self)
            alert.showAlertWithDelay("error", alertMessage: "404notfound", controller: self, delay: 0)
        }
    
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

