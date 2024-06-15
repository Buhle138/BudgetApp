//
//  AddBudgetCategoryView.swift
//  BudgetApp
//
//  Created by Buhle Radzilani on 2024/06/16.
//

import SwiftUI

struct AddBudgetCategoryView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @State private var title: String = ""
    @State private var total: Double = 100
    
    var body: some View {
        NavigationStack{
            
            Form{
                TextField("Title", text: $title)
                Slider(value: $total, in: 0...500, step: 50){
                    Text("Total")
                }minimumValueLabel: {
                    Text("$0")
                }maximumValueLabel: {
                    Text("$500")
                }
                
                Text("$\(total)")
                
                
            }.toolbar {
                ToolbarItem(placement: .navigationBarLeading){
                    Button("Cancel"){
                        
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing){
                    Button("Save"){
                        
                    }
                }
           
            }
        }
    }
}

struct AddBudgetCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        AddBudgetCategoryView()
    }
}
