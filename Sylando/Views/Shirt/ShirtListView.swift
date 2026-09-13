//
//  ShirtListView.swift
//  Sylando
//
//  Created by Mykyta on 07.09.26.
//

import SwiftUI

struct ShirtListView: View {
    
    @Environment(CartViewModel.self) private var cartVM
    @Environment(ShirtsViewModel.self) private var shirtsVM
    
    @State private var addNewShirt: Bool = false
    
    var body: some View {
        
        NavigationStack {
            List {
                ForEach(shirtsVM.shirts) { shirt in
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
            ShirtAddView(shirtsViewModel: shirtsVM,
                         isPresented: $addNewShirt)
        })
    }
}

#Preview {
    ShirtListView()
        .environment(CartViewModel())
        .environment(ShirtsViewModel(quoteRepository: LocalQuoteRepository()))
}
