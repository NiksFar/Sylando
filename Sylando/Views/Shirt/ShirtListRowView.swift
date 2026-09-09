//
//  ShirtListRowView.swift
//  Sylando
//
//  Created by Mykyta on 10.09.26.
//

import SwiftUI

struct ShirtListRowView: View {
    
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
    }
}

#Preview {
    ShirtListRowView(shirt: Shirt(title: "Graphic Print Tee", price: 24.99, size: "S"))
}
