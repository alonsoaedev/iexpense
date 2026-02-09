//
//  ContentView.swift
//  iExpense
//
//  Created by Alonso Acosta Enriquez on 17/10/25.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var expenses: [Expense]
    
    func removeItems(at offsets: IndexSet) {
        for index in offsets {
            modelContext.delete(expenses[index])
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                List {
                    Section("Personal") {
                        ForEach(expenses) { item in
                            if item.type == "Personal" {
                                ExpenseView(item: item)
                            }
                        }
                        .onDelete(perform: removeItems)
                    }
                }
                
                List {
                    Section("Business") {
                        ForEach(expenses) { item in
                            if item.type == "Business" {
                                ExpenseView(item: item)
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
                    AddView()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
