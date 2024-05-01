//
//  ButtonView.swift
//  CheckValue
//
//  Created by Vladimir Dmitriev on 01.05.24.
//

import SwiftUI

struct ButtonView: View {
    @EnvironmentObject private var contentViewVM: ContentViewViewModel
    
    @State private var showAlert = false
    
    var body: some View {
        Button("Проверь меня!") {
            showAlert.toggle()
        }
        .alert("Your Score", isPresented: $showAlert, actions: {}) {
            Text(contentViewVM.computeScore().formatted())
        }
    }
}

#Preview {
    ButtonView()
        .environmentObject(ContentViewViewModel())
}
