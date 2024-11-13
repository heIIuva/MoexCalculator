//
//  MainView.swift
//  MoexCalculator
//
//  Created by big stepper on 13/11/2024.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var viewModel: CalculatorViewModel
    
    var body: some View {
        
        switch viewModel.state {
        case .loading:
            ProgressView()
        case .error:
            VStack {
                Text("🤷‍♂️")
                    .font(.system(size: 100))
                    .padding()
                Text("Something went wrong")
                    .font(.body)
            }
            .multilineTextAlignment(.center)
        case .content:
            CalculatorView()
        }
    }
}

#Preview {
    MainView()
}
