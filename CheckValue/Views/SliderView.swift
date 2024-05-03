//
//  SliderView.swift
//  CheckValue
//
//  Created by Vladimir Dmitriev on 01.05.24.
//

import SwiftUI

struct SliderView: View {
    @Bindable var contentViewModel: ContentViewViewModel
    
    var body: some View {
        VStack {
            let targetValue = contentViewModel.gameOptions.targetValue
            Text("Подвиньте слайдер, как можно ближе к: \(targetValue)")
            HStack {
                Text("0")
                SliderRepresentation(
                    value: $contentViewModel.gameOptions.currentValue,
                    alpha: contentViewModel.alpha
                )
                Text("100")
            }
            .padding()
        }
    }
}

#Preview {
    SliderView(contentViewModel: ContentViewViewModel())
}
