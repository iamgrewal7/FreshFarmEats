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
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(product.name)
                .font(.title)
            HStack {
                Text(String(format: "Price: $%.1f/lb", product.price))
                    .font(.headline)
                    .foregroundColor(.secondary)
                Spacer()
                HStack {
                    Button(action: {
                        cart.addProduct(product: product)
                        print("Tapped Plus")
                    }, label: {
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(.blue)
                    })
                    Text("\(cart.getCount(product: product))")
                        .font(.headline)
                    Button(action: {
                        cart.removeProduct(product: product)
                        print("Tapped Minus")
                    }, label: {
                        Image(systemName: "minus.circle.fill")
                            .foregroundColor(.blue)
                    })
                }
            }
            
        }
        .padding()
    }
}
