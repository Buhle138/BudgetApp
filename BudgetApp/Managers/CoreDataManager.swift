//
//  CoreDataManager.swift
//  BudgetApp
//
//  Created by Buhle Radzilani on 2024/06/16.
//

import Foundation
import CoreData

class CoreDateManager {
    
    static let shared = CoreDateManager()
    private var persistentContainer: NSPersistentContainer
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "BudgetModel")
        persistentContainer.loadPersistentStores{description, error in
            if let error {
                fatalError("Unable to initialize core data stack \(error)")
            }
        }
    }
    
    var viewContext: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
}
