//
//  AddView.swift
//  iExpense
//
//  Created by Alonso Acosta Enriquez on 25/10/25.
//

import SwiftData
import SwiftUI

struct AddView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var name = "Name"
    @State private var type = "Personal"
    @State private var currency: String = "USD"
    @State private var amount = 0.0
    
    let types = ["Business", "Personal"]
    let currencies = ["USD", "CAD", "MXN", "EUR", "GBP", "JPY"]
    
    var body: some View {
        NavigationStack {
            Form {
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                
                Picker("Currency", selection: $currency) {
                    ForEach(currencies, id: \.self) {
                        Text($0)
                    }
                }
                TextField("Amount", value: $amount, format: .currency(code: currency))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle($name)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button("Save") {
                    let expense = Expense(name: name, type: type, amount: amount, currency: currency)
                    modelContext.insert(expense)
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    AddView()
}
