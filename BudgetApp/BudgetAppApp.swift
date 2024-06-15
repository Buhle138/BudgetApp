//
//  BudgetAppApp.swift
//  BudgetApp
//
//  Created by Buhle Radzilani on 2024/06/15.
//

import SwiftUI

@main
struct BudgetAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
            //making the coredata manager to be accessible in our content view
                .environment(\.managedObjectContext, CoreDateManager.shared.viewContext)
            
        }
    }
}
