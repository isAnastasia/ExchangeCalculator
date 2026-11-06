//
//  ContentView.swift
//  ExchangeCalculator
//
//  Created by Anastasia Gorbunova on 03.11.2026.
//

import SwiftUI

struct Currency {
    let name: String
    let flagName: String
    let symbol: String
}

struct CalculatorView: View {
    private var currencies: [Int : Currency] = [
        1: Currency(name: "USDs", flagName: "USA", symbol: "$"),
        2: Currency(name: "MXN", flagName: "MEX", symbol: "$"),
        3: Currency(name: "ARS", flagName: "ARG", symbol: "$"),
        4: Currency(name: "BRL", flagName: "BRL", symbol: "$")
    ]
    @State var selectedCurrency: Int
    @State var firstCurrency: String = ""
    @State var isChooseCurrencySheetShown = true
    
    init() {
        self.selectedCurrency = 1
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            titleView
                .padding(.top, 66)
            
            inputCurrencyView
            
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color(UIColor.systemGray6))
        .sheet(isPresented: $isChooseCurrencySheetShown) {
            ChooseCurrencyView()
                .presentationDetents([.medium, .large])
        }
    }
    
    private var titleView: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Exchange calculator")
                .font(.system(size: 30, weight: .bold))
            
            Text("1 USDc = 540.1324 ARS")
                .foregroundStyle(Color.green)
                .font(.system(size: 16, weight: .semibold))
        }
        
    }
    
    private var inputCurrencyView: some View {
        ZStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 16) {
                upInputField
                downInputField
            }
            
            swapCurrenciesButton
                .frame(maxWidth: .infinity, alignment: .center)
            
        }
    }
    
    private var swapCurrenciesButton: some View {
        Button(action: {}) {
            Image("ArrowButton")
                .frame(width: 24, height: 24)
        }
    }
    
    private var upInputField: some View {
        HStack(spacing: 16) {
            Button(action: {}) {
                HStack {
                    Image("USA")
                    
                    Text("USDs")
                        .foregroundStyle(Color.black)
                }
                
            }
            TextField("$9,999", text: $firstCurrency)
                .multilineTextAlignment(.trailing)
                .keyboardType(.numberPad)
        }
        .padding(.vertical, 23)
        .padding(.horizontal, 16)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        
    }
    
    private var downInputField: some View {
        HStack(spacing: 16) {
            Button(action: {
                isChooseCurrencySheetShown.toggle()
            }) {
                HStack {
                    Image("MEX")
                    
                    Text("MXN")
                        .foregroundStyle(Color.black)
                    
                    Image("ChevronDown")
                        .foregroundStyle(Color.black)
                }
                
            }
            TextField("$184,065.99", text: $firstCurrency)
                .multilineTextAlignment(.trailing)
                .keyboardType(.numberPad)
        }
        .padding(.vertical, 23)
        .padding(.horizontal, 16)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    CalculatorView()
}
