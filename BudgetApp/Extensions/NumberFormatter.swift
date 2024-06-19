//
//  NumberFormatter.swift
//  BudgetApp
//
//  Created by Buhle Radzilani on 2024/06/19.
//

import Foundation

extension NumberFormatter {
    static var currency: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }
}
