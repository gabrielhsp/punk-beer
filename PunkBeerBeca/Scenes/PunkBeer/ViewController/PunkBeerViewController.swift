//
//  PunkBeerViewController.swift
//  PunkBeerBeca
//
//  Created by Gabriel Henrique Santos Pereira on 09/04/19.
//  Copyright © 2019 Gabriel Henrique Santos Pereira. All rights reserved.
//

import UIKit

class PunkBeerViewController: UIViewController {
    @IBOutlet weak var collectionViewBeersList: UICollectionView!
    
    private lazy var presenter = PunkBeerPresenter()
    private static let numberOfSectionsValue = 1
    private static let numberOfItensInSectionValue = 10
    
    init() {
        super.init(nibName: "PunkBeerViewController", bundle: Bundle.main)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionViewBeersList.delegate = self
        self.collectionViewBeersList.dataSource = self
        self.collectionViewBeersList.register(BeerItemListCollectionViewCell.instanceOfNib(), forCellWithReuseIdentifier: BeerItemListCollectionViewCell.identifier)
        
        self.presenter.loadBeers(callback: { beers in
            self.collectionViewBeersList.reloadData()
        })
        
        self.setNavigationBarConfig()
    }
    
    func setNavigationBarConfig() {
        self.navigationItem.title = "Cervejas"
    }
}

extension PunkBeerViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return PunkBeerViewController.numberOfSectionsValue
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return PunkBeerViewController.numberOfItensInSectionValue
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BeerItemListCollectionViewCell", for: indexPath) as! BeerItemListCollectionViewCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionViewBeersList.bounds.width / 2) - 8
        let height = (collectionViewBeersList.bounds.height / 2)
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailsBeerViewController = DetailsBeerViewController()
        
        self.navigationController?.pushViewController(detailsBeerViewController, animated: true)
    }
}
