//
//  Helper.swift
//  CanhTran
//
//  Created by Canh Tran on 2/27/18.
//  Copyright © 2018 Tran Hoang Canh. All rights reserved.
//

import UIKit
import CT_RESTAPI
import KeychainAccess

class Helper {
    
    private static let keyChainService = "com.example.trustingsocial-token"
    
    static func getDataFromJSONFile(fileName: String, key: String) -> Data? {
        if let path = Bundle.main.path(forResource: fileName, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                return try JSONSerialization.data(withJSONObject: jsonResult, options: []) 
            } catch {
                // handle error here
            }
        }
        return nil
    }
    
    static func saveFakeToken(tokenString: String) {
        let keychain = Keychain(service: keyChainService)
        keychain["userToken"] = tokenString
    }
    
    static func getFakeToken() -> Bool {
        let keychain = Keychain(service: keyChainService)
        if let token = keychain["userToken"] {
            return token.count > 0
        }
        return false
    }
    
    static func showAlertViewWith(error: CTNetworkErrorType) {
        if let viewController = UIApplication.topViewController() {
            let title = "Error \(error.errorCode)"
            var message = ""
            switch error {
            case let .errorMessage(_, _, errorMessage):
                message = errorMessage
                break
            default:
                break
            }
            
            let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            viewController.present(alert, animated: true, completion: nil)
        }
    }
    
    static func showAlertViewWith(message: String) {
        if let viewController = UIApplication.topViewController() {
            let title = "Error"

            let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            viewController.present(alert, animated: true, completion: nil)
        }
    } 
}
