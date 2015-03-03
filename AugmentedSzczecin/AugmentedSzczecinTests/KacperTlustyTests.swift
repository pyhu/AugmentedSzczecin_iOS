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
    
    func testExample() {
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }
    
    func testHelperConcatenate() {
        var halper = Helper()
        XCTAssertEqual(halper.concatenate("a", s2: "b"), "ab", "")
        XCTAssertEqual(halper.concatenate("a", s2: nil), "a", "")
        XCTAssertEqual(halper.concatenate(String(), s2: "b"), "b", "")
    }
    
    func testMockLogIn(){
        class mockTrueAPIManager: APIManager {
            private override func isConnection() -> Bool {
                return true
            }
        }
        
        let testTrueAPIManager = mockTrueAPIManager()
        XCTAssertEqual(testTrueAPIManager.signIn("Kacper", password: "qwerty123").success, true, "")
        XCTAssertEqual(testTrueAPIManager.signIn("Kacper", password: "qwerty123").error, false, "")
        
        class mockFalseApiManager: APIManager {
            private override func isConnection() -> Bool {
                return false;
            }
        }
        
        let testFalseApiManager = mockFalseApiManager()
        XCTAssertEqual(testFalseApiManager.signIn("Kacper", password: "qwerty123").success, false, "")
        XCTAssertEqual(testFalseApiManager.signIn("Kacper", password: "qwerty123").error, true, "")
        
        
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
