//
//  Expenses.swift
//  iExpense
//
//  Created by Alonso Acosta on 09/02/26.
//

import Foundation
import SwiftData

@Model
class Expense {
    var id: UUID = UUID()
    var name: String
    var type: String
    var amount: Double
    var currency: String
    
    init(name: String, type: String, amount: Double, currency: String) {
        self.name = name
        self.type = type
        self.amount = amount
        self.currency = currency
    }
}
