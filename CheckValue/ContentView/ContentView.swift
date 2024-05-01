//
//  ContentView.swift
//  CheckValue
//
//  Created by Vladimir Dmitriev on 28.04.24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var contentViewVM: ContentViewViewModel
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Подвиньте слайдер, как можно ближе к: \(contentViewVM.targetValue)")
            SliderView().padding()
            ButtonView()
            
            Button("Начать заново") {
                contentViewVM.resetValues()
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(ContentViewViewModel())
}
