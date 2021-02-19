//
//  FarmView.swift
//  FreshFarmEats
//
//  Created by Harman singh on 2021-02-17.
//

import SwiftUI

struct FarmListView: View {
    @ObservedObject var viewmodel = FarmViewModel()
    @Binding var filters: [Int]
    
    var body: some View {
        ScrollView{
            ForEach(self.viewmodel.farms, id: \.name) { farm in
                if filters.count == 0 || farm.products.contains(where: {filters.contains($0.id)}) {
                    NavigationLink(destination: FarmDetailView(farm: farm)) {
                        FarmView(farm: farm)
                    }
                }
            }
        }
        .onAppear(perform: self.viewmodel.fetchFarms)
    }
}

//struct FarmListView_Previews: PreviewProvider {
//    static var previews: some View {
//        FarmListView()
//    }
//}
