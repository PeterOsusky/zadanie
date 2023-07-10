//
//  ProductDetailViewModel.swift
//  zadanie
//
//  Created by Peter on 10/07/2023.
//

import Foundation

class ProductDetailViewModel: ObservableObject {
    @Published var product = Product(id: 0, title: "", description: "", image: "", price: 0, category: "")
    private let networkManager = NetworkManager()
    
    init(id: Int) {
        fetchProduct(id: id)
    }
    
    func fetchProduct(id: Int) {
        networkManager.fetchProduct(id: id).done { product in
            self.product = product
        }.catch { error in
            print(error)
        }
    }
}


