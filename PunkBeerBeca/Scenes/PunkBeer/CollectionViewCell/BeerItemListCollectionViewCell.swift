//
//  BeerItemListCollectionViewCell.swift
//  PunkBeerBeca
//
//  Created by Gabriel Henrique Santos Pereira on 09/04/19.
//  Copyright © 2019 Gabriel Henrique Santos Pereira. All rights reserved.
//

import UIKit

class BeerItemListCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var imageViewBeer: UIImageView!
    @IBOutlet private weak var labelBeerName: UILabel!
    
    static let identifier = "BeerItemListCollectionViewCell"
    
    static func instanceOfNib() -> UINib {
        return UINib(nibName: identifier, bundle: Bundle.main)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setBeerProperties(name: String, image: UIImage) {
        self.labelBeerName.text = name
        self.imageViewBeer.image = image
    }
}
