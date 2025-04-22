//
//  coffeeOptions.swift
//  coffeeapp
//
//  Created by Rajayogan on 22/04/25.
//

import Foundation

struct coffeeOptions: Identifiable {
    private(set) var id: Tab
    
    enum Tab: String, CaseIterable {
        case cappuccino = "Cappuccino"
        case espresso = "Espresso"
        case latte = "Latte"
        case flatwhite = "Flat White"
    }
}
