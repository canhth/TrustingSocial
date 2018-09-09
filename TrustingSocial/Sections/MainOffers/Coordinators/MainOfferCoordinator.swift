//
//  MainOfferCoordinator.swift
//  TrustingSocial
//
//  Created by Canh Tran on 9/8/18.
//  Copyright © 2018 Canh Tran. All rights reserved.
//

import UIKit

final class MainOfferCoordinator: Coordinator {
    
    init(window: UIWindow)
    {
        self.window = window
    }
    
    var window: UIWindow
    
    func startToLoadView()
    {
        if let viewController: MainOffersViewController = UIStoryboard.createViewController(storyBoard: StoryBoardName.main) {
            viewController.offersViewModel = MainOffersViewModel(service: GetOffersService())
            viewController.offersViewModel?.delegate = viewController
            viewController.offersViewModel?.offerSelection = { (offer) in
                self.showRegisterLoanForm()
            }
            
            let navigationController = UINavigationController(rootViewController: viewController) 
            window.rootViewController = navigationController
        }
    }
    
    private func showRegisterLoanForm() {
        let loansFormCoordinator = LoansFormCoordinator(window: window)
        loansFormCoordinator.startToLoadView()
    }
}
