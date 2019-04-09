//
//  Beer.swift
//  PunkBeerBeca
//
//  Created by Gabriel Henrique Santos Pereira on 09/04/19.
//  Copyright © 2019 Gabriel Henrique Santos Pereira. All rights reserved.
//

import UIKit

class Beer: Codable {
    var id = 0
    var name: String?
    var imageUrl: String?
    var abv: Double?
    var ibu: Double?
    var tagline: String?
    var description: String?

    /**
     * This enumerator is responsable to let available keys inside our API response
     * Each one of this cases are one key inside our API response
     */
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case imageUrl = "image_url"
        case abv
        case ibu
        case tagline
        case description
    }
}
