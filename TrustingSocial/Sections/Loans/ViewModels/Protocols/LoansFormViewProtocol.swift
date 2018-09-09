//
//  LoansFormViewProtocol.swift
//  TrustingSocial
//
//  Created by Canh Tran Wizeline on 9/9/18.
//  Copyright © 2018 Canh Tran. All rights reserved.
//

import Foundation

/// The main offer protocol that presents Loan form functionalities
protocol LoansFormViewModelDataSource
{    
    func validateUserInputAndCreateParameter()
    func submitRegisterLoanForm(params: LoanFormParameter)
}
