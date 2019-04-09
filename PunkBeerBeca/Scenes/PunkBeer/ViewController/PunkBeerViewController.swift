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
    
    /** Presenter attribute to call the method that parse the API response */
    private lazy var presenter = PunkBeerPresenter()
    
    /** Attribute that receives an array of Beer type to storage API response */
    private var beers: [Beer] = []
    
    /**
     * Static attributes to determinate properties to this ViewController
     * @viewControllerTitle defines the title that will be inserted inside navigation bar title
     * @numberOfSectionsValue defines the number of sections inside the CollectionView
     * @heightOfCellItem defines the height of the CollectionViewCell
     */
    private static let viewControllerTitle = "Cervejas"
    private static let numberOfSectionsValue = 1
    private static let heightOfCellItem: CGFloat = 215
    
    /** Constructor that instanciate the NIB (.xib) file to our viewController */
    init() {
        super.init(nibName: "PunkBeerViewController", bundle: Bundle.main)
    }
    
    /** Optional constructor that decode a docer parameter in case of error */
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /**
         * Here we add the delegate, dataSource and register the NIB (.xib) of our collectionViewCell
         * Without this three properties, we can't add cells to our CollectionView
         */
        self.collectionViewBeersList.delegate = self
        self.collectionViewBeersList.dataSource = self
        self.collectionViewBeersList.register(BeerItemListCollectionViewCell.instanceOfNib(), forCellWithReuseIdentifier: BeerItemListCollectionViewCell.identifier)
        
        /**
         * Here it's when all the magic happens
         * We use our presenter attribute to call the method `loadBeers`
         * This method have a callback with a closure, that returns to us an array of Beer type in case of success
         * Using the closure, we add the response of this method to our array of beers using the `self.beers` attribute to storage inside our ViewController
         * It's important to setup the `reloadData()` method to our ViewController observe every change inside our API
         */
        self.presenter.loadBeers(callback: { beers in
            self.beers = beers
            self.collectionViewBeersList.reloadData()
        })
        
        self.setNavigationBarConfig()
    }
    
    /** This method set the title inside the navigation bar of the viewController */
    func setNavigationBarConfig() {
        self.navigationItem.title = PunkBeerViewController.viewControllerTitle
    }
}

extension PunkBeerViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return PunkBeerViewController.numberOfSectionsValue
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return beers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BeerItemListCollectionViewCell", for: indexPath) as! BeerItemListCollectionViewCell
        
        cell.set(beer: beers[indexPath.item])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionViewBeersList.bounds.width / 2) - 8
        let height = PunkBeerViewController.heightOfCellItem
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let beer = beers[indexPath.item]
        let detailsBeerViewController = DetailsBeerViewController(beer: beer)
        
        self.navigationController?.pushViewController(detailsBeerViewController, animated: true)
    }
}
