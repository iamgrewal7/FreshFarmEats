//
//  FarmModel.swift
//  FreshFarmEats
//
//  Created by Harman singh on 2021-02-17.
//

import Foundation

struct Farm: Codable  {
    let name: String
    let address: String
    let rating: Double
    let distance: Double
    let products: [Product]
    let img: String
}

