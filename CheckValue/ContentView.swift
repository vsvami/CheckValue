//
//  ContentView.swift
//  CheckValue
//
//  Created by Vladimir Dmitriev on 28.04.24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var targetValue = Int.random(in: 0...100)
    @State private var currentValue = 50.0
    @State private var showAlert = false
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Подвиньте слайдер, как можно ближе к: \(targetValue)")
            HStack {
                Text("0")
                SliderRepresentation(currentValue: $currentValue)
                Text("100")
            }
            .padding()
            
            Button("Проверь меня!") {
                showAlert.toggle()
            }
            .alert("Your Score", isPresented: $showAlert, actions: {}) {
                Text("\(computeScore())")
            }
            
            Button("Начать заново") {
                targetValue = Int.random(in: 0...100)
            }
        }
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
}

#Preview {
    ContentView()
}
