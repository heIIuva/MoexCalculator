//
//  CurrencyInput.swift
//  MoexCalculator
//
//  Created by big stepper on 13/11/2024.
//

import SwiftUI

struct CurrencyInput: View {
    
    let currency: Currency
    let amount: Double
    
    let calculator: (Double) -> Void
    let tapHandler: () -> Void
    
    var numberFormatter: NumberFormatter = {
        var nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.maximumFractionDigits = 2
        nf.usesGroupingSeparator = false
        return nf
    }()
    
    var body: some View {
        HStack {
            VStack {
                Text(currency.flag)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
                
                Text(currency.rawValue)
                    .font(.title2)
            }
            .frame(height: 100)
            .onTapGesture(perform: tapHandler)
            
            let binding = Binding<Double>(
                get: {
                    amount
                },
                set: {
                    calculator($0)
                }
            )
            
            TextField("",
                      value: binding,
                      formatter: numberFormatter)
                .font(.largeTitle)
                .multilineTextAlignment(.trailing)
                .minimumScaleFactor(0.5)
                .keyboardType(.numberPad)
        }
    }
}

#Preview {
    CurrencyInput(
        currency: .RUR,
        amount: 100,
        calculator: { _ in },
        tapHandler: { }
    )
}
