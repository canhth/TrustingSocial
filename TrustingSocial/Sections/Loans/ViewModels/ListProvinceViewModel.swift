//
//  ListProvinceViewModel.swift
//  TrustingSocial
//
//  Created by Canh Tran on 9/8/18.
//  Copyright © 2018 Canh Tran. All rights reserved.
//

import UIKit

// Consider to move to common compoment ground for reuseable
final class ListProvinceViewModel: ListProvinceViewModelDataSource {
    
    // MARK: Properties
    private let service: GetProvincesServiceProtocol
    let listProvince: Observable<Province> = Observable()
    
    var provinceSelection: ((_ province: String?) -> ())?
    
    // Conform protocol
    
    var numberOfItems: Int {
        return listProvince.value?.provincesList.count ?? 0
    }
    
    func itemAtIndex(_ index: Int) -> String? {
        return listProvince.value?.provincesList[index] ?? ""
    }
    
    /// Default initialize of ListProvinceViewModel
    ///
    /// - Parameter service: GetProvincesServiceProtocol
    init(service: GetProvincesServiceProtocol) {
        self.service = service
        getListProvinceAvailable()
    }
    
    /// Get the list offer by calling API
    private func getListProvinceAvailable() {
        service.getListProvinces { [weak self] (province, error) in
            if error == nil {
                self?.listProvince.value = province
            }
        }
    }
}
