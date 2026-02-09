//
//  ContentView.swift
//  iExpense
//
//  Created by Alonso Acosta Enriquez on 17/10/25.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Query var expenses: [Expense]
    
    @State private var sortOrder = [
        SortDescriptor(\Expense.amount),
        SortDescriptor(\Expense.name),
    ]
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                ExpensesView(type: "Personal", sortOrder: sortOrder)
                
                ExpensesView(type: "Business", sortOrder: sortOrder)
            }
            .navigationTitle("iExpense")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                NavigationLink("Add expense") {
                    AddView()
                }
                
                Menu("Sort", systemImage: "arrow.up.arrow.down") {
                    Picker("Sort", selection: $sortOrder) {
                        Text("Sort by Amount")
                            .tag([
                                SortDescriptor(\Expense.amount),
                                SortDescriptor(\Expense.name),
                            ])
                        
                        Text("Sort by Name")
                            .tag([
                                SortDescriptor(\Expense.name),
                                SortDescriptor(\Expense.amount),
                            ])
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
