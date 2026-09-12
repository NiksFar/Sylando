//
//  ShirtListRowView.swift
//  Sylando
//
//  Created by Mykyta on 10.09.26.
//

import SwiftUI

struct ShirtListRowView: View {
    
    @Environment(ShirtsViewModel.self) private var shirtsVM
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
                shirtsVM.deleteShirt(shirt: shirt)
            } label: {
                Label("Löschen", systemImage: "trash")
            }
            .tint(.red)
        }
        
        .swipeActions(edge: .leading) {
            Button {
                cartVM.addToCart(shirt: shirt)
            } label: {
                Label("Add", systemImage: "cart.fill")
            }
            .tint(.green)
        }
        
    }
        
}

#Preview {
    ShirtListRowView(shirt: Shirt(title: "Graphic Print Tee", price: 24.99, size: "S"))
        .environment(ShirtsViewModel())
        .environment(CartViewModel())
}
