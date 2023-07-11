//
//  ProductDetailViewModel.swift
//  zadanie
//
//  Created by Peter on 10/07/2023.
//

import Combine

class ProductDetailViewModel: ObservableObject {
    @Published var product = Product(id: 0, title: "", description: "", image: "", price: 0, category: "")
    
    init(id: Int) {
        fetchProduct(id: id)
    }
    
    func fetchProduct(id: Int) {
        NetworkManager.shared.fetchProduct(id: id).done { product in
            self.product = product
        }.catch { error in
            print(error)
        }
    }
}
