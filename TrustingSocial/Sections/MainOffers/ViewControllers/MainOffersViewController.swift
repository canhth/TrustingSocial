//
//  MainOffersViewController.swift
//  TrustingSocial
//
//  Created by Canh Tran on 9/8/18.
//  Copyright © 2018 Canh Tran. All rights reserved.
//

import UIKit

final class MainOffersViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet private weak var offersTableView: UITableView!
    
    private lazy var loadingView: LoaddingView = {
        let loadingView = LoaddingView(frame: UIScreen.main.bounds)
        loadingView.backgroundColor = .clear
        loadingView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.view.addSubview(loadingView)
        return loadingView
    }()
    
    lazy var offersViewModel = MainOffersViewModel(service: GetOffersService())
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupViewModel()
    }

    // MARK: Setups views & model
    
    private func setupViews() {
        offersTableView.registerCellNib(OfferCellTableViewCell.self)
        offersTableView.rowHeight = UITableViewAutomaticDimension
        offersTableView.estimatedRowHeight = self.view.bounds.width
    }
    
    private func setupViewModel() {
        offersViewModel.dataHasChanged = { [weak self] (response) in
            if response.error == nil {
                self?.offersTableView.reloadData()
            } else {
                /// Show error message here
            }
        }
    }
    
}

// MARK: UITableViewDataSource & UITableViewDelegate

extension MainOffersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return offersViewModel.offersDataResutl.offers?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OfferCellTableViewCell", for: indexPath) as! OfferCellTableViewCell
        if let offer = offersViewModel.offersDataResutl.offers?[indexPath.row] {
            cell.setupCellWithOffer(offer: offer)
        }
        return cell
    }
}

extension MainOffersViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if let offer = offersViewModel.offersDataResutl.offers?[indexPath.row] {
            offersViewModel.offerSelection?(offer)
        }
    }
}
