//
//  ListProvinceViewModelDataSource.swift
//  TrustingSocial
//
//  Created by Canh Tran Wizeline on 9/9/18.
//  Copyright © 2018 Canh Tran. All rights reserved.
//

import Foundation

/// The protocol that represents List province data source
protocol ListProvinceViewModelDataSource
{
    var numberOfItems: Int { get }
    func itemAtIndex(_ index: Int) -> String?
}
