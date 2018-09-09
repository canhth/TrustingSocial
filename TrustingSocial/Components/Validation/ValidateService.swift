//
//  ValidateService.swift
//  TrustingSocial
//
//  Created by Canh Tran on 9/8/18.
//  Copyright © 2018 Canh Tran. All rights reserved.
//

import Foundation

class DefaultValidationService: ValidationService {
    
    static let sharedValidationService = DefaultValidationService()
    
    func validateEmail(_ email: String) -> ValidationResult {
        if email.isEmpty {
            return .empty(message: "This field is required")
        }
        if !email.isEmail() {
            return .failed(message: "Please enter correct email format")
        }
        if email != "takehome@2359media.com" {
            return .failed(message: "Email does not exist")
        }
        return .ok
    }
    
    
    func validatePassword(_ password: String) -> ValidationResult {
        if password.isEmpty {
            return .empty(message: "This field is required")
        }
        
        // Has at least 1 uppercase, 1 lowercase, 1 number and 1 special character
        if !password.validatePassword() {
            return .failed(message: "Your password is not well formed")
        }
        
        if password != "1Faraday@" {
            return .failed(message: "Password does not match")
        }
        
        return .ok
    }
    
}
