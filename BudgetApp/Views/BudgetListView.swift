//
//  BudgetListView.swift
//  BudgetApp
//
//  Created by Buhle Radzilani on 2024/06/20.
//

import SwiftUI

struct BudgetListView: View {
    
    let budgetCategoryResults: FetchedResults<BudgetCategory>
    let onDeleteBudgetCategory: (BudgetCategory) -> Void
    
    var body: some View {
        
        List{
            if !budgetCategoryResults.isEmpty {
                ForEach(budgetCategoryResults){budgetCategory in
                    HStack{
                        Text(budgetCategory.name ?? "" )
                        Spacer()
                        VStack{
                            Text(budgetCategory.total as NSNumber, formatter: NumberFormatter.currency)
                        }
                    }
                }.onDelete { indexSet in
                    indexSet.map{budgetCategoryResults[$0]}.forEach(onDeleteBudgetCategory)
                }
            }else{
                Text("No budget categories exists")
            }
        }
        
        
    }
}

