//
//  CartSummaryView.swift
//  Sylando
//
//  Created by Mykyta on 08.09.26.
//

import SwiftUI

struct CartSummaryView: View {
    
    @Environment(CartViewModel.self) private var cartVM
    @Binding var cartNavigationPath: NavigationPath
    
    var name: String
    var street: String
    var city: String
    
    var body: some View {
        
            Form {
                Section(header: Text("Lieferadresse")) {
                    Text(name)
                    Text(street)
                    Text(city)
                }
                
                Section(header: Text("Bestellübersicht")) {
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
                HStack {
                    Text("Zwischensumme:")
                    Spacer()
                    Text("\(cartVM.subtotal, specifier: "%.2f") €")
                }
                
                Section {
                    Button("Bestellung abschicken") {
                        cartVM.clearCart()
                        cartNavigationPath.append(CartNavigationPath.success)
                    }
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(.white)
                    .listRowBackground(Color(.blue))
                }
            }
        
    }
}

#Preview {
    CartSummaryView(cartNavigationPath: .constant(NavigationPath()), name: "Alex", street: "Street 33", city: "Berlin")
        .environment(CartViewModel())
}
