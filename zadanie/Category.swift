//
//  Category.swift
//  zadanie
//
//  Created by Peter on 10/07/2023.
//

import Foundation
struct Category: Codable, Identifiable {
    var id = UUID()
    let title: String
}

