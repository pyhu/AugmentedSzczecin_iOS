//
//  ASRestUtil.swift
//  AugmentedSzczecin
//
//  Created by Tomasz Bilski on 02.04.2015.
//  Copyright (c) 2015 BLStream. All rights reserved.
//

import Foundation
import UIKit
import CoreData

typealias JSONDictionary = Dictionary<String, AnyObject>
typealias JSONArray = Array<AnyObject>

class ASRestUtil {
    
    //private let ascm: ASCredentialManager = ASCredentialManager.sharedInstace()
    
    typealias APICallbackSuccess = (AnyObject? -> Void)
    typealias APICallbackFailure = ((Int?, String) -> Void)
    
    var path: Path! = nil
    var callbackSuccess: APICallbackSuccess! = nil
    var callbackFailure: APICallbackFailure! = nil
    
    enum Path {
        
        static let baseURLString = "http://private-6c77f-patronage2015.apiary-mock.com/"
        
        case SIGNING_UP(String, String)
        case LOGGING_IN(String, String) //zmienic; dla logowania!
        
        var URLRequest: NSMutableURLRequest {
            get{
                switch self {
                case .SIGNING_UP (let email, let password):
                    
                    let (endPoint, params) = ASRestUtil.paramsForSigningUp(email, password: password)
                    var err: NSError?
                    
                    let request = NSMutableURLRequest(URL: NSURL(fileURLWithPath: Path.baseURLString + endPoint)!)
                    request.HTTPMethod = "POST"
                    request.HTTPBody = NSJSONSerialization.dataWithJSONObject(params, options: nil, error: &err)
                    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                    
                    return request
                    
                    
                    
                case .LOGGING_IN (let email, let password): //TO-DO zmienic; implementacja dla logowania
                    
                    
                    let (endPoint, params) = ASRestUtil.paramsForSigningUp(email, password: password)
                    var err: NSError?
                    
                    let request = NSMutableURLRequest(URL: NSURL(fileURLWithPath: Path.baseURLString + endPoint)!)
                    request.HTTPMethod = "POST"
                    request.HTTPBody = NSJSONSerialization.dataWithJSONObject(params, options: nil, error: &err)
                    
                    return request
                    
                
                    
                    
                }
               
              
            }
            
            
        }
    
    }
    
    
    func signUp(email: String, password: String, callbackSuccess: APICallbackSuccess, callbackFailure: APICallbackFailure) {
        
        makeHTTPRequest(Path.SIGNING_UP(email, password), callbackSuccess: callbackSuccess, callbackFailure: callbackFailure)
        
        

        
        
    }
    
    
    class func paramsForSigningUp(email: String, password: String) -> (endPoint: String, parameters: Dictionary<String, String>) {
        
        let endPoint = "user"
        let parameters = ["email":email, "password":password]
        
        return (endPoint, parameters)
        
    }
    
    func makeHTTPRequest(path: Path, callbackSuccess: APICallbackSuccess, callbackFailure: APICallbackFailure) {
        
        self.path = path
        self.callbackSuccess = callbackSuccess
        self.callbackFailure = callbackFailure
        
        var session = NSURLSession.sharedSession()
        
        var task = session.dataTaskWithRequest(path.URLRequest, completionHandler: {data, response, error -> Void in
            
            var strData = NSString(data: data, encoding: NSUTF8StringEncoding)
            var err: NSError?
            var json = NSJSONSerialization.JSONObjectWithData(data, options: .MutableLeaves, error: &err) as? NSDictionary
            
            if(err != nil) {
                println(err!.localizedDescription) //wyswietl blad na konsoli
                let jsonStr = NSString(data: data, encoding: NSUTF8StringEncoding)
                callbackFailure(nil, "Could not parse JSON")
                
            }
            else {
                
                
                
                if let parseJSON = json { //switch po enum path i wywolanie roznych metod do parsowania
                    
                    
                    
                }
            }
            
            
            
        })
        
        task.resume()
        
        
        
        
    }
    
    func handleSignUp(json: AnyObject) -> ASUser? {
       
        if let resultObj = json as? JSONDictionary {
            if let userObj: AnyObject = resultObj["user"] {
                if let userJson = userObj as? JSONDictionary {
                    if let user = ASRestUtil.createUserFromJson(userJson) {
                        return user
                        
                    }
                }
            }
        }
        return nil
        
        
        
    }
    
    class func createUserFromJson(userJson: Dictionary<String, AnyObject>) -> ASUser! {
        
        var appDelegate: AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        var context: NSManagedObjectContext = appDelegate.managedObjectContext!
        let entityDescription = NSEntityDescription.entityForName("User", inManagedObjectContext: context)!
        
        let user = ASUser(entity: entityDescription, insertIntoManagedObjectContext: context)
        

        
        if let id = userJson["id"] as? Int {
            if let email = userJson["email"] as? String {
                if let password = userJson["password"] as? String {
                    
                    
                    

                    
                    return user 
                
                }
            }
        }
        return nil

    }
}