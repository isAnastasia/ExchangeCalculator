//
//  ChooseCurrencyViewModel.swift
//  ExchangeCalculator
//
//  Created by Anastasia Gorbunova on 08.11.2026.
//

import Foundation

final class ChooseCurrencyViewModel: ObservableObject {
    @Published var currencies: [Currency] = []
    
    @Published var choosenCurrency: Currency
    
    private var networkService = NetworkServiceImpl()
    
    init(choosenCurrency: Currency) {
        self.choosenCurrency = choosenCurrency
        self.fetchData()
    }
    
    func isChoosenCurrency(_ currency: Currency) -> Bool {
        return choosenCurrency.name == currency.name
    }
    
    private func fetchData() {
        self.currencies = networkService.fetchCurrencies()
    }
}
