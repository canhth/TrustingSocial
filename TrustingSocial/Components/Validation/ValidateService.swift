//
//  ValidateService.swift
//  TrustingSocial
//
//  Created by Canh Tran on 9/8/18.
//  Copyright © 2018 Canh Tran. All rights reserved.
//

import Foundation

final class DefaultValidationService: ValidationService {
    static let shared = DefaultValidationService()
    
    private let prefixPhoneNumber = ["0120", "0121", "0122", "0123", "0124", "0125", "0126", "0127", "0128", "0129", "0162", "0163", "0164", "0165", "0166", "0167", "0168", "0169", "0186", "0188", "0199", "086", "088", "089", "090", "091", "092", "093", "094", "095", "096", "097", "098", "099"]
    
    private let requiredMessage = "Thông tin bắt buộc phải nhập"
    
    /// The common func to validate phone number in Vietnam
    /// The first 3-4 prefix must be the same as component inside the 'prefixPhoneNumber'
    ///
    /// - Parameter string: phone number
    /// - Returns: validation result
    func validatePhoneNumber(_ phoneNumber: String) -> ValidationResult {
        if phoneNumber.isEmpty {
            return .empty(message: requiredMessage)
        }
        
        // For 11 digits --> For sure that contains the prefix '01'
        if phoneNumber.prefix(2).contains("01") {
            if prefixPhoneNumber.contains(String(phoneNumber.prefix(4))) && phoneNumber.count == 11 {
                return .ok
            }
        } else {
            // For 10 digits
            if prefixPhoneNumber.contains(String(phoneNumber.prefix(3))) && phoneNumber.count == 10 {
                return .ok
            }
        }
        return .failed(message: "Bạn vui lòng nhập đúng số điện thoại")
    }
    
    /// The common func to validate Vietnam id length from 9 to 12
    ///
    /// - Parameter string: Vietnam id
    /// - Returns: validation result
    func validateVietnamId(_ id: String) -> ValidationResult {
        if id.isEmpty {
            return .ok
        }
        
        if id.count >= 9 && id.count <= 12 {
            return .ok
        }
        return .failed(message: "CMND chỉ được phép từ 9-12 chữ số")
    }
    
    /// The common func to validate income input more than 3 milion VND
    ///
    /// - Parameter string: string input
    /// - Returns: validation result
    func validateUserIncome(_ income: String) -> ValidationResult {
        if income.isEmpty {
            return .empty(message: requiredMessage)
        }
        
        guard let incomeNumber = Int(income) else { return .failed(message: "Lỗi") }
        if incomeNumber < 3000000 {
            return .failed(message: "Thu nhập của bạn phải lớn hơn 3 triệu")
        }
        return .ok
    }
    
    /// The common func to validate field required non-empty
    ///
    /// - Parameter string: string input
    /// - Returns: validation result
    func validateEmptyString(_ string: String) -> ValidationResult {
        if string.isEmpty {
            return .empty(message: requiredMessage)
        }
        return .ok
    }
    
}
