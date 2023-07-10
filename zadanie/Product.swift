//
//  Product.swift
//  zadanie
//
//  Created by Peter on 10/07/2023.
//

import Foundation
struct Product: Codable, Identifiable {
    let id: Int
    let title: String
    let description: String
    let image: String
    let price: Double
    let category: String
}
