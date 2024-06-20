//
//  ContentView.swift
//  BudgetApp
//
//  Created by Buhle Radzilani on 2024/06/15.
//

import SwiftUI

struct ContentView: View {

    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(sortDescriptors: []) private var budgetCategoryResults:
    FetchedResults<BudgetCategory>
    @State private var isPresented: Bool = false
    
    var total: Double {
        budgetCategoryResults.reduce(0) { result, budgetCategory in
            return result + budgetCategory.total
        }
    }

    var body: some View {
        NavigationStack{
            VStack {
                
                Text(total as NSNumber, formatter: NumberFormatter.currency)
                    .fontWeight(.bold)
                
                //deleting that specific object from the SQLite database.
                BudgetListView(budgetCategoryResults: budgetCategoryResults, onDeleteBudgetCategory: {budgetCategory in
                    viewContext.delete(budgetCategory)
                    do{
                        try viewContext.save()
                    }catch {
                        print(error)
                    }
                    
                })
            }
            .sheet(isPresented: $isPresented, content: {
                AddBudgetCategoryView()
            })
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add Category"){
                        isPresented = true
                    }
                }
            } .padding()
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
