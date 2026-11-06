//
//  ChooseCurrencyView.swift
//  ExchangeCalculator
//
//  Created by Anastasia Gorbunova on 06.11.2026.
//

import SwiftUI

struct ChooseCurrencyView: View {
    private var currencies: [Int : Currency] = [
        1: Currency(name: "USDs", flagName: "USA", symbol: "$"),
        2: Currency(name: "MXN", flagName: "MEX", symbol: "$"),
        3: Currency(name: "ARS", flagName: "ARG", symbol: "$"),
        4: Currency(name: "BRL", flagName: "BRL", symbol: "$")
    ]
    
    var body: some View {
        VStack() {
            HStack(alignment: .center) {
                Text("Choose currency")
                    .font(.system(size: 24, weight: .semibold))
                
                Spacer()
                
                Button(action: {}) {
                    Image("xbutton")
                        .frame(width: 32, height: 32)
                }
            }
            .padding(.horizontal, 16)
            .padding(.top, 33)
            .padding(.bottom, 16)
            
            List {
                ForEach(currencies.sorted{$0.key < $1.key}, id: \.key) { index, currency in
                    button(id: index)
                        .listRowSeparator(.hidden)
                }
            }
            .contentMargins(.top, 0)
            
            Spacer()
        }
        .background(Color(UIColor.systemGray6))
    }
    
    @ViewBuilder
    private func button(id: Int) -> some View {
        HStack(spacing: 8) {

            Image("USA")
                .resizable()
                .frame(width: 24, height: 24)
                .padding(6)
                .background(.backgroundOnSecondary)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Text(currencies[id]?.name ?? "")
                .font(.system(size: 16, weight: .semibold))
            
            Spacer()
            
            Image(systemName: "circle")
                .resizable()
                .foregroundStyle(Color.borderOnSecondary)
                .frame(width: 24, height: 24)
        }
        .padding(.vertical, 6)
    }
}

#Preview {
    ChooseCurrencyView()
}
