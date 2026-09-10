//
//  CartSummaryView.swift
//  Sylando
//
//  Created by Mykyta on 08.09.26.
//

import SwiftUI

struct CartSummaryView: View {
    
    @Environment(CartViewModel.self) private var cartVM
    
    @State private var isOrderConfirmed = false
    
    var name: String
    var street: String
    var city: String
    
    var body: some View {
        
        NavigationStack {
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
                        isOrderConfirmed = true
                    }
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(.white)
                    .listRowBackground(Color(.blue))
                }
            }
        }
        .navigationDestination(isPresented: $isOrderConfirmed, destination: {
            OrderSuccessView()
        })
    }
}

#Preview {
    CartSummaryView(name: "Alex", street: "Street 33", city: "Berlin")
        .environment(CartViewModel())
}
