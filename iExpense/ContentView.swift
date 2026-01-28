//
//  ContentView.swift
//  iExpense
//
//  Created by Alonso Acosta Enriquez on 17/10/25.
//

import SwiftUI

struct ExpenseItem: Identifiable, Codable {
    var id: UUID = UUID()
    let name: String
    let type: String
    let amount: Double
    let currency: String
}

@Observable
class Expenses {
    var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }

        items = []
    }
}

struct ExpenseItemView: View {
    var item: ExpenseItem
    
    var color: Color {
        if item.amount > 100 {
            return .red
        }
        
        if item.amount > 10 {
            return .yellow
        }
        
        return .green
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                Text(item.type)
            }
            
            Spacer()
            Text(item.amount, format: .currency(code: item.currency))
                .foregroundStyle(color)
        }
    }
}

struct ContentView: View {
    @State private var expenses: Expenses = Expenses()
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                List {
                    Section("Personal") {
                        ForEach(expenses.items) { item in
                            if item.type == "Personal" {
                                ExpenseItemView(item: item)
                            }
                        }
                        .onDelete(perform: removeItems)
                    }
                }
                
                List {
                    Section("Business") {
                        ForEach(expenses.items) { item in
                            if item.type == "Business" {
                                ExpenseItemView(item: item)
                            }
                        }
                        .onDelete(perform: removeItems)
                    }
                }
            }
            .navigationTitle("iExpense")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                NavigationLink("Add expense") {
                    AddView(expenses: expenses)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
