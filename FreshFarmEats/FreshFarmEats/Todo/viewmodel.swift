//
//  viewmodel.swift
//  FreshFarmEats
//
//  Created by Harman singh on 2021-02-17.
//

import Foundation

class TodoViewModel: ObservableObject {
    
    @Published var todos: [Todo] = []
    
    func fetchToods() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos") else {
            print("Your API end point is Invalid")
            return
        }
        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let response = try? JSONDecoder().decode([Todo].self, from: data) {
                    DispatchQueue.main.async {
                        self.todos = response
                    }
                    return
                }
            }
        }.resume()
    }
}
