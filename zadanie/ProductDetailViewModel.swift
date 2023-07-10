//
//  ProductDetailViewModel.swift
//  zadanie
//
//  Created by Peter on 10/07/2023.
//

import Foundation

class ProductDetailViewModel: ObservableObject {
    @Published var product: Product

    init(product: Product) {
        self.product = product
    }
}

