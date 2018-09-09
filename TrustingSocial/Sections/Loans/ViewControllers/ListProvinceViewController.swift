//
//  ListProvinceViewController.swift
//  TrustingSocial
//
//  Created by Canh Tran on 9/8/18.
//  Copyright © 2018 Canh Tran. All rights reserved.
//

import UIKit

// Consider to move to common compoment group for reuseable

final class ListProvinceViewController: UIViewController {

    @IBOutlet weak var provinceTableView: UITableView!
    
    var viewModel: ListProvinceViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewModel()
    }
 
    private func setupViewModel() {
        guard let viewModel = viewModel else { return }
        provinceTableView.observe(for: viewModel.listProvince) { [weak self] (_) in
            self?.provinceTableView.reloadData()
        }
    }
}

// MARK: UITableViewDataSource & UITableViewDelegate
extension ListProvinceViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfItems ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProvinceCell", for: indexPath)
        cell.textLabel?.text = viewModel?.itemAtIndex(indexPath.row)
        
        return cell
    }
}

extension ListProvinceViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.provinceSelection?(viewModel?.itemAtIndex(indexPath.row))
    }
}
