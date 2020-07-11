//
//  HMBClientTest.swift
//  Hold My BeerTests
//
//  Created by Gokhan Namal on 11.07.2020.
//  Copyright © 2020 Gokhan Namal. All rights reserved.
//

import XCTest

class HMBClientTest: XCTestCase {
    func testExample() throws {
        let bundle = Bundle(for: HMBClientTest.self)
        let url = bundle.url(forResource: "beer", withExtension: "json")!
        let data = try Data(contentsOf: url)
        let beer = try JSONDecoder().decode(GetBeersResponse.self, from: data)
        
        XCTAssertEqual(beer.id, 1)
        XCTAssertEqual(beer.name, "Buzz")
        XCTAssertEqual(beer.tagline, "A Real Bitter Experience.")
        XCTAssertEqual(beer.description, "A light, crisp and bitter IPA brewed with English and American hops. A small batch brewed only once.")
        XCTAssertEqual(beer.imageURL, "https://images.punkapi.com/v2/keg.png")
        XCTAssertEqual(beer.brewersTips, "The earthy and floral aromas from the hops can be overpowering. Drop a little Cascade in at the end of the boil to lift the profile with a bit of citrus.")
    }
}
