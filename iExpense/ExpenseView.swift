//
//  ExpenseItemView.swift
//  iExpense
//
//  Created by Alonso Acosta on 09/02/26.
//

import SwiftData
import SwiftUI

struct ExpenseView: View {
    @Bindable var item: Expense
    
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

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Expense.self, configurations: config)
        let expense = Expense(name: "Mac mini", type: "Personal", amount: 1500, currency: "USD")
        
        return ExpenseView(item: expense)
            .modelContainer(container)
    } catch {
        return Text("Failed to load preview")
    }
}
