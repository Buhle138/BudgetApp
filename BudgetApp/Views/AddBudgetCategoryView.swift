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
    @State private var messages: [String] = []
    
    //Adding validation
    var isFormValid: Bool {
        //if the form is valid we first remove all the error messages and then we perform validation
        messages.removeAll()
        
        if title.isEmpty {
            messages.append("Title is required")
        }
       
        if total <= 0 {
            messages.append("Total should be greater than 1")
        }
        
        return messages.count == 0
    }
    
    private func save() {
        //sending the data to the core data.
       let budgetCategory =  BudgetCategory(context: viewContext)
        budgetCategory.name = title
        budgetCategory.total = total
        
        do {
            try viewContext.save()
        }catch {
            print(error.localizedDescription)
        }
        
    }
    
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
                
                Text(total as NSNumber, formatter: NumberFormatter.currency)
                //adding the frame so that we can center it.
                    .frame(maxWidth: .infinity, alignment: .center)
                
                ForEach(messages, id: \.self){message in
                    Text(message)
                    
                }
                
            }.toolbar {
                ToolbarItem(placement: .navigationBarLeading){
                    Button("Cancel"){
                        
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing){
                    Button("Save"){
                        if isFormValid {
                            save()
                        }
                       
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
