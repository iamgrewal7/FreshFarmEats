//
//  FarmViewModel.swift
//  FreshFarmEats
//
//  Created by Harman singh on 2021-02-17.
//

import Foundation

class FarmViewModel: ObservableObject {
    
    @Published var farms: [Farm] = []
    
    func fetchFarms() {
        guard let url = URL(string: "https://ffe1.azurewebsites.net/api/getFarms?code=iecrAzthkqmzggSyUub2AcOJAhS2ykh5RXz0SlYexuBVze0aq6ytKA==") else {
            print("Your API end point is Invalid")
            return
        }
        let request = URLRequest(url: url)


        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let data = data {
                if let response = try? JSONDecoder().decode([Farm].self, from: data) {
                    DispatchQueue.main.async {
                        let sortedResponse = response.sorted {
                            $0.distance < $1.distance
                        }
                        self.farms = sortedResponse
                    }
                    return
                }
            }
        }.resume()
    }
}
