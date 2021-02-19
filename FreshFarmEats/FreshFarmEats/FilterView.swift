//
//  FilterView.swift
//  FreshFarmEats
//
//  Created by Harman singh on 2021-02-18.
//

import SwiftUI

struct FilterView: View {
    @Binding var filters: [Int]
    @State var chosen = false
    @ObservedObject var productViewModel = ProductViewModel()
    
    var body: some View {
        VStack {
            HStack{
                Text("Filters")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }.padding()
            List {
                ForEach(self.productViewModel.products, id: \.name) { product in
                    Button(action: {
                        if let index = filters.firstIndex(of: product.id) {
                            filters.remove(at: index)
                        } else {
                            filters.append(product.id)
                        }
                    }
                    ) {
                        Text(product.name)
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 200, height: 40)
                            .background(filters.contains(product.id) ? Color.green: Color.blue)
                            .cornerRadius(15.0)
                    }
                }
            }.onAppear(perform: self.productViewModel.fetchProducts)
        }
    }
}
