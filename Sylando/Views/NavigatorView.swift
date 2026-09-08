//
//  NavigatorView.swift
//  Sylando
//
//  Created by Mykyta on 07.09.26.
//

import SwiftUI

struct NavigatorView: View {
    
    @State private var cartVM = CartViewModel()
    
    var body: some View {
        
        TabView {
            Tab("T-Shirt", systemImage: "tshirt.circle.fill") {
                ShirtListView()
            }
            Tab("Cart", systemImage: "cart.circle.fill") {
                CartView()
            }
        }
        .environment(cartVM)
    }
}

#Preview {
    NavigatorView()
}
