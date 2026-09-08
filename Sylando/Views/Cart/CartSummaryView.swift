//
//  CartSummaryView.swift
//  Sylando
//
//  Created by Mykyta on 08.09.26.
//

import SwiftUI

struct CartSummaryView: View {
    
    @Environment(CartViewModel.self) private var cartVM
    
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
                    ForEach(cartVM.shirtsToBuy) { item in
                        VStack(alignment: .leading) {
                            HStack {
                                Text(item.title)
                                Spacer()
                                Text("\(item.price, specifier: "%.2f") €")
                            }
                            Text(item.size)
                        }
                    }
                }
                HStack {
                    Text("Zwischensumme:")
                    Spacer()
                    Text("\(cartVM.subtotal, specifier: "%.2f") €")
                }
                
                
            }
            
        
        
    }
}

#Preview {
    CartSummaryView(name: "Alex", street: "Street 33", city: "Berlin")
        .environment(CartViewModel())
}
