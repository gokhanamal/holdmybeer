//
//  GetBeersResponse.swift
//  Hold My Beer
//
//  Created by Gokhan Namal on 10.07.2020.
//  Copyright © 2020 Gokhan Namal. All rights reserved.
//  HMB -> Hold My Beer

import Foundation

struct GetBeersResponse: Codable {
    let id: Int
    let name: String
    let tagline: String
    let description: String
    let brewersTips: String
    let imageURL: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case tagline
        case description
        case brewersTips = "brewers_tips"
        case imageURL = "image_url"
    }
}

extension GetBeersResponse {
    static func fake() -> GetBeersResponse {
        return self.init(id: 1, name: "Buzz", tagline: "A Real Bitter Experience.", description: "A Real Bitter Experience.", brewersTips: "A Real Bitter Experience.", imageURL: "https://images.punkapi.com/v2/keg.png")
    }
}
