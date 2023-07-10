//
//  ProductDetailView.swift
//  zadanie
//
//  Created by Peter on 10/07/2023.
//

import Foundation
import SwiftUI

struct ProductDetailView: View {
    @ObservedObject var productDetailVM: ProductDetailViewModel

    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()

                AsyncImage(url: URL(string: productDetailVM.product.image)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .scaledToFit()
                .frame(width: geometry.size.width * 0.5)

                Spacer()

                Text(productDetailVM.product.title)
                    .font(.title)
                    .foregroundColor(.blue)

                Spacer()

                Text(productDetailVM.product.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                Spacer()

                HStack {
                    VStack(alignment: .leading) {
                        Text("ID Produktu")
                            .foregroundColor(.secondary)
                        Text("\(productDetailVM.product.id)")
                    }

                    Spacer()
                    
                    VStack(alignment: .trailing) {
                        Text("Cena")
                            .foregroundColor(.secondary)
                        Text(String(format: "%.2f €", productDetailVM.product.price))
                    }
                }
                
                Spacer()
            }
            .padding()
            .navigationBarTitle(productDetailVM.product.category, displayMode: .inline)
        }
        .onAppear {
            productDetailVM.fetchProduct(id: productDetailVM.product.id)
        }
    }
}

