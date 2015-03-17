//
//  ASRegistrationSegueTests.swift
//  AugmentedSzczecin
//
//  Created by Patronage on 15.03.2015.
//  Copyright (c) 2015 BLStream. All rights reserved.
//

import UIKit
import XCTest

class ASRegistrationSegueTests: XCTestCase {
    var firstVC: ASRegistrationViewController?
    
    override func setUp() {
        super.setUp()
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: NSBundle(forClass: self.dynamicType))
        firstVC = storyboard.instantiateViewControllerWithIdentifier("ASRegistrationViewController") as? ASRegistrationViewController
        firstVC!.loadView()
    }
    
    override func tearDown() {
        super.tearDown()
        firstVC = nil
    }

    func testSegueChangingRootVC() {
        UIApplication.sharedApplication().keyWindow?.rootViewController = firstVC
        firstVC?.performSegueWithIdentifier("RegisterSegue", sender: nil)
        XCTAssertNotEqual(firstVC!, UIApplication.sharedApplication().keyWindow!.rootViewController!, "")
    }
}
