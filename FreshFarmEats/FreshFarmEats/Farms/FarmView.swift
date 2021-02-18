//
//  FarmView.swift
//  FreshFarmEats
//
//  Created by Harman singh on 2021-02-17.
//

import SwiftUI

struct FarmView: View {
    @ObservedObject var viewmodel = FarmViewModel()
    
    var body: some View {
        List(self.viewmodel.farms, id: \.name) {farm in
            VStack {
                Image(farm.img)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                VStack(alignment: .leading) {
                    Text(farm.name)
                        .font(.title)
                        .foregroundColor(.primary)
                    
                    HStack {
                        Text("\(farm.addresss)(~\(farm.distance)km)")
                            .font(.headline)
                            .foregroundColor(.secondary)
                        Spacer()
                        Text("Rating: \(farm.rating)")
                            .font(.headline)
                            .foregroundColor(.secondary)
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
        .onAppear(perform: self.viewmodel.fetchFarms)
    }
}

struct FarmView_Previews: PreviewProvider {
    static var previews: some View {
        FarmView()
    }
}
