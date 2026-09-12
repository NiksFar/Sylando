//
//  CartListRowView.swift
//  Sylando
//
//  Created by Mykyta on 13.09.26.
//

import SwiftUI

struct CartListRowView: View {

    @Environment(CartViewModel.self) private var cartVM
    
    let shirt: Shirt
    
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack {
                Text(shirt.title)
                Spacer()
                Text("\(shirt.price, specifier: "%.2f") €")
            }
            Text(shirt.size)
        }
        
        .swipeActions(edge: .trailing) {
            Button {
                cartVM.deleteFromCart(shirt: shirt)
            } label: {
                Label("Löschen", systemImage: "trash")
            }
            .tint(.red)
        }
    }
        
}

#Preview {
    CartListRowView(shirt: Shirt(title: "Graphic Print Tee", price: 24.99, size: "S"))
        .environment(CartViewModel())
}
