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

            viewController.viewModel = LoansFormViewModel(service: LoansService(), validationService: DefaultValidationService())
            
            viewController.viewModel?.provinceSelection = { (province) in
                self.loadProvince(completion: { (province) in
                    viewController.viewModel?.province.value = province
                })
            }
            
            viewController.viewModel?.submitLoanSuccess = { (loan) in
                viewController.navigationController?.popToRootViewController(animated: true)
                Helper.showAlertViewWith(message: "Đăng ký vay của bạn thành công \n\n \(loan)")
            }
            
            viewController.title = "Form Đăng Ký"
            navigationVC.pushViewController(viewController, animated: true)
        }
    }
    
    private func loadProvince(completion: @escaping (_ province: String?) -> ()) {
        let provinceCoordinator = ProvincesCoordinator(window: window)
        provinceCoordinator.startToLoadView()
        provinceCoordinator.didFinishSelectingProvince = { (province) in
            completion(province)
        }
    }
}
