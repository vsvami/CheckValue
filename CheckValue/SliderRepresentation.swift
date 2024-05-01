//
//  SliderRepresentation.swift
//  CheckValue
//
//  Created by Vladimir Dmitriev on 01.05.24.
//

import SwiftUI

struct SliderRepresentation: UIViewRepresentable {
    
    @Binding var currentValue: Double
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider(frame: CGRect(x: 0, y: 0, width: 200, height: 30))
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = Float(currentValue)
        slider.thumbTintColor = UIColor(red: 255, green: 0, blue: 0, alpha: 1)
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.didMovedSlider),
            for: .valueChanged
        )
        
        return slider
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(currentValue: $currentValue)
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(currentValue)
    }
}

extension SliderRepresentation {
    final class Coordinator: NSObject {
        @Binding var currentValue: Double
        
        init(currentValue: Binding<Double>) {
            self._currentValue = currentValue
        }
        
        @objc func didMovedSlider(_ sender: UISlider) {
            currentValue = Double(sender.value).rounded()
        }
    }
}

#Preview {
    SliderRepresentation(currentValue: .constant(50))
}
