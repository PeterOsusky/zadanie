//
//  NetworkManager.swift
//  zadanie
//
//  Created by Peter on 10/07/2023.
//

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

    func fetchProduct(id: Int) -> Promise<Product> {
        return Promise { seal in
            AF.request("https://fakestoreapi.com/products/\(id)")
                .validate()
                .responseDecodable(of: Product.self) { response in
                    switch response.result {
                    case .success(let product):
                        seal.fulfill(product)
                    case .failure(let error):
                        seal.reject(error)
                    }
                }
        }
    }    
    
    func fetchCategories() -> Promise<[Category]> {
        return Promise { seal in
            AF.request("https://fakestoreapi.com/products/categories")
                .validate()
                .responseDecodable(of: [String].self) { response in
                    switch response.result {
                    case .success(let categoryTitles):
                        let categories = categoryTitles.map(Category.init)
                        seal.fulfill(categories)
                    case .failure(let error):
                        seal.reject(error)
                    }
                }
        }
    }
}
