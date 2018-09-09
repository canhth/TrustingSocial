//
//  LoansFormViewModel.swift
//  TrustingSocial
//
//  Created by Canh Tran on 9/8/18.
//  Copyright © 2018 Canh Tran. All rights reserved.
//

import UIKit 

final class LoansFormViewModel: LoansFormViewModelDataSource { 
    
    
    // MARK: - Properties Observable
    private let service: SubmitLoanServiceProtocol
    private let validationService: ValidationService
    
    let phoneNumber: Observable<String> = Observable()
    let userName: Observable<String> = Observable()
    let vietnamID: Observable<String> = Observable()
    let province: Observable<String> = Observable()
    let income: Observable<String> = Observable()
    
    let phoneNumberValidation: Observable<ValidationResult> = Observable()
    let userNameValidation: Observable<ValidationResult> = Observable()
    let vietnamIDValidation: Observable<ValidationResult> = Observable()
    let provinceValidation: Observable<ValidationResult> = Observable()
    let incomeValidation: Observable<ValidationResult> = Observable()
    
    /// Province selection block
    var provinceSelection: ((_ province: String) -> ())?
    var submitLoanSuccess: ((_ loan: Loan) -> ())?
    
    /// Default initialize of LoansFormViewModel
    ///
    /// - Parameters:
    ///   - service: The Loan service to be used for calling API
    ///   - validationService: validation user input fields
    init(service: SubmitLoanServiceProtocol, validationService: ValidationService) {
        self.service = service
        self.validationService = validationService
    }
    
    func validateUserInputAndCreateParameter() {
        // Validations
        phoneNumberValidation.value = validationService.validatePhoneNumber(phoneNumber.value ?? "")
        userNameValidation.value = validationService.validateEmptyString(userName.value ?? "")
        vietnamIDValidation.value = validationService.validateVietnamId(vietnamID.value ?? "")
        provinceValidation.value = validationService.validateEmptyString(province.value ?? "")
        incomeValidation.value =  validationService.validateUserIncome(income.value ?? "")
        
        // Create the parameter and submit Loan request
        guard phoneNumberValidation.value?.isValid == true &&
            userNameValidation.value?.isValid == true &&
            vietnamIDValidation.value?.isValid == true &&
            provinceValidation.value?.isValid == true &&
            incomeValidation.value?.isValid == true else { return }
        
        guard let phone = phoneNumber.value,
            let name = userName.value,
            let province = province.value,
            let income = income.value, let incomValue = Int(income) else { return }
        
        let loanRequestParameter = LoanFormParameter(phoneNumber: phone,
                                                     fullName: name,
                                                     nationalIDNumber: vietnamID.value ?? "",
                                                     monthlyIncome: incomValue,
                                                     province: province)
        submitRegisterLoanForm(params: loanRequestParameter)
    }
    
    func submitRegisterLoanForm(params: LoanFormParameter) {
        service.submitRegisterLoanForm(parameter: params) { [weak self] (loan, error) in
            if let loan = loan {
                self?.submitLoanSuccess?(loan)
            }
        }
    }
}
