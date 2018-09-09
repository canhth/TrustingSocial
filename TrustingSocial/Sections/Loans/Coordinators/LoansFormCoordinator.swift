//
//  LoansFormCoordinator.swift
//  TrustingSocial
//
//  Created by Canh Tran on 9/8/18.
//  Copyright © 2018 Canh Tran. All rights reserved.
//

import UIKit

final class LoansFormCoordinator: Coordinator {
    
    init(window: UIWindow)
    {
        self.window = window
    }
    
    var window: UIWindow
    
    func startToLoadView()
    {
        if let viewController: LoansFormViewController = UIStoryboard.createViewController(storyBoard: StoryBoardName.loan),
            let navigationVC = window.rootViewController as? UINavigationController {
//            viewController.offersViewModel.offerSelection = { [weak self] (offer) in
//
//            }
            viewController.title = "Form Đăng Ký"
            navigationVC.pushViewController(viewController, animated: true)
        }
    } 
}
