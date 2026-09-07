//
//  ShirtListView.swift
//  Sylando
//
//  Created by Mykyta on 07.09.26.
//

import SwiftUI

struct ShirtListView: View {
    
    @State var shirtsViewModel = ShirtsViewModel()
    
    var body: some View {
        
        NavigationStack {
            List {
                ForEach(shirtsViewModel.shirts) { shirt in
                    Text(shirt.title)
                }
            }
        }
        .navigationTitle(Text("T-Shirts"))
    }
}

#Preview {
    ShirtListView()
}
