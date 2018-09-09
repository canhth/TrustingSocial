//
//  OfferCellTableViewCell.swift
//  TrustingSocial
//
//  Created by Canh Tran on 9/8/18.
//  Copyright © 2018 Canh Tran. All rights reserved.
//

import UIKit
import Kingfisher

final class OfferCellTableViewCell: UITableViewCell {

    // MARK: IBOutlets
    @IBOutlet weak private var logoImageView: UIImageView!
    @IBOutlet weak private var bankNameLabel: UILabel!
    @IBOutlet weak private var interestRateLabel: UILabel!
    @IBOutlet weak private var minMaxAmountLabel: UILabel!
    @IBOutlet weak private var minMaxTenorLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = 5
        contentView.layer.applySketchShadow(color: UIColor.black,
                                                 alpha: 0.4, x: 0, y: 3, blur: 3, spread: 0)
        logoImageView.layer.cornerRadius = 8
        logoImageView.layer.masksToBounds = false
    }
    
    // MARK: Setup cell
    func setupCellWithOffer(offer: Offer) {
        bankNameLabel.text = offer.bank.name
        interestRateLabel.text = offer.interestRate.description + "%"
        minMaxAmountLabel.text = "\(offer.minAmount.convertToCurrency()) - \(offer.maxAmount.convertToCurrency())" 
        minMaxTenorLabel.text = "\(offer.minTenor) - \(offer.maxTenor) tháng"
        
        if let url = URL(string: offer.bank.logo) {
            logoImageView.kf.setImage(with: url,
                                      options: [.transition(ImageTransition.fade(0.2))])
        }
    }
}
