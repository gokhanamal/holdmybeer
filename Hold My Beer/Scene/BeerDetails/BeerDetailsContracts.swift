//
//  BeerDetailsContracts.swift
//  Hold My Beer
//
//  Created by Gokhan Namal on 10.07.2020.
//  Copyright © 2020 Gokhan Namal. All rights reserved.
//

import Foundation
import class UIKit.UIImage

protocol BeerDetailsViewModelDelegate: class {
    func showDetail(_ beer: Beer)
}

protocol BeerDetailsViewModelProtocol {
    var delegate: BeerDetailsViewModelDelegate? { get set }
    func load()
}
