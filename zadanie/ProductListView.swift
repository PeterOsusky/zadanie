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
    @State private var selectedCategory: Category? = nil
    @State private var showFilter = false
    
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
                self.productListVM.fetchCategories()
            }
            .navigationBarTitle("Produkty", displayMode: .inline)
            .navigationBarItems(trailing:
                                    Button(action: {
                self.showFilter.toggle()
            }) {
                Text("Filter")
            }
                .actionSheet(isPresented: $showFilter) {
                    ActionSheet(title: Text("Select a category"), buttons: self.getFilterButtons())
                }
            )
        }
    }
    
    func getFilterButtons() -> [ActionSheet.Button] {
        var buttons = [ActionSheet.Button]()
        buttons.append(.default(Text("All")) { self.selectedCategory?.title = "All" })

        for category in self.productListVM.categories {
            buttons.append(.default(Text(category.title)) { self.selectedCategory?.title = category.title })
        }
        buttons.append(.cancel())
        return buttons
    }
}

