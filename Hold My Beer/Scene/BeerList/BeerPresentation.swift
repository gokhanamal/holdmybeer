//
//  BeerPresentation.swift
//  Hold My Beer
//
//  Created by Gokhan Namal on 10.07.2020.
//  Copyright © 2020 Gokhan Namal. All rights reserved.
//

import Foundation
import class UIKit.UIImage

struct Beer: Equatable {
    init(beer: GetBeersResponse) {
        self.id = beer.id
        self.name = beer.name
        self.description = beer.description
        self.tagline = beer.tagline
        self.brewersTips = beer.brewersTips
        self.imageURL = URL(string: beer.imageURL)
    }
    
    let id: Int
    let name: String
    let tagline: String
    let description: String
    let brewersTips: String
    let imageURL: URL?
    var image: UIImage?
}
