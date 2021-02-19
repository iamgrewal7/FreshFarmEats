//
//  FarmView.swift
//  FreshFarmEats
//
//  Created by Harman singh on 2021-02-17.
//

import SwiftUI


struct FarmView: View {
    var farm: Farm
   
    var body: some View {
        VStack {
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
        .padding([.top, .horizontal, .bottom])
        
    }
}



struct FarmView_Previews: PreviewProvider {
    static var previews: some View {
        FarmView(farm: Farm(name: "Name", address: "Address", rating: 3, distance: 15, products: [Product(id: 1, name: "apple", price: 11)], img: "sdf"))
    }
}
