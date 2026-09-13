//
//  CartCheckoutView.swift
//  Sylando
//
//  Created by Mykyta on 07.09.26.
//

import SwiftUI

struct CartCheckoutView: View {
    
    @Binding var cartNavigationPath: NavigationPath
    
    @Binding var name: String
    @Binding var street: String
    @Binding var city: String
    
    var body: some View {
        
        VStack(spacing: 25) {
            
            TextField("Name", text: $name)
            TextField("Straße", text: $street)
            TextField("Stadt", text: $city)
            
            Button("Zur Bestellübersicht") {
                cartNavigationPath.append(CartNavigationPath.summary)
            }
            .buttonStyle(.borderedProminent)
        }
        .padding(20)
    }
}

#Preview {
    CartCheckoutView(
        cartNavigationPath: .constant(NavigationPath()),
        name: .constant(""),
        street: .constant(""),
        city: .constant("")
    )
}
