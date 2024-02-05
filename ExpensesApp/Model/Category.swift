//
//  Category.swift
//  ShowApp
//
//  Created by Nikhil Vaddey on 1/19/24.
//

import SwiftUI
import SwiftData

@Model
class Category {
    var categoryName: String
    // Category Expenses
    @Relationship(deleteRule: .cascade, inverse: \Expense.category)
    var expenses: [Expense]?
    
    init(categoryName: String) {
        self.categoryName = categoryName
        self.expenses = expenses
    }
}
