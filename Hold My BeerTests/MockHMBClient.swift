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
    let fakeResponse:[GetBeersResponse] = [.fake()]
    
    func getBeers(completion: @escaping (Result<[GetBeersResponse]?, HMBClientErrors>) -> Void) {
        return completion(.success(fakeResponse))
    }
}
