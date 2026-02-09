//
//  ExpensesView.swift
//  iExpense
//
//  Created by Alonso Acosta on 09/02/26.
//

import SwiftData
import SwiftUI

struct ExpensesView: View {
    @Environment(\.modelContext) var modelContext
    @Query var expenses: [Expense]
    
    let type: String
    
    var body: some View {
        List {
            Section("Personal") {
                ForEach(expenses) { item in
                    if item.type == type {
                        ExpenseView(item: item)
                    }
                }
                .onDelete(perform: removeItems)
            }
        }
    }
    
    init(type: String, sortOrder: [SortDescriptor<Expense>]) {
        self.type = type
        _expenses = Query(sort: sortOrder)
    }
    
    func removeItems(at offsets: IndexSet) {
        for index in offsets {
            modelContext.delete(expenses[index])
        }
    }
}

#Preview {
    ExpensesView(type: "Personal", sortOrder: [SortDescriptor(\Expense.amount)])
}
