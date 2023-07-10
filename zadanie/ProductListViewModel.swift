//
//  ProductListViewModel.swift
//  zadanie
//
//  Created by Peter on 10/07/2023.
//

import Foundation
import Combine

class ProductListViewModel: ObservableObject {
    @Published var products = [Product]()

    func fetchProducts() {
        NetworkManager.shared.fetchProducts()
            .done { products in
                self.products = products
            }
            .catch { error in
                // Handle error
                print(error.localizedDescription)
            }
    }
}

