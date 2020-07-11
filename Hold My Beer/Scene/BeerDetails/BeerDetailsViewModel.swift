//
//  BeerListViewModel.swift
//  Hold My Beer
//
//  Created by Gokhan Namal on 10.07.2020.
//  Copyright © 2020 Gokhan Namal. All rights reserved.
//

import UIKit

final class BeerDetailsViewModel: BeerDetailsViewModelProtocol {
    weak var delegate: BeerDetailsViewModelDelegate?
    
    private let beer: Beer
    
    init(beer: Beer) {
        self.beer = beer
    }
    
    func load() {
        delegate?.showDetail(beer)
    }
}
