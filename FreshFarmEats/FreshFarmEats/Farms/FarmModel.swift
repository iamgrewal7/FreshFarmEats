//
//  FarmModel.swift
//  FreshFarmEats
//
//  Created by Harman singh on 2021-02-17.
//

import Foundation

struct Product: Codable {
    let name: String
    let price: Double
}

struct Farm: Codable  {
    let name: String
    let addresss: String
    let rating: Double
    let distance: Double
    let Products: [Product]
    let title: String
    let completed: Bool
    let img: String
}

