//
//  OrderSuccessView.swift
//  Sylando
//
//  Created by Mykyta on 10.09.26.
//

import SwiftUI

struct OrderSuccessView: View {
    
    var body: some View {
        
        VStack{
            Image(systemName: "checkmark.circle.fill")
                .resizable()
                .frame(width: 50, height: 50)
                .foregroundStyle(.green)
            Text("Bestellung erfolgreich!")
                .font(.title2)
        }
        
    }
}

#Preview {
    OrderSuccessView()
}
