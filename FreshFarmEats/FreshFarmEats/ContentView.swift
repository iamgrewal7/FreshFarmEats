//
//  ContentView.swift
//  FreshFarmEats
//
//  Created by Harman singh on 2021-02-16.
//

import SwiftUI

struct ContentView: View {
    @State private var favoriteColor = "Farms"
    var colors = ["Farms", "Products"]

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    Picker(selection: $favoriteColor, label: Text("What is your favorite color?")) {
                        ForEach(colors, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()
                    FarmView()
                }
            }
            .navigationTitle("Fresh Farm Eats")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice("iPhone 11")

        }
    }
}
