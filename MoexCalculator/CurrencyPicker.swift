//
//  CurrencyPicker.swift
//  MoexCalculator
//
//  Created by big stepper on 13/11/2024.
//

import SwiftUI

import SwiftUI

struct CurrencyPicker: View {

    // Байндинг для валюты, который помогает читать и записывать её значение
    @Binding var currency: Currency
    
    // Функция, которая вызывается при выборе валюты из списка
    let onChange: (Currency) -> Void
    
    var body: some View {
        
        // Picker — элемент SwiftUI для выбора значения из списка
        Picker("", selection: $currency) {
                        
            // ForEach - элемент SwiftUI, который генерирует набор View
            // из коллекции значений с уникальными идентификаторами
            ForEach(Currency.allCases) { currency in
                Text(currency.rawValue.uppercased())
            }
        }
        // Задаёт стиль Picker «колесо» или «барабан»
        .pickerStyle(.wheel)
        
        // Определяет функцию, которая вызывается при выборе нового значения
        .onChange(of: currency) { onChange($0) }
    }
}

// Структура, которая определяет отображение компонента в панели preview
#Preview {
    let currencyBinding = Binding<Currency>(
        get: { .RUR },
        set: { _ = $0 }
    )
    
    CurrencyPicker(currency: currencyBinding, onChange: { _ in })
}
