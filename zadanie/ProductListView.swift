//
//  ProductListView.swift
//  zadanie
//
//  Created by Peter on 10/07/2023.
//

import Foundation
import SwiftUI

struct ProductListView: View {
    @ObservedObject var productListVM = ProductListViewModel()

    var body: some View {
        NavigationView {
            List(productListVM.products) { product in
                NavigationLink(destination: ProductDetailView(productDetailVM: ProductDetailViewModel(product: product))) {
                    HStack {
                        AsyncImage(url: URL(string: product.image)) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 50, height: 50)
                        
                        VStack(alignment: .leading) {
                            Text(product.title)
                            Text(product.category)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
            .onAppear() {
                self.productListVM.fetchProducts()
            }
        }
    }
}
