//
//  ProductListViewModel.swift
//  zadanie
//
//  Created by Peter on 10/07/2023.
//

import Combine

class ProductListViewModel: ObservableObject {
    @Published var products = [Product]()
    @Published var categories = [Category]()

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
    
    func fetchCategories() {
        NetworkManager.shared.fetchCategories()
            .done { categories in
                self.categories = categories
            }
            .catch { error in
                // Handle error
                print(error.localizedDescription)
            }
    }
}
