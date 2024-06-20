//
//  BudgetListView.swift
//  BudgetApp
//
//  Created by Buhle Radzilani on 2024/06/20.
//

import SwiftUI

struct BudgetListView: View {
    
    let budgetCategoryResults: FetchedResults<BudgetCategory>
    
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
                   
                    
                }
            }else{
                Text("No budget categories exists")
            }
        }
        
        
    }
}

