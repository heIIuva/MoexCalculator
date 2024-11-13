//
//  CalculatorModel.swift
//  MoexCalculator
//
//  Created by big stepper on 12/11/2024.
//

import Foundation

struct CalculatorModel {
    
    //MARK: - Properties
    
    private(set) var currencyRates = CurrencyRates()
    
    //MARK: - Methods
    
    mutating func setCurrencyRates(_ currencyRates: CurrencyRates) {
        self.currencyRates = currencyRates
    }
    
    func convert(from source: CurrencyAmount, to target: Currency) -> Double {
        guard
            let sourceRate = currencyRates[source.currency],
            let targetRate = currencyRates[target]
        else { return 0 }
        
        if targetRate == 0 {
            return 0
        } else {
            return source.amount * sourceRate / targetRate
        }
    }
}
