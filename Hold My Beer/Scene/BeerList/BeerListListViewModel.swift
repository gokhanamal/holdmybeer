
//
//  File.swift
//  Hold My Beer
//
//  Created by Gokhan Namal on 10.07.2020.
//  Copyright © 2020 Gokhan Namal. All rights reserved.
//

import Foundation

final class BeerListViewModel: BeerListViewModelProtocol {
    
    weak var delegate: BeerListViewModelDelegate?
    private let client: HMBClientProtocol
    
    init(client: HMBClientProtocol) {
        self.client = client
    }
    
    func load() {
        delegate?.handleViewModelOutput(.setTitle("Beers"))
        delegate?.handleViewModelOutput(.setLoading(true))
        
        client.getBeers{ [weak self] response in
            guard let self = self else { return }
            switch(response) {
                case .failure(let error):
                    self.delegate?.handleViewModelOutput(.showError(error))
                    break;
                case .success(let beersResponse):
                    if let beersResponse = beersResponse {
                        let beers = beersResponse.map{Beer(beer: $0)}
                        self.delegate?.handleViewModelOutput(.showBeerList(beers))
                    }
            }
            self.delegate?.handleViewModelOutput(.setLoading(false))
        }
    }
    
    func selectBeer(at index: Int) {
        delegate?.navigate(to: .details(index))
    }
}

