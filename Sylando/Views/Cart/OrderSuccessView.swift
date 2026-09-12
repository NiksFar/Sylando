//
//  OrderSuccessView.swift
//  Sylando
//
//  Created by Mykyta on 10.09.26.
//

import SwiftUI

struct OrderSuccessView: View {
    
    @Binding var cartNavigationPath: NavigationPath
    
    var body: some View {
        
        VStack{
            Image(systemName: "checkmark.circle.fill")
                .resizable()
                .frame(width: 50, height: 50)
                .foregroundStyle(.green)
            Text("Bestellung erfolgreich!")
                .font(.title2)
        }
        .onAppear {
            Task {
                try await Task.sleep(for: .seconds(3))
                cartNavigationPath = NavigationPath()
            }
        }
    }
}

#Preview {
    OrderSuccessView(cartNavigationPath: .constant(NavigationPath()))
}
