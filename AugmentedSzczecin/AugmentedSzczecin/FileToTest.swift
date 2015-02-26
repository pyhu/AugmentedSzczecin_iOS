//
//  Test.swift
//  AugmentedSzczecin
//
//  Created by Tomasz Szulc BLStream on 26/02/15.
//  Copyright (c) 2015 BLStream. All rights reserved.
//

import Foundation

/// Mock this
class APIManager {
    func signIn(username: String!, password: String!) -> (success: Bool, error: Bool) {
        return (success: self.isConnection(), error: !self.isConnection())
    }
    
    func signUp(username: String!, password: String!) -> (success: Bool, error: Bool) {
        return (success: self.isConnection(), error: !self.isConnection())
    }

    func namesOfContacts() -> (names: [String], success: Bool, error: Bool) {
        return (names: [String](), success: self.isConnection(), error: !self.isConnection())
    }
    
    func getMoneyAmmount() -> (amount: Int, success: Bool, error: Bool) {
        return (amount: 0, success: self.isConnection(), error: !self.isConnection())
    }
    
    func getAccountNumber() -> (number: String, success: Bool, error: Bool) {
        return (number: "123234123412341234", success: self.isConnection(), error: !self.isConnection())
    }
    
    func isConnection() -> Bool {
        return false
    }
}

class Helper {
    func concatenate(s1: String?, s2: String?) -> String {
        return (s1 ?? "") + (s2 ?? "")
    }
    
    func numberFromString(s: String) -> Int {
        switch s {
        case "zero": return 0
        case "one": return 1
        case "two": return 2
        case "three": return 3
        default: return 5
        }
    }
    
    func addNumbers(s1: String!, s2: String!) -> Int {
        return self.numberFromString(s1) + self.numberFromString(s2)
    }
    
    func calculate(n1: Float, n2: Float, operation: String!) -> Float {
        switch operation {
        case "+": return n1 + n2
        case "-": return n1 - n2
        case "/": return n1 / n2
        case "*": return n1 * n2
        default: return Float(0)
        }
    }
    
    func numberToString(n: Int) -> String {
        switch n {
        case 1: return "one"
        case 2: return "two"
        case 3: return "three"
        default: return "none"
        }
    }
}