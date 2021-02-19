//
//  ContentView.swift
//  FreshFarmEats
//
//  Created by Harman singh on 2021-02-16.
//


import SwiftUI


enum ActiveSheet: Identifiable {
    case filterView, cartView
    
    var id: Int {
        hashValue
    }
}

struct CustomerView: View {
    @State var activeSheet: ActiveSheet?
    @State private var filters: [Int] = []
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Button(action: { activeSheet = .filterView }) {
                        Text("Filters")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 100, height: 30)
                            .background(Color.green)
                            .cornerRadius(15.0)
                    }
                    Spacer()
                }.padding(.horizontal)
                FarmListView(filters: $filters)
            }
            .navigationTitle("Fresh Farm Eats")
            .toolbar {
                Button(action: { activeSheet = .cartView }) {
                    Image(systemName: "cart.fill")
                }
            }
            .sheet(item: $activeSheet) { item in
                switch item {
                case .filterView:
                    FilterView(filters: $filters)
                case .cartView:
                    CartView()
                }
            }
        }
    }
}


struct SignUpView: View {
    var body: some View {
        Text("SignUpView")
    }
}

struct AuthView: View {
    @State private var phoneNumber = ""
    @State private var showErrMsg = false
    
    
    var body: some View {
        NavigationView {
            VStack{
                VStack(alignment: .leading, spacing: 15) {
                    TextField("Phone Number", text: self.$phoneNumber)
                        .padding()
                        .background(Color.white)
                }.padding([.leading, .trailing], 50)
                if self.showErrMsg {
                    Text("Error..")
                        .foregroundColor(.red)
                }
                Button(action: {}) {
                    Text("Sign In")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.green)
                        .cornerRadius(15.0)
                }.padding(.top, 50)
                
                Button(action: {}) {
                    Text("Sign Up")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.blue)
                        .cornerRadius(15.0)
                }.padding(.top, 10)
            }.navigationTitle("Authentication")
        }
    }
}

struct LoginView: View {
    
    @Binding var isCustomer: Bool
    @Binding var isSeller: Bool
    
    var body: some View {
        VStack {
            Button(action: {
                isCustomer = true
            }) {
                Text("Customer")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.green)
                    .cornerRadius(15.0)
            }
            
            Button(action: {
                isSeller = true
            }) {
                Text("Seller")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.purple)
                    .cornerRadius(15.0)
            }
        }
    }
}

struct ContentView: View {
    @State var isCustomer = false
    @State var isSeller = false
    
    var body: some View {
        return Group  {
            if isSeller {
                AuthView()
            } else if isCustomer {
                CustomerView().environmentObject(CartModel())
            } else {
                LoginView(isCustomer: $isCustomer, isSeller: $isSeller)
            }
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
