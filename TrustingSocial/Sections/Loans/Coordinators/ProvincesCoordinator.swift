//
//  ProvincesCoordinator.swift
//  TrustingSocial
//
//  Created by Canh Tran Wizeline on 9/9/18.
//  Copyright © 2018 Canh Tran. All rights reserved.
//

import UIKit

final class ProvincesCoordinator: Coordinator {
    
    init(window: UIWindow)
    {
        self.window = window
    }
    
    var window: UIWindow
    
    var didFinishSelectingProvince: ((_ province: String?) -> ())?
    
    func startToLoadView()
    {
        if let viewController: ListProvinceViewController = UIStoryboard.createViewController(storyBoard: StoryBoardName.loan),
            let navigationVC = window.rootViewController as? UINavigationController {
            
            viewController.viewModel = ListProvinceViewModel(service: GetProvincesService())
            viewController.viewModel?.provinceSelection = { (province) in
                self.didFinishSelectingProvince?(province)
                viewController.dismiss(animated: true, completion: nil)
            }
            viewController.title = "Chọn tỉnh thành"
            navigationVC.present(UINavigationController(rootViewController: viewController), animated: true, completion: nil)
        }
    }
}
