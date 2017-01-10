//
//  AuthHandler.swift
//  Auth0 Dummy
//
//  Created by David Bielik on 10/01/2017.
//  Copyright © 2017 David Bielik. All rights reserved.
//

import Foundation
import Auth0


class AuthHandler {
    static let sharedInstance = AuthHandler()
    
    func login(username: String, password: String) {
        Auth0.authentication().login(usernameOrEmail: username, password: password, multifactorCode: nil, connection: AuthCon.Connection, scope: "", parameters: [:]).start {
            result in
            switch result {
            case .success(let credentials):
                // login
                NSLog("login success")
                break
            case .failure(let error):
                // fail
                NSLog("login failure")
                break
            }
        }
    }
    
    func signup(email: String, username: String?, password: String, success: ((Credentials) -> ())?, failure: ((Error) -> ())?, onExit: (() -> ())?)  {
        // userMetadata: ["name": "xD", ...]
        Auth0.authentication().signUp(email: email, username: username, password: password, connection: AuthCon.Connection, userMetadata: [:], scope: "", parameters: [:]).start {
            result in
                switch result {
                case .success(let credentials):
                    // register
                    NSLog("reg")
                    success?(credentials)
                case .failure(let error):
                    NSLog("err")
                    failure?(error)
                }
                onExit?()
            }
        
    }
}
