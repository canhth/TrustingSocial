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

final class MainOffersViewModel {
    
    private(set) var offersDataResutl: MainOfferResponse = (offers: nil, error: nil)
    private let service: GetOffersService
    
    var dataHasChanged: ((_ offersDataResutl: MainOfferResponse) -> ())?
    var offerSelection: ((_ offer: Offer) -> ())?
    
    /// Default initialize of MainOffersViewModel
    ///
    /// - Parameter service: GetOffersService
    init(service: GetOffersService) {
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
            strongSelf.dataHasChanged?(strongSelf.offersDataResutl)
        }
    }
}
