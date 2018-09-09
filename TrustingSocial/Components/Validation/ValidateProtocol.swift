//
//  ValidateProtocol.swift
//  TrustingSocial
//
//  Created by Canh Tran on 9/8/18.
//  Copyright © 2018 Canh Tran. All rights reserved.
//

import Foundation

enum ValidationResult {
    case ok
    case failed(message: String)
    case empty(message: String)
}

enum SignupState {
    case signedUp(signedUp: Bool)
}

protocol ValidationService {
    func validateEmail(_ email: String) -> ValidationResult
    func validatePassword(_ password: String) -> ValidationResult
}

extension ValidationResult {
    var isValid: Bool {
        switch self {
        case .ok:
            return true
        default:
            return false
        }
    }
}

