//
//  Loan.swift
//  TrustingSocial
//
//  Created by Canh Tran on 9/8/18.
//  Copyright © 2018 Canh Tran. All rights reserved.
//

import Foundation

struct Loan: Codable {
    let id: Int
    let phoneNumber, fullName, nationalIDNumber: String
    let monthlyIncome: Int
    let province: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case phoneNumber = "phone_number"
        case fullName = "full_name"
        case nationalIDNumber = "national_id_number"
        case monthlyIncome = "monthly_income"
        case province
    }
}


struct LoanFormParameter: Codable {
    let phoneNumber: String
    let fullName: String
    let nationalIDNumber: String
    let monthlyIncome: Int
    let province: String
    
    enum CodingKeys: String, CodingKey {
        case phoneNumber = "phone_number"
        case fullName = "full_name"
        case nationalIDNumber = "national_id_number"
        case monthlyIncome = "monthly_income"
        case province
    }
}
