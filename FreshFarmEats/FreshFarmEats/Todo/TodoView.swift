//
//  TodoView.swift
//  FreshFarmEats
//
//  Created by Harman singh on 2021-02-17.
//

import SwiftUI

struct TodoView: View {
    var name: String
    @ObservedObject var viewmodel = TodoViewModel()
    
    
    var body: some View {
        VStack {
            Image(self.name)
                .resizable()
                .aspectRatio(contentMode: .fit)
 
            HStack {
                VStack(alignment: .leading) {
                    Text("SwiftUI")
                        .font(.headline)
                        .foregroundColor(.secondary)
                    Text("Drawing a Border with Rounded Corners")
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                        .lineLimit(3)
                    Text("Written by Simon Ng".uppercased())
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .layoutPriority(100)
 
                Spacer()
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

struct TodoView_Previews: PreviewProvider {
    static var previews: some View {
        TodoView(name: "swiftui-button")
    }
}
