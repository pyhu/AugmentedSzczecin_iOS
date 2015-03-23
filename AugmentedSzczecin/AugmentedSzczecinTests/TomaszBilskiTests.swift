////  TomaszBilskiTests.swift
////  AugmentedSzczecinTests
////
////  Created by Tomasz Bilski on 10/03/15.
////  Copyright (c) 2015 BLStream. All rights reserved.
////

import UIKit
import XCTest

class TomaszBilskiTests: XCTestCase {
    
    var helper: Helper?
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        helper = Helper()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }
    
    func testConcatenate() {
        XCTAssertEqual(helper!.concatenate("x", s2: "y"), "xy", "")
    }
    
    
    class APIManagerMock: APIManager {
        
        internal var isConnected: Bool
        
        init(isConnected: Bool!) {
            self.isConnected = isConnected
        }
        
        internal override func isConnection() -> Bool {
            return isConnected
        }
        
    }
    
    
    func testSignInMock() {
        
        var apiManagerMock = APIManagerMock(isConnected: true)
        
        XCTAssertEqual(apiManagerMock.signIn("abcd", password: "abcd").success, true)
        
        
    }
    
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
}