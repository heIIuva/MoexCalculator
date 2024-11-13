//
//  MoexCalculatorApp.swift
//  MoexCalculator
//
//  Created by big stepper on 11/11/2024.
//

import SwiftUI

@main
struct MoexCalculatorApp: App {
    
    @StateObject var viewModel = CalculatorViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(viewModel)
        }
    }
}
