//
//  ShirtListView.swift
//  Sylando
//
//  Created by Mykyta on 07.09.26.
//

import SwiftUI

struct ShirtListView: View {
    
    @Environment(CartViewModel.self) private var cartVM
    
    @State private var shirtsViewModel = ShirtsViewModel()
    @State private var addNewShirt: Bool = false
    
    var body: some View {
        
        NavigationStack {
            List {
                ForEach(shirtsViewModel.shirts) { shirt in
                    ShirtListRowView(shirt: shirt)
                }
            }
            .toolbar {
                Button {
                    addNewShirt = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .navigationTitle(Text("T-Shirts"))
        
        .sheet(isPresented: $addNewShirt, content: {
            ShirtAddView(shirtsViewModel: shirtsViewModel,
                         isPresented: $addNewShirt)
        })
    }
}

#Preview {
    ShirtListView()
        .environment(CartViewModel())
}
