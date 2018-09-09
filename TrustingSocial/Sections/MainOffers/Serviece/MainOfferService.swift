//
//  MainOfferServiece.swift
//  TrustingSocial
//
//  Created by Canh Tran on 9/8/18.
//  Copyright © 2018 Canh Tran. All rights reserved.
//

import UIKit
import CT_RESTAPI

typealias GetOffersServiceCompletionHandler = (_ results: Offer?, _ error: RESTError?) -> Void

protocol GetOffersServiceProtocol {
    func getListOffer(completion: @escaping GetOffersServiceCompletionHandler)
}

final class GetOffersService: GetOffersServiceProtocol {
    
    /// Get the list offers
    ///
    /// - Parameters:
    ///   - completion: Results and error of API
    /// - Returns: <Offer>
    func getListOffer(completion: @escaping GetOffersServiceCompletionHandler) {
        
        let apiManager = RESTApiClient(subPath: "", functionName: "", method: .GET, endcoding: .URL)
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        apiManager.baseRequest { (results, error) in
            if let jsonData = Helper.getDataFromJSONFile(fileName: "offer", key: "") {
                do {
                    let results: Offer = try JSONDecoder().decode(Offer.self, from: jsonData)
                    completion(results, nil)
                } catch {
                    print("Error when parsing JSON: \(error)")
                }
            }
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
    }
    
    
}
