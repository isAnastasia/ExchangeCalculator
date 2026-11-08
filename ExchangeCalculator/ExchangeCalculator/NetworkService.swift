//
//  NetworkService.swift
//  ExchangeCalculator
//
//  Created by Anastasia Gorbunova on 07.11.2026.
//

import Foundation

protocol NetworkService {
    func fetchCurrencies() -> [Currency]
}
final class NetworkServiceImpl: NetworkService {
    func fetchCurrencies() -> [Currency] {
        return [
            Currency(name: "COP", flagName: "COP", symbol: "$"),
            Currency(name: "EURs", flagName: "EUR", symbol: "$"),
            Currency(name: "MXN", flagName: "MEX", symbol: "$"),
            Currency(name: "ARS", flagName: "ARG", symbol: "$"),
            Currency(name: "BRL", flagName: "BRL", symbol: "$")
        ]
    }
    
    
}
