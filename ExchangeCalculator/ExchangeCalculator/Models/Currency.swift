//
//  Currency.swift
//  ExchangeCalculator
//
//  Created by Anastasia Gorbunova on 06.11.2026.
//

import Foundation

struct Currency: Hashable, Identifiable {
    var id: String {
        name
    }
    let name: String
    let flagName: String
    let symbol: String
    //var ask: Decimal
    //var bid: Decimal
}
