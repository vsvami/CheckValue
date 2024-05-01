//
//  SliderRepresentation.swift
//  CheckValue
//
//  Created by Vladimir Dmitriev on 01.05.24.
//

import SwiftUI

struct SliderRepresentation: UIViewRepresentable {
    @EnvironmentObject private var contentViewVM: ContentViewViewModel
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider(frame: CGRect(x: 0, y: 0, width: 200, height: 30))
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = Float(contentViewVM.currentValue)
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.didMovedSlider),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        updateThumbTintColor(uiView)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(currentValue: $contentViewVM.currentValue)
    }
    
    private func updateThumbTintColor(_ slider: UISlider) {
        let alphaValue = CGFloat(Double(contentViewVM.computeScore()) / 100.0)
        slider.thumbTintColor = UIColor.red.withAlphaComponent(alphaValue)
    }
}

extension SliderRepresentation {
    final class Coordinator: NSObject {
        @Binding var currentValue: Double

        init(currentValue: Binding<Double>) {
            self._currentValue = currentValue
        }
        
        @objc func didMovedSlider(_ sender: UISlider) {
            currentValue = Double(sender.value)
        }
    }
}

#Preview {
    SliderRepresentation()
        .environmentObject(ContentViewViewModel())
}
