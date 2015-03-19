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
    var subviews: [UIView] = []
    var subviewsAfterSegue: [UIView] = []
    
    override func setUp() {
        super.setUp()
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: NSBundle(forClass: self.dynamicType))
        firstVC = storyboard.instantiateViewControllerWithIdentifier("ASRegistrationViewController") as? ASRegistrationViewController
        firstVC!.loadView()
        subviews = UIApplication.sharedApplication().keyWindow?.subviews as! [UIView]
        firstVC?.performSegueWithIdentifier("RegisterSegue", sender: nil)
        subviewsAfterSegue = UIApplication.sharedApplication().keyWindow?.subviews as! [UIView]

    }
    
    override func tearDown() {
        super.tearDown()
        firstVC = nil
        subviews = []
        subviewsAfterSegue = []
    }

    func testSegueIsChangingFrontView() {
        XCTAssertNotEqual(subviews[0] , subviewsAfterSegue[0], "Segue doesn't change front view")
    }
    
    func testSegueDisplayDiffrentViewThanSourceVCView() {
        XCTAssertNotEqual(subviewsAfterSegue[0], firstVC!.view!, "Segue is still displaying old view")
    }
    
    func testNumberOfViewsInWindow() {
        XCTAssertEqual(subviews.count, 1, "Segue is not removing unuseful views")
    }
    
}
