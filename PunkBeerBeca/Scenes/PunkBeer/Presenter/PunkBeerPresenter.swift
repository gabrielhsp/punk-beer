//
//  PunkBeerPresenter.swift
//  PunkBeerBeca
//
//  Created by Gabriel Henrique Santos Pereira on 09/04/19.
//  Copyright © 2019 Gabriel Henrique Santos Pereira. All rights reserved.
//

import Foundation
import UIKit

class PunkBeerPresenter: NSObject {
    override init() {
        super.init()
    }
    
    func loadBeers(callback: @escaping (([Beer]) -> Void)) {
        /**
         * Here we create an object of URL type
         * We use the guard let statement to ensure that this is a valid url
         * By default, an URL object only use the GET method
         */
        guard let url = URL(string: "https://api.punkapi.com/v2/beers?page=1&per_page=50") else {
            return
        }
        
        /**
         * To have access to another methods, we use the URLRequest object
         * He receives an URL object as parameter and give us more power to make another request methods, such as POST, cache policy
         */
        let urlRequest = URLRequest(url: url)
        
        /**
         * To consume our API, we need to use a method called dataTask
         * This method it's inside an URLSession object, inside the `shared` key
         * Here we just storage URLSession.shared inside a variable
         */
        let session = URLSession.shared
        
        /**
         * And finally we use the `dataTask` method to make our request to the desired API
         * The dataTask method receives an URLRequester as first parameter and a completionHandler, that's a closure
         * Inside completionHandler, we insert our closure with three parameters: data, response and error
         * The parameter data it's the data that we want to retrive from our API
         * The response parameter it's the response that our API returns
         * The error parameter only returns if some problem occurred with our request
         */
        let dataTask = session.dataTask(with: urlRequest, completionHandler: { data, response, error in
            /** If our request doesn't find any error, we try to decode our data using JSONDecoder object */
            if error == nil {
                let decoder = JSONDecoder()
                
                do {
                    let json = try decoder.decode([Beer].self, from: data!)
                    print(json)
                } catch {
                    print("☠️☠️☠️ Não consegui fazer o parse da API ☠️☠️☠️")
                }
            } else {
                print(error!)
            }
        })
        
        /** This method invoke the request to our API */
        dataTask.resume()
    }
}
