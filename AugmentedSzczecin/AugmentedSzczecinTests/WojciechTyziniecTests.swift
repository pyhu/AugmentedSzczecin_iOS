//
//  WojciechTyziniecTests.swift
//  AugmentedSzczecin
//
//  Created by Wojciech Tyziniec on 09/03/15.
//  Copyright (c) 2015 BLStream. All rights reserved.
//

import UIKit
import XCTest

class WojciechTyziniecTests: XCTestCase{
    
    override func setUp(){
        super.setUp()
    }
    
    override func tearDown(){
        super.tearDown()
    }
    
    class mockAPIManager: APIManager {
        
        init(isConnected: Bool!) {
            self.isConnected = isConnected
        }
        
        internal var isConnected: Bool
        
        internal override func isConnection() -> Bool {
            return isConnected
        }
    }
    
    let testAPIManager = mockAPIManager(isConnected: true)
    
    func testSignUpConnectedWithCorrectFields(){
        XCTAssertEqual(testAPIManager.signUp("wtznc", password: "qwerty123").success, true)
    }
    
    func testSignUpConnectedWithIncorrectFields(){
        XCTAssertEqual(testAPIManager.signUp("wtznc", password: "").error, false, "")
    }
    
    func testSignUpDisconnectedWithCorrectFields(){
        testAPIManager.isConnected = false;
        XCTAssertEqual(testAPIManager.signUp("wtznc", password: "qwerty123").success, false)
    }
    
    func testSignUpDisconnectedWithIncorrectFields(){
        testAPIManager.isConnected = false;
        XCTAssertEqual(testAPIManager.signUp("wtznc", password: "").error, true)
    }

    
    var helper = Helper()
    
    func testNumberFromStringCaseZero(){
        XCTAssertEqual(helper.numberFromString("zero"), 0)
    }
    
    func testNumberFromStringCaseOne(){
        XCTAssertEqual(helper.numberFromString("one"), 1)
    }
    
    func testNumberFromStringCaseTwo(){
        XCTAssertEqual(helper.numberFromString("two"), 2)
    }
    
    func testNumberFromStringCaseThree(){
        XCTAssertEqual(helper.numberFromString("three"), 3)
    }
    
    func testNumberFromStringDefault(){
        XCTAssertEqual(helper.numberFromString(""), 5)
    }
}