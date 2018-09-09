//
//  Offer.swift
//  TrustingSocial
//
//  Created by Canh Tran on 9/8/18.
//  Copyright © 2018 Canh Tran. All rights reserved.
//

import Foundation

struct Offer: Codable {
    let minAmount, maxAmount, minTenor, maxTenor: Int
    let interestRate: Double
    let bank: Bank
    
    enum CodingKeys: String, CodingKey {
        case minAmount = "min_amount"
        case maxAmount = "max_amount"
        case minTenor = "min_tenor"
        case maxTenor = "max_tenor"
        case interestRate = "interest_rate"
        case bank
    }
}

