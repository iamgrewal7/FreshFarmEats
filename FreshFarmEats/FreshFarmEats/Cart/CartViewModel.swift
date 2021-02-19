//
//  CartViewModel.swift
//  FreshFarmEats
//
//  Created by Harman singh on 2021-02-18.
//

import Foundation

class CartModel: ObservableObject {
    @Published var cart: [Product: Int] = [:]
    
    func addProduct(product: Product) {
        cart[product] = (cart[product] ?? 0) + 1
    }
    
    func getCart() -> [Product] {
        return Array(cart.keys)
    }
    
    func isEmpty() -> Bool {
        return cart.count == 0
    }
    
    func removeProduct(product: Product) {
        cart[product] = (cart[product] ?? 0) - 1
        if cart[product]! <= 0 {
            cart[product] = nil
        }
    }
    
    func getCount(product: Product) -> Int {
        return cart[product]!
    }
}
