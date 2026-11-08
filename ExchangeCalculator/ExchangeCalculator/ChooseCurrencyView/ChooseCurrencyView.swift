//
//  ChooseCurrencyView.swift
//  ExchangeCalculator
//
//  Created by Anastasia Gorbunova on 06.11.2026.
//

import SwiftUI



struct ChooseCurrencyView: View {
    @StateObject private var vm: ChooseCurrencyViewModel
    private let onSelect: (Currency) -> ()
    private let close: () -> ()
    
    init(onSelect: @escaping (Currency) -> Void, close: @escaping () -> (),  _ choosenCurrency: Currency) {
        self.onSelect = onSelect
        self.close = close
        _vm = StateObject(wrappedValue: ChooseCurrencyViewModel(choosenCurrency: choosenCurrency))
    }
    
    var body: some View {
        VStack() {
            HStack(alignment: .center) {
                Text("Choose currency")
                    .font(.system(size: 24, weight: .semibold))
                
                Spacer()
                
                Button(action: {
                    close()
                }) {
                    Image("xbutton")
                        .frame(width: 32, height: 32)
                }
            }
            .padding(.horizontal, 16)
            .padding(.top, 33)
            .padding(.bottom, 16)
            
            List {
                ForEach(vm.currencies) {currency in
                    button(currency)
                        .listRowSeparator(.hidden)
                }
            }
            .contentMargins(.top, 0)
            
            Spacer()
        }
        .background(Color(UIColor.systemGray6))
    }
    
    @ViewBuilder
    private func button(_ currency: Currency) -> some View {
        Button(action: {
            onSelect(currency)
        }) {
            HStack(spacing: 8) {

                Image(currency.flagName)
                    .resizable()
                    .frame(width: 24, height: 24)
                    .padding(6)
                    .background(.backgroundOnSecondary)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Text(currency.name)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(Color.black)
                
                Spacer()
                
                Image(systemName: vm.isChoosenCurrency(currency) ? "checkmark.circle.fill" : "circle")
                    .resizable()
                    .foregroundStyle(vm.isChoosenCurrency(currency) ? Color.green : Color.borderOnSecondary)
                    .frame(width: 24, height: 24)
            }
            .padding(.vertical, 6)
        }
        
    }
}

#Preview {
    ChooseCurrencyView(onSelect: {_ in Currency(name: "", flagName: "", symbol: "")}, close: {},  Currency(name: "", flagName: "", symbol: ""))
}
