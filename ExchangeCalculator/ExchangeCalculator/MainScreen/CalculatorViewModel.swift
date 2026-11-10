//
//  CalculatorViewModel.swift
//  ExchangeCalculator
//
//  Created by Anastasia Gorbunova on 06.11.2026.
//

import Foundation

final class CalculatorViewModel: ObservableObject {
    @Published var choosenCurrency: Currency?
    @Published var isChooseCurrencySheetShown = false
    @Published var dollarInput: String = ""
    @Published var currencyInput: String = ""
    
    private var networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func onSelect(_ currency: Currency) {
        choosenCurrency = currency
        isChooseCurrencySheetShown = false
    }
    
    func close() {
        self.isChooseCurrencySheetShown = false
    }
    
    func fetchData() {
        Task { @MainActor in
            do {
                let currenciesNames = try await networkService.getAvailableCurrenciesMock()
                let currencies = currenciesNames.compactMap { name in
                    return Currency(name: name, flagName: name, symbol: "$")
                }
                await MainActor.run {
                    if let first = currencies.first {
                        self.choosenCurrency = first
                    }
                }
                
            }
        }
        
        
        
    }
    
}
