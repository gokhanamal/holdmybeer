//
//  HMBServiceContracts.swift
//  Hold My Beer
//
//  Created by Gokhan Namal on 10.07.2020.
//  Copyright © 2020 Gokhan Namal. All rights reserved.
//

import Foundation
import class UIKit.UIImage

protocol HMBClientProtocol {
    func getBeers(completion: @escaping (Result<[GetBeersResponse]?, HMBClientErrors>) -> Void)
}

enum HMBClientErrors: Error {
    case failedToLoadImage
    case failedToGetBeers
    case failedToParseGetBeers
    case failedToGetBeetDetail
}
