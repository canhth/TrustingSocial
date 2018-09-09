//
//  Int+Extension.swift
//  TrustingSocial
//
//  Created by Canh Tran on 9/8/18.
//  Copyright © 2018 Canh Tran. All rights reserved.
//

import Foundation

extension Int {
    
    /// Convert Int to VND string
    ///
    /// - Returns: VND currency
    func convertToCurrency() -> String {
        let price = NSNumber(value: self)
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        formatter.locale = Locale(identifier: "vi_VN")
        return formatter.string(from: price) ?? ""
    }
}
