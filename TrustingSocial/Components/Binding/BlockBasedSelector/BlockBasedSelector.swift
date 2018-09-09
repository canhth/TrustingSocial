//  BlockBasedSelector.swift
//  TrustingSocial
//
//  Created by Canh Tran Wizeline on 9/9/18.
//  Copyright © 2018 Canh Tran. All rights reserved.
//
import Foundation
import UIKit

func Selector(_ block: @escaping () -> Void) -> Selector {
    let selector = NSSelectorFromString("\(CACurrentMediaTime())")
    class_addMethodWithBlock(_Selector.self, selector) { (_) in block() }
    return selector
}

let Selector = _Selector.shared
@objc class _Selector: NSObject {
    static let shared = _Selector()
}
