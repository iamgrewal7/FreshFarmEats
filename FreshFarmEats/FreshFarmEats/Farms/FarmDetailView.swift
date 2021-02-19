//
//  FarmDetailView.swift
//  FreshFarmEats
//
//  Created by Harman singh on 2021-02-17.
//

import SwiftUI


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
    
    func increment(product: Product) {
        cart[product]! += 1
    }
    
    func decrement(product: Product) {
        cart[product]! -= 1
        if cart[product]! <= 0 {
            cart[product] = nil
        }
    }
}



struct CartButton: View {
    var body: some View {
        VStack {
            Image(systemName: "star.fill")
                .font(.system(size: 12))
                .foregroundColor(.yellow)
        }
    }
}

struct FarmDetailView: View {
    @EnvironmentObject private var cart: CartModel
    @State private var showingCart = false
    
    
    @State var isLinkActive = false
    var farm: Farm
    var columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ScrollView{
            VStack{
                AsyncImage(
                    url: URL(string: farm.img)!,
                    placeholder: { Text("Loading..") }
                ).aspectRatio(contentMode: .fit)
                VStack(alignment: .leading) {
                    Text(farm.name)
                        .font(.title)
                        .foregroundColor(.primary)
                    Text("\(farm.address)")
                        .font(.headline)
                        .foregroundColor(.secondary)
                    HStack {
                        Text("\(String(format: "%.1f", farm.distance))km")
                            .font(.headline)
                            .foregroundColor(.secondary)
                        Spacer()
                        Text(String(format: "%.1f", farm.rating))
                            .font(.headline)
                            .foregroundColor(.secondary)
                        Image(systemName: "star.fill")
                            .font(.system(size: 12))
                            .foregroundColor(.yellow)
                    }
                }
                .padding()
            }
            .toolbar {
                Button(action: { showingCart.toggle() }) {
                    Image(systemName: "cart.fill")
                }
            }
            .sheet(isPresented: $showingCart) {
                CartView()
            }
            Divider()
            LazyVGrid(columns: columns) {
                ForEach(farm.products, id: \.name) { product in
                    ProductView(product: product)
                }
            }
        }
    }
}

struct FarmDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FarmDetailView(farm: Farm(name: "Name", address: "Address", rating: 3, distance: 15, products: [Product(id: 1, name: "apple", price: 11)], img: "sdf"))
    }
}
