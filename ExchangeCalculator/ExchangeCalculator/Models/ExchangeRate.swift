//
//  ExchangeRate.swift
//  ExchangeCalculator
//
//  Created by Anastasia Gorbunova on 10.11.2026.
//

import Foundation

struct ExchangeRate {
    let ask: Decimal
    let bid: Decimal
    let baseCurrency: String
    let quoteCurrency: String
    let date: Date
}

struct ExchangeRateDTO: Decodable {
    let ask: String
    let bid: String
    let book: String
    let date: String
}

