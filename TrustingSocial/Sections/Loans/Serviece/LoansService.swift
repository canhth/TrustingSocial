//
//  LoansServiece.swift
//  TrustingSocial
//
//  Created by Canh Tran on 9/8/18.
//  Copyright © 2018 Canh Tran. All rights reserved.
//
 
import UIKit
import CT_RESTAPI

typealias SubmitLoanServiceCompletionHandler = (_ results: Loan?, _ error: RESTError?) -> Void

protocol SubmitLoanServiceProtocol {
    func submitRegisterLoanForm(parameter: LoanFormParameter,completion: @escaping SubmitLoanServiceCompletionHandler)
}

final class LoansService: SubmitLoanServiceProtocol {
    
    /// Submit form register loan
    ///
    /// - Parameters:
    ///   - parameter: user information to register loan
    ///   - completion: loan result
    func submitRegisterLoanForm(parameter: LoanFormParameter,completion: @escaping SubmitLoanServiceCompletionHandler) {
        
        let apiManager = RESTApiClient(subPath: "", functionName: "", method: .GET, endcoding: .URL)
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        apiManager.baseRequest { (results, error) in
            if let jsonData = Helper.getDataFromJSONFile(fileName: "loans", key: "") {
                do {
                    let results: Loan = try JSONDecoder().decode(Loan.self, from: jsonData)
                    completion(results, nil)
                } catch {
                    print("Error when parsing JSON: \(error)")
                }
            }
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
    }
}
