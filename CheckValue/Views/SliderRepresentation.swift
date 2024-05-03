//
//  SliderRepresentation.swift
//  CheckValue
//
//  Created by Vladimir Dmitriev on 01.05.24.
//

import SwiftUI

struct SliderRepresentation: UIViewRepresentable {
    @Binding var value: Double
    
    let alpha: Double
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueChanged),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(value)
        uiView.thumbTintColor = .red.withAlphaComponent(alpha)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value)
    }
}

extension SliderRepresentation {
    final class Coordinator: NSObject {
        @Binding var value: Double

        init(value: Binding<Double>) {
            self._value = value
        }
        
        @objc func valueChanged(_ sender: UISlider) {
            value = Double(sender.value)
        }
    }
}

#Preview {
    SliderRepresentation(value: .constant(50), alpha: 100)
}
