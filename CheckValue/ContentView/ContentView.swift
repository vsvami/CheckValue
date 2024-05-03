//
//  ContentView.swift
//  CheckValue
//
//  Created by Vladimir Dmitriev on 28.04.24.
//

import SwiftUI

struct ContentView: View {
    @State private var contentViewModel = ContentViewViewModel()
    
    var body: some View {
        VStack {
            SliderView(contentViewModel: contentViewModel)
            
            Button("Проверь меня!", action: contentViewModel.showAlert)
                .padding()
                .alert(
                    "Your Score",
                    isPresented: $contentViewModel.alertIsPresented,
                    actions: {}
                ) {
                    Text(contentViewModel.scores.formatted())
                }
            
            Button("Начать заново", action: contentViewModel.reset)
        }
    }
}

#Preview {
    ContentView()
}
