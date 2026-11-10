//
//  ContentView.swift
//  ExchangeCalculator
//
//  Created by Anastasia Gorbunova on 03.11.2026.
//

import SwiftUI

struct CalculatorView: View {
    @StateObject private var viewModel: CalculatorViewModel
    
    init(networkService: NetworkService) {
        _viewModel = StateObject(wrappedValue: CalculatorViewModel(networkService: networkService))
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
        .sheet(isPresented: $viewModel.isChooseCurrencySheetShown) {
            if let choosenCurrency = viewModel.choosenCurrency {
                
                ChooseCurrencyView(onSelect: viewModel.onSelect(_:), close: viewModel.close, choosenCurrency)
                    .presentationDetents([.medium, .large])
            }
            
        }
        .onAppear {viewModel.fetchData()}
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
    
    private var swapCurrenciesButton: some View {
        Button(action: {}) {
            Image("ArrowButton")
                .frame(width: 24, height: 24)
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
    
    private var upInputField: some View {
        HStack(spacing: 16) {
            Button(action: {}) {
                HStack {
                    Image("USA")
                        .resizable()
                        .frame(width: 16, height: 16)
                    
                    Text("USDs")
                        .foregroundStyle(Color.black)
                }
                
            }
            TextField("$9,999", text: $viewModel.dollarInput)
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
                viewModel.isChooseCurrencySheetShown.toggle()
            }) {
                HStack {
                    Image(viewModel.choosenCurrency?.flagName ?? "USA")
                        .resizable()
                        .frame(width: 16, height: 16)
                    
                    Text(viewModel.choosenCurrency?.name ?? "USDs")
                        .foregroundStyle(Color.black)
                    
                    Image("ChevronDown")
                        .foregroundStyle(Color.black)
                }
                
            }
            TextField("$184,065.99", text: $viewModel.currencyInput)
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
    CalculatorView(networkService: NetworkServiceImpl.shared)
}
