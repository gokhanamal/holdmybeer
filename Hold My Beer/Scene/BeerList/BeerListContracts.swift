//
//  BeerListContracts.swift
//  Hold My Beer
//
//  Created by Gokhan Namal on 10.07.2020.
//  Copyright © 2020 Gokhan Namal. All rights reserved.
//

import Foundation
import class UIKit.UIImage

protocol BeerListViewModelProtocol {
    var delegate: BeerListViewModelDelegate? { get set }
    func load()
    func selectBeer(at index: Int)
}

enum BeerListViewModelOutput: Equatable {
    case setTitle(String)
    case setLoading(Bool)
    case showBeerList([Beer])
    case showError(Error)
}

protocol BeerListViewModelDelegate: class {
    func handleViewModelOutput(_ output: BeerListViewModelOutput)
    func navigate(to navigationType: NavigationType)
}

enum NavigationType {
    case details(Int)
}

extension BeerListViewModelOutput {
    static func == (lhs: BeerListViewModelOutput, rhs: BeerListViewModelOutput) -> Bool {
        switch (lhs, rhs) {
        case (.setTitle(let a), .setTitle(let b)):
            return a == b
        case (.setLoading(let a), .setLoading(let b)):
            return a == b
        case (.showBeerList(let a), .showBeerList(let b)):
            return a == b
        default:
            return false
        }
    }
}
