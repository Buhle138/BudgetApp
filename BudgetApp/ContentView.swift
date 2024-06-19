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

    var body: some View {
        NavigationStack{
            VStack {
                List(budgetCategoryResults) {budgetCategory in
                    Text(budgetCategory.name ?? "")
                    
                }
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
