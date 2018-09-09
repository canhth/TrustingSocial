//
//  TrustingSocialCoordinator.swift
//  TrustingSocial
//
//  Created by Canh Tran on 9/8/18.
//  Copyright © 2018 Canh Tran. All rights reserved.
//

import UIKit

class TrustingSocialCoordinator : Coordinator {
    
    private var window: UIWindow
    private let noNeedToLogin: Bool = true
    
    init(window: UIWindow) {
        
        self.window = window
    }
    
    func startToLoadView() {
        if noNeedToLogin {
            showBaseHomeOffersView()
        } else {
            // Show login page if needed
        }
        
    }
}

extension TrustingSocialCoordinator {
    
    private func showBaseHomeOffersView() {
        let homePageCoordinator = MainOfferCoordinator(window: window)
        homePageCoordinator.startToLoadView()
    }
}
