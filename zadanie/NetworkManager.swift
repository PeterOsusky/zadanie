//
//  NetworkManager.swift
//  zadanie
//
//  Created by Peter on 10/07/2023.
//

import Foundation
import Alamofire
import PromiseKit

class NetworkManager {
    static let shared = NetworkManager()

    func fetchProducts() -> Promise<[Product]> {
        return Promise { seal in
            AF.request("https://fakestoreapi.com/products")
                .validate()
                .responseDecodable(of: [Product].self) { response in
                    switch response.result {
                    case .success(let products):
                        seal.fulfill(products)
                    case .failure(let error):
                        seal.reject(error)
                    }
                }
        }
    }
}

