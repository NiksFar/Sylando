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
                
                if let quote = shirtsViewModel.quote {
                    ZStack {
                        Image(systemName: "tshirt.fill")
                            .font(.system(size: 200))
                            .fontWeight(.ultraLight)
                            .foregroundStyle(.blue)
                        
                        Text(quote.text)
                            .font(.caption)
                            .fontWeight(.bold)
                            .frame(width: 110)
                            .foregroundStyle(.white)
                            .multilineTextAlignment(.center)
                    }
                    .frame(maxWidth: .infinity)
                }
                
                Section {
                    Button("Zitat laden") {
                        shirtsViewModel.fetchQuote()
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
                
                Button("Speichern") {
                    addShirt()
                }
                .frame(maxWidth: .infinity)
            }
        }
        .navigationTitle(Text("Neues T-Shirt"))
    }
    
    private func addShirt() {
        let newShirt = Shirt(title: title, price: Double(price) ?? 0, size: size.rawValue)
        shirtsViewModel.addNewShirt(shirt: newShirt)
        isPresented = false
    }
    
}

#Preview {
    ShirtAddView(shirtsViewModel: ShirtsViewModel(), isPresented: .constant(true))
}
