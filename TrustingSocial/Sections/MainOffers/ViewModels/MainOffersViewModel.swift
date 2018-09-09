//
//  MainOffersViewModel.swift
//  TrustingSocial
//
//  Created by Canh Tran on 9/8/18.
//  Copyright © 2018 Canh Tran. All rights reserved.
//

import Foundation
import CT_RESTAPI

typealias MainOfferResponse = (offers: [Offer]?, error: RESTError?)

final class MainOffersViewModel: MainOffersViewModelDataSource {
    
    weak var delegate: MainOffersViewDelegate?
    
    var numberOfItems: Int {
        return offersDataResutl.offers?.count ?? 0
    }
    
    func itemAtIndex(_ index: Int) -> Offer? {
        return offersDataResutl.offers?[index]
    }
    
    private(set) var offersDataResutl: MainOfferResponse = (offers: nil, error: nil)
    private let service: GetOffersServiceProtocol
    
    var offerSelection: ((_ offer: Offer) -> ())?
    
    /// Default initialize of MainOffersViewModel
    ///
    /// - Parameter service: GetOffersService
    init(service: GetOffersServiceProtocol) {
        self.service = service
        getListOfferAvailable()
    }
    
    /// Get the list offer by calling API
    private func getListOfferAvailable() {
        service.getListOffer { [weak self] (offer, error) in
            guard let strongSelf = self else { return }
            if let offer = offer {
                strongSelf.offersDataResutl = ([offer], nil)
            } else {
                strongSelf.offersDataResutl = (nil, nil)
            }
            strongSelf.delegate?.dataHasChanged(offersDataResutl: strongSelf.offersDataResutl)
        }
    }
}
