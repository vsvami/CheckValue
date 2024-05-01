//
//  ContentViewViewModel.swift
//  CheckValue
//
//  Created by Vladimir Dmitriev on 01.05.24.
//

import Foundation

final class ContentViewViewModel: ObservableObject {
    @Published var targetValue = Int.random(in: 0...100)
    @Published var currentValue = 50.0
    
    init(targetValue: Int = Int.random(in: 0...100), currentValue: Double = 50.0) {
        self.targetValue = targetValue
        self.currentValue = currentValue
    }
    
    func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
    
    func resetValues() {
        targetValue = Int.random(in: 0...100)
    }
}
