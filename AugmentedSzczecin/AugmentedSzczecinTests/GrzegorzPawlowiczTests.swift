//
//  GrzegorzPawlowiczTests.swift
//  AugmentedSzczecin
//
//  Created by Grzegorz Pawlowicz on 25.03.2015.
//  Copyright (c) 2015 BLStream. All rights reserved.
//

import UIKit
import XCTest

class GrzegorzPawlowiczTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    var helper = Helper()
    func testHelperDivideTwoValues() {
        XCTAssertEqual(helper.calculate(20, n2: 4, operation: "/"), 5, "");
    }
    func testHelperSumTwoValues() {
        XCTAssertEqual(helper.calculate(2, n2: 2, operation: "+"), 4, "");
    }
    func testHelperSubtractTwoValues() {
        XCTAssertEqual(helper.calculate(3, n2: 2, operation: "-"), 1, "");
    }
    func testHelperMultiplicationTwoValues() {
        XCTAssertEqual(helper.calculate(4, n2: 3, operation: "*"), 12, "");
    }
    func testHelperNotAllowedValue() {
        XCTAssertEqual(helper.calculate(2, n2: 3, operation: "Dd"), 0, "");
    }
    
    class mockApiManager: APIManager {
        init(isConnected: Bool!) {
            self.isConnected = isConnected
        }
        
        internal var isConnected: Bool
        
        internal override func isConnection() -> Bool {
            return isConnected
        }
    }
    
    let testAPIManager = mockApiManager(isConnected: true)
    
    func testGetMoneyAmountConnectionSuccess() {
        XCTAssertEqual(testAPIManager.getMoneyAmmount().success, true, "");
    }
    func testGetMoneyAmountIsZero() {
        XCTAssertEqual(testAPIManager.getMoneyAmmount().amount, 0, "");
    }
    func testGetMoneyAmountConnectionFail() {
        testAPIManager.isConnected = false;
        XCTAssertEqual(testAPIManager.getMoneyAmmount().error, true, "");
    }
    func testGetMoneyAmountConnectionSuccessWithFail() {
        testAPIManager.isConnected = false;
        XCTAssertEqual(testAPIManager.getMoneyAmmount().success, false, "");
    }
}
