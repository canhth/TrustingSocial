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
    func validateEmptyString(_ string: String) -> ValidationResult
    func validatePhoneNumber(_ phoneNumber: String) -> ValidationResult
    func validateVietnamId(_ id: String) -> ValidationResult
    func validateUserIncome(_ income: String) -> ValidationResult
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

