//
//  CartView.swift
//  FreshFarmEats
//
//  Created by Harman singh on 2021-02-18.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject private var cart: CartModel
    @State private var paid = false
    
    var body: some View {
        VStack {
            HStack{
                Text("Cart")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }.padding()
            if !cart.isEmpty() {
                List {
                    ForEach(cart.getCart(), id: \.self) { product in
                        ItemView(product: product)
                    }
                }
                Button(action: {paid.toggle()}) {
                    HStack {
                        if !paid {
                            Image(systemName: "applelogo")
                                .font(.headline)
                                .foregroundColor(.black)
                            Text("Pay")
                                .font(.headline)
                                .foregroundColor(.white)
                        } else {
                            Image(systemName: "checkmark.circle")
                                .font(.title)
                                .foregroundColor(.white)
                        }
                    }
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(paid ? Color.blue: Color.green)
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
