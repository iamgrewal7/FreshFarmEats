//
//  ItemView.swift
//  FreshFarmEats
//
//  Created by Harman singh on 2021-02-18.
//

import SwiftUI

struct ItemView: View {
    @EnvironmentObject private var cart: CartModel
    
    var product: Product
    var count: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(product.name)
                .font(.title)
            HStack {
                Text(String(format: "%.1f", product.price))
                    .font(.headline)
                Spacer()
                HStack {
                    Button(action: {cart.increment(product: product)}) {
                        Image(systemName: "plus.circle.fill")
                    }
                    Text("\(count)")
                        .font(.headline)
                    Button(action: {cart.decrement(product: product)}) {
                        Image(systemName: "minus.circle.fill")
                    }
                }
            }
            
        }
        .padding()
    }
}
