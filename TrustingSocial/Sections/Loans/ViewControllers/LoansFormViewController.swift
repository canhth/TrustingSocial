//
//  LoansFormViewController.swift
//  TrustingSocial
//
//  Created by Canh Tran on 9/8/18.
//  Copyright © 2018 Canh Tran. All rights reserved.
//

import UIKit

class LoansFormViewController: UIViewController {

    // MARK: IBOutlets & Variables
    @IBOutlet weak var phoneNumberInputStackView: ValidateTextFieldStackView!
    @IBOutlet weak var userNameInputStackView: ValidateTextFieldStackView!
    @IBOutlet weak var vietnamIDInputStackView: ValidateTextFieldStackView!
    @IBOutlet weak var provinceInputStackView: ValidateTextFieldStackView!
    @IBOutlet weak var userIncomeInputStackView: ValidateTextFieldStackView!
    @IBOutlet weak var submitButton: UIButton!
    
    var viewModel: LoansFormViewModel?
    
    // MARK: --
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewModel()
    }
    
    private func setupViewModel() {
        guard let viewModel = viewModel else { return }
        
        phoneNumberInputStackView.inputTextField.bind(with: viewModel.phoneNumber)
        userNameInputStackView.inputTextField.bind(with: viewModel.userName)
        vietnamIDInputStackView.inputTextField.bind(with: viewModel.vietnamID)
        provinceInputStackView.inputTextField.bind(with: viewModel.province)
        userIncomeInputStackView.inputTextField.bind(with: viewModel.income)
        
        
        provinceInputStackView.observe(for: viewModel.province) { [weak self] (value) in
            self?.provinceInputStackView.inputTextField.text = value
        }
        
        // Validate phone number
        phoneNumberInputStackView.observe(for: viewModel.phoneNumberValidation) { [weak self] (value) in
            self?.phoneNumberInputStackView.setupErrorMessageView(isHidden: value.isValid, errorMessage: value.description)
        }
        
        // Validate user name
        userNameInputStackView.observe(for: viewModel.userNameValidation) { [weak self] (value) in
            self?.userNameInputStackView.setupErrorMessageView(isHidden: value.isValid, errorMessage: value.description)
        }
        
        // Validate Vietnam id
        vietnamIDInputStackView.observe(for: viewModel.vietnamIDValidation) { [weak self] (value) in
            self?.vietnamIDInputStackView.setupErrorMessageView(isHidden: value.isValid, errorMessage: value.description)
        }
        
        // Validate province
        provinceInputStackView.observe(for: viewModel.provinceValidation) { [weak self] (value) in
            self?.provinceInputStackView.setupErrorMessageView(isHidden: value.isValid, errorMessage: value.description)
        }
        
        // Validate user incom
        userIncomeInputStackView.observe(for: viewModel.incomeValidation) { [weak self] (value) in
            self?.userIncomeInputStackView.setupErrorMessageView(isHidden: value.isValid, errorMessage: value.description)
        }
    }
    
    // MARK: - Actions
    
    @IBAction func provinceTextFieldTapped(_ sender: Any) {
        viewModel?.provinceSelection?("")
    }
    
    @IBAction func submitButtonTapped(_ sender: Any) {
        viewModel?.validateUserInputAndCreateParameter()
    }
}
