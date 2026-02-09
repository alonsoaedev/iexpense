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
            Section(type) {
                ForEach(expenses) { item in
                    ExpenseView(item: item)
                }
                .onDelete(perform: removeItems)
            }
        }
    }
    
    init(type: String, sortOrder: [SortDescriptor<Expense>]) {
        self.type = type
        _expenses = type == "All"
            ? Query(sort: sortOrder)
            : Query(filter: #Predicate<Expense> { $0.type == type}, sort: sortOrder)
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
