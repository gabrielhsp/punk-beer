//
//  BeerItemListCollectionViewCell.swift
//  PunkBeerBeca
//
//  Created by Gabriel Henrique Santos Pereira on 09/04/19.
//  Copyright © 2019 Gabriel Henrique Santos Pereira. All rights reserved.
//

import UIKit
import SDWebImage

class BeerItemListCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var imageViewBeer: UIImageView!
    @IBOutlet private weak var labelBeerName: UILabel!
    
    /** This is a static attribute to identify the .xib of our CollectionViewCell */
    static let identifier = "BeerItemListCollectionViewCell"
    
    /** This is the method that returns the instance of our NIB (.xib) to we recover inside another contexts */
    static func instanceOfNib() -> UINib {
        return UINib(nibName: identifier, bundle: Bundle.main)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    /** Method to set parameters inside beer */
    func set(beer: Beer) {
        guard let url = URL(string: beer.imageUrl!) else {
            return
        }
        
        self.imageViewBeer.sd_setImage(with: url)
        self.labelBeerName.text = beer.name
    }
}
