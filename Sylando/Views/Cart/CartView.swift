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
