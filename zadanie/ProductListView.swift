//
//  ProductListView.swift
//  zadanie
//
//  Created by Peter on 10/07/2023.
//

import SwiftUI

struct ProductListView: View {
    @ObservedObject var productListVM = ProductListViewModel()
    @State private var selectedCategory: String = "All"
    @State private var showFilter = false
    
    var filteredProducts: [Product] {
        if selectedCategory != "All" {
            return productListVM.products.filter { $0.category == selectedCategory }
        } else {
            return productListVM.products
        }
    }
    
    var body: some View {
        NavigationView {
            List(filteredProducts, id: \.id) { product in
                NavigationLink(destination: ProductDetailView(productDetailVM: ProductDetailViewModel(id: product.id))) {
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
            .navigationBarTitle(selectedCategory == "All" ? "Produkty" : selectedCategory, displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {self.showFilter.toggle()}) {Text("Filter")}
            .actionSheet(isPresented: $showFilter) {ActionSheet(title: Text("Select a category"), buttons: self.getFilterButtons())
            })
        }
    }
    
    func getFilterButtons() -> [ActionSheet.Button] {
        var buttons = [ActionSheet.Button]()
        if selectedCategory != "All" {
            buttons.append(.destructive(Text("remove filter " + selectedCategory)) { self.selectedCategory = "All" })
        }
        for category in self.productListVM.categories {
            if selectedCategory != category.title {
                buttons.append(.default(Text(category.title)) { self.selectedCategory = category.title })
            }
        }
        buttons.append(.cancel())
        return buttons
    }
}
