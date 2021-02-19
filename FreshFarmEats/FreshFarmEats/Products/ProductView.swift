//
//  ProductView.swift
//  FreshFarmEats
//
//  Created by Harman singh on 2021-02-17.
//

import SwiftUI

struct ProductView: View {
    @EnvironmentObject private var cart: CartModel
    
    var imageURLMap = [
        1:"https://images.unsplash.com/photo-1560806887-1e4cd0b6cbd6?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=100&q=80](https://images.unsplash.com/photo-1560806887-1e4cd0b6cbd6?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=100&q=80",
        2:"https://images.unsplash.com/photo-1564518087238-8d82baa9d7cc?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=100&q=80](https://images.unsplash.com/photo-1564518087238-8d82baa9d7cc?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=100&q=80)",
        3:"https://images.unsplash.com/photo-1521997888043-aa9c827744f8?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=100&q=80",
        4:"https://images.unsplash.com/photo-1603052875302-d376b7c0638a?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=100&q=80](https://images.unsplash.com/photo-1603052875302-d376b7c0638a?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=100&q=80)",
        5:"https://images.unsplash.com/photo-1588961621406-31a5fdabb0fc?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=100&q=80](https://images.unsplash.com/photo-1588961621406-31a5fdabb0fc?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=100&q=80)",
        6:"https://images.unsplash.com/photo-1611746985643-358d75ed70fe?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=200&q=80"
        ]
    
    var product: Product
    
    var body: some View {
        VStack {
            AsyncImage(
                url: URL(string: imageURLMap[product.id]!)!,
            placeholder: { Text("Loading..") }
            ).aspectRatio(contentMode: .fit)

            
            VStack(alignment: .leading) {
                Text(product.name)
                    .font(.title)
                    .foregroundColor(.primary)
                HStack {
                    Text(String(format: "$%.1f/lb", product.price))
                        .font(.headline)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.secondary)
                    Spacer()
                    Button(action: {
                        cart.addProduct(product: product)
                    }, label: {
                        Image(systemName: "cart.fill.badge.plus")
                            .foregroundColor(.yellow)
                    })
                    
                }
            }
            .padding()
        }
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1)
        )
        .background(
           RoundedRectangle(
             cornerRadius: 10
           )
           .foregroundColor(Color.white)
           .shadow(
            color: Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.5),
            radius: 8,
            x: 0,
            y: 3
           )
        )
        .padding([.top, .horizontal])
    }
}

//struct ProductView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductView(product: Product(name: "apple", price: 11))
//    }
//}

