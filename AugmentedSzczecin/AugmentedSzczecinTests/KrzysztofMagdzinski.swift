//
//  KrzysztofMagdzinski.swift
//  AugmentedSzczecin
//
//  Created by Krzysztof Magdzinski on 15.03.2015.
//  Copyright (c) 2015 BLStream. All rights reserved.
//


import UIKit
import XCTest

class KrzysztofMagdzinskiTests: XCTestCase{
    
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
    
    func testGetAccountNumberConnectedWithCorrectFields(){
        XCTAssertEqual(testAPIManager.getAccountNumber().number, "123234123412341234", "")
    }
    
    func testGetAccountNumberConnectedWithIncorrectFields(){
        XCTAssertEqual(testAPIManager.getAccountNumber().error, false, "")
    }
    
    func testGetAccountNumberDisconnectedWithCorrectFields(){
        testAPIManager.isConnected = false;
        XCTAssertEqual(testAPIManager.getAccountNumber().success, false)
    }
    
    func testGetAccountNumberDisconnectedWithIncorrectFields(){
        testAPIManager.isConnected = false;
        XCTAssertEqual(testAPIManager.getAccountNumber().error, true)
    }
}