//
//  ExchangeCalculatorApp.swift
//  ExchangeCalculator
//
//  Created by Anastasia Gorbunova on 03.11.2026.
//

import SwiftUI

@main
struct ExchangeCalculatorApp: App {
    var body: some Scene {
        WindowGroup {
            CalculatorView(networkService: NetworkServiceImpl())
        }
    }
}
