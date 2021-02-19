//
//  ProductViewModel.swift
//  FreshFarmEats
//
//  Created by Harman singh on 2021-02-18.
//

import Foundation

class ProductViewModel: ObservableObject {
    
    @Published var products: [ProductType] = []
    
    func fetchProducts() {
        guard let url = URL(string: "https://ffe1.azurewebsites.net/api/getProducts?code=dC0sG4Cgg0ee6Ny1AZzfvFmn1VxHjYlNUiByB89hXzE9YmrcwWF5pw==") else {
            print("Your API end point is Invalid")
            return
        }
        let request = URLRequest(url: url)


        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let data = data {
                if let response = try? JSONDecoder().decode([ProductType].self, from: data) {
                    DispatchQueue.main.async {
                        self.products = response
                    }
                    return
                }
            }
        }.resume()
    }
}
