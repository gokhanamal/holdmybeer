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
        let viewController = storyboard.instantiateInitialViewController() as!  BeerListViewController
        let client = HMBClient()
        viewController.viewModel = BeerListViewModel(client: client)
        return viewController
    }
}
