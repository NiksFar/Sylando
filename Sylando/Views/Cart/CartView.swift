//
//  CartView.swift
//  Sylando
//
//  Created by Mykyta on 07.09.26.
//

import SwiftUI

struct CartView: View {
    
    @Environment(CartViewModel.self) private var cartVM
    @State private var cartNavigationPath = NavigationPath()
    
    @State private var name = ""
    @State private var street = ""
    @State private var city = ""
    
    var body: some View {
        
        NavigationStack(path: $cartNavigationPath) {
            VStack {
                if cartVM.shirtsToBuy.isEmpty {
                    Image(systemName: "cart")
                        .resizable()
                        .frame(width: 75, height: 75)
                        .tint(.blue)
                    Text("Dein Warenkorb ist leer")
                    
                } else {
                    
                    List {
                        ForEach(cartVM.shirtsToBuy) { shirt in
                            VStack(alignment: .leading) {
                                HStack {
                                    Text(shirt.title)
                                    Spacer()
                                    Text("\(shirt.price, specifier: "%.2f") €")
                                }
                                Text(shirt.size)
                            }
                        }
                    }
                    
                    Button("Bestellung aufgeben") {
                        cartNavigationPath.append(CartNavigationPath.checkout)
                    }
                }
            }
            .navigationDestination(for: CartNavigationPath.self) { destination in
                switch destination {
                case .checkout:
                    CartCheckoutView(cartNavigationPath: $cartNavigationPath, name: $name, street: $street, city: $city)
                case .summary:
                    CartSummaryView(cartNavigationPath: $cartNavigationPath,  name: name, street: street, city: city)
                case .success:
                    OrderSuccessView(cartNavigationPath: $cartNavigationPath)
                }
            }
        }
    }
}

#Preview {
    CartView()
        .environment(CartViewModel())
}
