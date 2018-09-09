//
//  ValidateTextFieldStackView.swift
//  TrustingSocial
//
//  Created by Canh Tran on 9/8/18.
//  Copyright © 2018 Canh Tran. All rights reserved.
//

import UIKit

class ValidateTextFieldStackView: UIStackView {
    
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var inputTextField: UITextField!
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        inputTextField.attributedPlaceholder = NSAttributedString(string: self.inputTextField.placeholder ?? "",
                                                                  attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        // Hide the error message at the first time launch
        setupErrorMessageView(isHidden: true, errorMessage: "", duration: 0)
    }
    
    func setupErrorMessageView(isHidden hidden: Bool, errorMessage: String, duration: Double = 0.3) {
        UIView.animate(withDuration: duration) {
            
            self.errorLabel.text = errorMessage
            
            //The bug is that hiding and showing views in a stack view is cumulative. Weird Apple bug. If you hide a view in a stack view twice, you need to show it twice to get it back. If you show it three times, you need to hide it three times to actually hide it (assuming it was hidden to start).
            if !hidden {
                if self.errorLabel.isHidden == true {
                    self.errorLabel.isHidden = false
                }
            } else {
                if self.errorLabel.isHidden == false {
                    self.errorLabel.isHidden = true
                }
            }
            self.layoutIfNeeded()
        }
    }
}
