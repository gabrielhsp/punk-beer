//
//  PunkBeerViewController.swift
//  PunkBeerBeca
//
//  Created by Gabriel Henrique Santos Pereira on 09/04/19.
//  Copyright © 2019 Gabriel Henrique Santos Pereira. All rights reserved.
//

import UIKit

class PunkBeerViewController: UIViewController {
    init() {
        super.init(nibName: "PunkBeerViewController", bundle: Bundle.main)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarConfig()
    }
    
    func setNavigationBarConfig() {
        self.navigationItem.title = "Cervejas"
    }
}
