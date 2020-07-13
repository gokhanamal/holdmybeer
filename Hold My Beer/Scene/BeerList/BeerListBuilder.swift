//
//  File.swift
//  Hold My Beer
//
//  Created by Gokhan Namal on 10.07.2020.
//  Copyright © 2020 Gokhan Namal. All rights reserved.
//

import UIKit

final class BeerListBuilder {
    static func make() -> BeerListViewController {
        let storyboard = UIStoryboard(name: "BeerList", bundle: .main)
        let client: HMBClientProtocol = HMBClient()
        DependencyContainer.register(client)

        let viewModel: BeerListViewModelProtocol = BeerListViewModel()

        DependencyContainer.register(viewModel)

        let viewController = storyboard.instantiateInitialViewController() as!  BeerListViewController

        return viewController
    }
}
