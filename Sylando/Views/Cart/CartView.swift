//
//  CartView.swift
//  Sylando
//
//  Created by Mykyta on 07.09.26.
//

import SwiftUI

struct CartView: View {
    
    @Environment(CartViewModel.self) private var cartVM
    
    var body: some View {
        
        NavigationStack {
            VStack {
                List {
                    ForEach(cartVM.shirtsToBuy) { shirt in
                        ShirtListRowView(shirt: shirt)
                    }
                }
                NavigationLink(destination: CartCheckoutView()) {
                    Text("Bestellung aufgeben")
                }
            }
        }
    }
}

#Preview {
    CartView()
        .environment(CartViewModel())
}
