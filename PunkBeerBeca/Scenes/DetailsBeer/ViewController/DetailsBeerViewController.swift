//
//  DetailsBeerViewController.swift
//  PunkBeerBeca
//
//  Created by Gabriel Henrique Santos Pereira on 09/04/19.
//  Copyright © 2019 Gabriel Henrique Santos Pereira. All rights reserved.
//

import UIKit
import SDWebImage

class DetailsBeerViewController: UIViewController {
    @IBOutlet weak var imageViewBeerImage: UIImageView!
    @IBOutlet weak var labelBeerName: UILabel!
    @IBOutlet weak var labelBeerTagline: UILabel!
    @IBOutlet weak var labelBeerDateRegister: UILabel!
    @IBOutlet weak var textViewBeerDescription: UITextView!
    
    private var beer: Beer
    
    init(beer: Beer) {
        self.beer = beer
        super.init(nibName: "DetailsBeerViewController", bundle: Bundle.main)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.beer = Beer()
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = beer.name
        
        self.set(beer: beer)
    }
    
    func set(beer: Beer) {
        guard let url = URL(string: beer.imageUrl!) else {
            return
        }
        
        self.imageViewBeerImage.sd_setImage(with: url)
        self.labelBeerName.text = beer.name
        self.labelBeerTagline.text = beer.tagline
        self.labelBeerDateRegister.text = beer.date
        self.textViewBeerDescription.text = beer.description
    }
}
