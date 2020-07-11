//
//  BeerDetailsTest.swift
//  Hold My BeerTests
//
//  Created by Gokhan Namal on 11.07.2020.
//  Copyright © 2020 Gokhan Namal. All rights reserved.
//

import XCTest

class BeerDetailsTest: XCTestCase {
    
    private var viewModel: BeerDetailsViewModel!
    private var view: MockView!
    let beer: Beer = .init(beer: .fake())
    
    override func setUp() {
        viewModel = BeerDetailsViewModel(beer: beer)
        view = MockView()
        viewModel.delegate = view
    }
    
    func testExample() throws {
        viewModel.load()
        
        XCTAssertEqual(view.beer?.name, beer.name)
        XCTAssertEqual(view.beer?.id, beer.id)
        XCTAssertEqual(view.beer?.description, beer.description)
        XCTAssertEqual(view.beer?.imageURL, beer.imageURL)
        XCTAssertEqual(view.beer?.brewersTips, beer.brewersTips)
        XCTAssertEqual(view.beer?.tagline, beer.tagline)
    }

}

private class MockView: BeerDetailsViewModelDelegate {
    var beer: Beer?
    
    func showDetail(_ beer: Beer) {
        self.beer = beer
    }
}
