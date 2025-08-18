//
//  Double+Ext.swift
//  WearX
//
//  Created by Denys Babych on 18/08/2025.
//

import Foundation

extension Double {
    var formatCurrency: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale.current

        return formatter.string(from: NSNumber(value: self)) ?? "$\(String(format: "%.2f", self))"
    }
}
