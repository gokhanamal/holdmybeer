
//
//  File.swift
//  Hold My Beer
//
//  Created by Gokhan Namal on 10.07.2020.
//  Copyright © 2020 Gokhan Namal. All rights reserved.
//

import Foundation

final class BeerListViewModel: BeerListViewModelProtocol {
    var delegate: BeerListViewModelDelegate?
    @Dependency var client: HMBClientProtocol
    
    var beers = [Beer]()
    
    func load() {
        delegate?.handleViewModelOutput(.setTitle("Beers"))
        delegate?.handleViewModelOutput(.setLoading(true))
        
        client.getBeers{ [weak self] response in
            guard let self = self else { return }
            switch(response) {
                case .failure(let error):
                    print(error)
                    break;
                case .success(let beersResponse):
                    if let beersResponse = beersResponse {
                        let beers = beersResponse.map{Beer(beer: $0)}
                        self.beers = beers
                        self.delegate?.handleViewModelOutput(.showBeerList(beers))
                    }
            }
            self.delegate?.handleViewModelOutput(.setLoading(false))
        }
    }
    
    func selectBeer(at index: Int) {
        let beer = beers[index]
        let viewModel: BeerDetailsViewModelProtocol = BeerDetailsViewModel(beer: beer)
        DependencyContainer.register(viewModel)
        delegate?.navigate(to: .details)
    }
}

