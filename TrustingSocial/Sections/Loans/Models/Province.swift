//
//  Province.swift
//  TrustingSocial
//
//  Created by Canh Tran on 9/8/18.
//  Copyright © 2018 Canh Tran. All rights reserved.
//

import Foundation

struct Province: Codable {
    let total: Int
    let provincesList: [String]
    
    enum CodingKeys: String, CodingKey {
        case total
        case provincesList = "provinces_list"
    }
}
