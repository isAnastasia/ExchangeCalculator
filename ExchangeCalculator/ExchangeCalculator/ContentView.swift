//
//  ContentView.swift
//  ExchangeCalculator
//
//  Created by Anastasia Gorbunova on 03.11.2026.
//

import SwiftUI

struct ContentView: View {
    @State var firstCurrency: String = ""
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            titleView
                .padding(.top, 66)
            
            inputCurrencyView
            
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color(UIColor.systemGray5))
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
        VStack(alignment: .leading, spacing: 16) {
            upInputField
            
            downInputField
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
        }
        .padding(.vertical, 23)
        .padding(.horizontal, 16)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        
    }
    
    private var downInputField: some View {
        HStack(spacing: 16) {
            Button(action: {}) {
                HStack {
                    Image("MEX")
                    
                    Text("MXN")
                        .foregroundStyle(Color.black)
                }
                
            }
            TextField("$184,065.99", text: $firstCurrency)
                .multilineTextAlignment(.trailing)
        }
        .padding(.vertical, 23)
        .padding(.horizontal, 16)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    ContentView()
}
