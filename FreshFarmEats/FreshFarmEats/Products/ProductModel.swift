//
//  ProductModel.swift
//  FreshFarmEats
//
//  Created by Harman singh on 2021-02-18.
//

import Foundation

struct Product: Codable, Hashable {
    let id: Int
    let name: String
    let price: Double
}

struct ProductType: Codable {
    let id: Int
    let name: String
}

