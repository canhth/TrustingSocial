//
//  ProvinceService.swift
//  TrustingSocial
//
//  Created by Canh Tran Wizeline on 9/9/18.
//  Copyright © 2018 Canh Tran. All rights reserved.
//

import UIKit
import CT_RESTAPI

typealias GetProvincesServiceCompletionHandler = (_ result: Province, _ error: RESTError?) -> Void

protocol GetProvincesServiceProtocol {
    func getListProvinces(completion: @escaping GetProvincesServiceCompletionHandler)
}

final class GetProvincesService: GetProvincesServiceProtocol {
    
    /// Get the list profinces
    ///
    /// - Parameters:
    ///   - completion: Results and error of API
    /// - Returns: <Province>
    func getListProvinces(completion: @escaping GetProvincesServiceCompletionHandler) {
        
        let apiManager = RESTApiClient(subPath: "", functionName: "", method: .GET, endcoding: .URL)
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        apiManager.baseRequest { (results, error) in
            if let jsonData = Helper.getDataFromJSONFile(fileName: "provinces", key: "") {
                do {
                    let results: Province = try JSONDecoder().decode(Province.self, from: jsonData)
                    completion(results, nil)
                } catch {
                    print("Error when parsing JSON: \(error)")
                }
            }
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
    }
}
