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
        VStack {
            Text(productDetailVM.product.title)
            Text(productDetailVM.product.description)
            // Other details...
        }
    }
}

