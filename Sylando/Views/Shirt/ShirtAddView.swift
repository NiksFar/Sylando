//
//  ShirtAddView.swift
//  Sylando
//
//  Created by Mykyta on 08.09.26.
//

import SwiftUI

struct ShirtAddView: View {
    
    @Bindable var shirtsViewModel: ShirtsViewModel
    @Binding var isPresented: Bool
    
    @State private var title: String = ""
    @State private var size: Size = .s
    @State private var price: String = "0"
    
    var body: some View {
        
        NavigationStack {
            Form {
                
                Section {
                    Button("Zitat laden") {
                       //
                    }
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(.white)
                    .listRowBackground(Color(.blue))
                }
                
                TextField("Titel", text: $title)
                
                Picker("Größe", selection: $size) {
                    ForEach(Size.allCases) {
                        Text($0.title).tag($0)
                    }
                }
                
                TextField("Preis", text: $price)
                    .keyboardType(.decimalPad)
                
            }
        }
        .navigationTitle(Text("Neues T-Shirt"))
    }
}

#Preview {
    ShirtAddView(shirtsViewModel: ShirtsViewModel(), isPresented: .constant(true))
}
