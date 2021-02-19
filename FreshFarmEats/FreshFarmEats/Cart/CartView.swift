//
//  CartView.swift
//  FreshFarmEats
//
//  Created by Harman singh on 2021-02-18.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject private var cart: CartModel
    
    var body: some View {
        VStack {
            HStack{
                Text("Cart")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }.padding()
            if !cart.isEmpty() {
                List(cart.getCart(), id: \.self) { product in
                    ItemView(product: product, count: cart.cart[product]!)
                }
                Button(action: {}) {
                    HStack {
                        Image(systemName: "applelogo")
                            .font(.headline)
                            .foregroundColor(.black)
                        Text("Pay")
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.green)
                    .cornerRadius(15.0)
                }.padding(.top, 50)
            } else {
                List {
                    Text("Empty Cart...")
                        .font(.title)
                }
            }
        }
        .padding()
        .navigationBarHidden(false)
    }
}
