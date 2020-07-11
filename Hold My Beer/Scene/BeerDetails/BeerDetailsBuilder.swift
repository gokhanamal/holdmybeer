//
//  BeerDetailsBuilder.swift
//  Hold My Beer
//
//  Created by Gokhan Namal on 11.07.2020.
//  Copyright © 2020 Gokhan Namal. All rights reserved.
//

import Foundation
import class UIKit.UIStoryboard

final class BeerDetailsBuilder {
    static func make(with viewModel: BeerDetailsViewModelProtocol) -> BeerDetailsViewController {
        let storyboard = UIStoryboard(name: "BeerDetails", bundle: .main)
        let viewController = storyboard.instantiateInitialViewController() as! BeerDetailsViewController
        viewController.viewModel = viewModel
        return viewController
    }
}
