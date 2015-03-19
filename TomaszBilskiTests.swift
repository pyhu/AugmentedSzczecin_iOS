////  AugmentedSzczecinTests.swift
////  AugmentedSzczecinTests
////
////  Created by Tomasz Bilski on 10/03/15.
////  Copyright (c) 2015 BLStream. All rights reserved.
////

import UIKit
import XCTest

class AugmentedSzczecinTests: XCTestCase {
    
    var apiManager: APIManager?
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        apiManager = APIManager()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }
    
    func testSignIn() {
        
        var isSignedIn = apiManager?.signIn("ss",password: "s" ).success
        XCTAssert(isSignedIn!, "All went right. You are signed in")
        
    }
    
    func testSignInMock() {
        
        class APIManagerMock: APIManager {
            
            private override func isConnection() -> Bool {
                
                return true
            }
            
        }
        
        var apiManagerMock = APIManagerMock()
        
        XCTAssert(apiManagerMock.signIn("abcd", password: "abcd").success, "All went right. You are signed in")
        
        
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
}