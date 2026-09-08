//
//  CartCheckoutView.swift
//  Sylando
//
//  Created by Mykyta on 07.09.26.
//

import SwiftUI

struct CartCheckoutView: View {
    
    @State private var name: String = ""
    @State private var street: String = ""
    @State private var city: String = ""
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 15) {
                
                TextField("Name", text: $name)
                TextField("Straße", text: $street)
                TextField("Stadt", text: $city)
                
                NavigationLink(destination: CartSummaryView(name: name, street: street, city: city), label: {
                    Text("Zur Bestellübersicht")
                })
            }
        }
        .padding(20)
    }
}

#Preview {
    CartCheckoutView()
}
