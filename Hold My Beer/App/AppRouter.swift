//
//  AppRouter.swift
//  Hold My Beer
//
//  Created by Gokhan Namal on 10.07.2020.
//  Copyright © 2020 Gokhan Namal. All rights reserved.
//

import UIKit

final class AppRouter {
    func start(window: UIWindow?) {
        let rootViewController = BeerListBuilder.make()
        let navigationController = UINavigationController(rootViewController: rootViewController)
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
