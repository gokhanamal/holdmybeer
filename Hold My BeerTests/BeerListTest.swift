//
//  Hold_My_BeerTests.swift
//  Hold My BeerTests
//
//  Created by Gokhan Namal on 10.07.2020.
//  Copyright © 2020 Gokhan Namal. All rights reserved.
//

import XCTest

class Hold_My_BeerTests: XCTestCase {
    private var viewModel: BeerListViewModelProtocol!
    private var view: MockView!
    
    override func setUp() {
        let client = MockHMBClent()
        viewModel = BeerListViewModel(client: client)
        view = MockView()
        viewModel.delegate = view
    }
    
    func testExample() throws {
        viewModel.load()
        
        XCTAssertEqual(view.outputs.count, 4)
        
        switch view.outputs.first {
        case.setTitle(let title):
            XCTAssertEqual(title, "Beers")
            break //Success
        default:
            XCTFail("First output should be `setTitle`")
        }
        
        XCTAssertEqual(view.outputs[1], .setLoading(true))
        
        let expectedList:[Beer] = [Beer(beer: .fake())]
        XCTAssertEqual(view.outputs[2], .showBeerList(expectedList))
        
        XCTAssertEqual(view.outputs[3], .setLoading(false))
    }
}

private class MockView: BeerListViewModelDelegate {
    var outputs: [BeerListViewModelOutput] = []
    
    func handleViewModelOutput(_ output: BeerListViewModelOutput) {
        outputs.append(output)
    }
    
    func navigate(to navigationType: NavigationType) {
        
    }
}
