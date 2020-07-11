//
//  BeersService.swift
//  Hold My Beer
//
//  Created by Gokhan Namal on 10.07.2020.
//  Copyright © 2020 Gokhan Namal. All rights reserved.
//  HMB -> Hold My Beer

import Foundation
import class UIKit.UIImage

final class HMBClient: HMBClientProtocol {
    enum Endpoints {
        static let baseURL = "https://api.punkapi.com/v2/"
        case getBeers
        case getBeerDetail(Int)
        var url: URL {
            return URL(string: self.stringValue)!
        }
        
        var stringValue: String {
            switch self {
            case .getBeers:
                return Endpoints.baseURL + "/beers"
            case .getBeerDetail(let id):
                return Endpoints.baseURL + "/beers/\(id)"
            }
        }
    }
    
    func getBeers(completion: @escaping (Result<[GetBeersResponse]?, HMBClientErrors>) -> Void) {
        let task = URLSession.shared.dataTask(with: Endpoints.getBeers.url){(data, _, error) in
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(.failure(.failedToGetBeers))
                }
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let responseObject = try decoder.decode([GetBeersResponse].self, from: data)
                DispatchQueue.main.async {
                    completion(.success(responseObject))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(.failedToParseGetBeers))
                }
            }
        }
        task.resume()
    }
}
