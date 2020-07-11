//
//  MockHMBClient.swift
//  Hold My BeerTests
//
//  Created by Gokhan Namal on 10.07.2020.
//  Copyright © 2020 Gokhan Namal. All rights reserved.
//

import Foundation
import class UIKit.UIImage

final class MockHMBClent: HMBClientProtocol {
    let beers = [Beer]()
    func getBeers(completion: @escaping (Result<[GetBeersResponse]?, HMBClientErrors>) -> Void) {
        return completion(.success([.fake()]))
    }
    
    func requestImageFile(url: URL, completion: @escaping (Result<UIImage?, HMBClientErrors>) -> Void) {
        
    }
}
