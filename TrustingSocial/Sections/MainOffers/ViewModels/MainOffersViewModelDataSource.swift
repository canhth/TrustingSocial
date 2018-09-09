//
//  MainOffersViewModelProtocol.swift
//  TrustingSocial
//
//  Created by Canh Tran Wizeline on 9/9/18.
//  Copyright © 2018 Canh Tran. All rights reserved.
//

import Foundation

protocol MainOffersViewDelegate: class {
    func dataHasChanged(offersDataResutl: MainOfferResponse) 
}

/// The main offer protocol that presents tableView data source
protocol MainOffersViewModelDataSource
{
    var delegate: MainOffersViewDelegate? { get set }
    
    var numberOfItems: Int { get }
    func itemAtIndex(_ index: Int) -> Offer?
}
