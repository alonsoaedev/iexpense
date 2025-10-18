//
//  ContentView.swift
//  iExpense
//
//  Created by Alonso Acosta Enriquez on 17/10/25.
//

import SwiftUI

struct SecondView: View {
    @Environment(\.dismiss) var dismiss
    let name: String
    
    var body: some View {
        Text("Hello, \(name)!")
            .font(.title)
        
        Button("Dismiss") {
            dismiss()
        }
    }
}

struct ContentView: View {
    @State private var showSheet: Bool = false
    
    var body: some View {
        Button("Show Sheet") {
            showSheet.toggle()
        }
        .sheet(isPresented: $showSheet) {
            SecondView(name: "@alonsoae.dev")
        }
    }
}

#Preview {
    ContentView()
}
