//
//  UIRegistrationViewControllerTests.swift
//  AugmentedSzczecin
//
//  Created by Patronage on 15.03.2015.
//  Copyright (c) 2015 BLStream. All rights reserved.
//

import UIKit
import XCTest

class UIRegistrationViewControllerTests: XCTestCase {
    
    var vc: ASRegistrationViewController?
    
    override func setUp() {
        super.setUp()
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: NSBundle(forClass: self.dynamicType))
        vc = storyboard.instantiateViewControllerWithIdentifier("ASRegistrationViewController") as? ASRegistrationViewController
        vc!.loadView()
    }
    
    override func tearDown() {
        super.tearDown()
        vc = nil
    }
    
    func testVC() {
        XCTAssertNotNil(vc!, "View controller is nil")
    }
    
    func testPasswordTextField() {
        XCTAssertNotNil(vc!.passwordTextField, "Password textfield is nil")
    }
    
    func testEmailTextField() {
        XCTAssertNotNil(vc!.emailTextField, "Email textfield is nil")
    }
    
    func testRegisterButton() {
        XCTAssertNotNil(vc!.registerButton, "Register button is nil")
    }
    
    func testRegisterButtonTap() {
        let responders: NSArray = vc!.registerButton.actionsForTarget(vc!, forControlEvent: UIControlEvents.TouchUpInside)!
        XCTAssertTrue(responders.containsObject("registerButtonTapped:"), "Register button has no actions")
    }

}
