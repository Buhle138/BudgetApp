//
//  BudgetCategory+CoreDataClass.swift
//  BudgetApp
//
//  Created by Buhle Radzilani on 2024/06/15.
//

import Foundation
import CoreData


@objc(BudgetCategory)
public class BudgetCategory: NSManagedObject {
   
    //when you create a new object in coreData, 'awakeFromInsert is automaticallly called.
    //So it's a good place to set up default values for the object properties.
    public override func awakeFromInsert() {
        self.dateCreated = Date()
    }
    
    
}
