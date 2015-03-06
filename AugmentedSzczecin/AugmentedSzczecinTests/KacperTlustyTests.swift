//
//  KacperTlustyTets.swift
//  AugmentedSzczecin
//
//  Created by Patronage on 03.03.2015.
//  Copyright (c) 2015 BLStream. All rights reserved.
//

import UIKit
import XCTest

class KacperTlustyTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    var halper = Helper()
    func testHelperConcatenateTwoStrings() {
        XCTAssertEqual(halper.concatenate("a", s2: "b"), "ab", "")
    }
    
    func testHelperConcatenateStringAndNil() {
        XCTAssertEqual(halper.concatenate("a", s2: nil), "a", "")
    }
    
    func testHelperConcatenateEmptyStringObjectAndString() {
        XCTAssertEqual(halper.concatenate(String(), s2: "b"), "b", "")
    }
    
    
    //I'm not sending bool as parameter into method becouse that wouldn't be override,
    //so signIn() method would still invoke isConnection without parametres
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
    
    func testLogInSuccessFieldWithConnectionSuccess() {
        XCTAssertEqual(testAPIManager.signIn("Kacper", password: "qwerty123").success, true, "")
    }
    
    func testLogInErrorFieldWithConnectionSuccess() {
        XCTAssertEqual(testAPIManager.signIn("Kacper", password: "qwerty123").error, false, "")
    }
    
    func testLogInSuccessFieldWithConnectionFail() {
        testAPIManager.isConnected = false;
        XCTAssertEqual(testAPIManager.signIn("Kacper", password: "qwerty123").success, false, "")
    }
    
    func testLogInErrorFieldWithConnectionFail() {
        testAPIManager.isConnected = false;
        XCTAssertEqual(testAPIManager.signIn("Kacper", password: "qwerty123").error, true, "")
    }
    
}
