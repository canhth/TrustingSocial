//
//  UIApplication+Extension.swift
//  CanhTran
//
//  Created by Canh Tran on 2/27/18.
//  Copyright © 2018 Tran Hoang Canh. All rights reserved.
//

import UIKit

extension UIApplication {
    
    class func topViewController(_ viewController: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = viewController as? UINavigationController {
            return topViewController(nav.visibleViewController)
        }
        if let tab = viewController as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(selected)
            }
        }
        if let presented = viewController?.presentedViewController {
            return topViewController(presented)
        }
        
        return viewController
    }
}

extension UIStoryboard {
    
    /// The class function to load the view controller from storyboard
    ///
    /// - Parameter storyBoard: story board's name string
    /// - Returns: view controller
    static func createViewController<T: UIViewController >(storyBoard: String) -> T? {
        let storyboard = UIStoryboard(name: storyBoard, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: String(describing: T.self)) as? T
    }
}
