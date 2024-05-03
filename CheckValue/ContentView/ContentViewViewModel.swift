//
//  ContentViewViewModel.swift
//  CheckValue
//
//  Created by Vladimir Dmitriev on 01.05.24.
//

import Foundation
import Observation

@Observable
final class ContentViewViewModel: ObservableObject {
    var gameOptions = GameOptions()
    var alertIsPresented = false
    
    var scores: Int {
        100 - abs(gameOptions.targetValue - lround(gameOptions.currentValue))
    }
    
    var alpha: Double {
        Double(scores) / 100
    }
    
    func showAlert() {
        alertIsPresented.toggle()
    }
    
    func reset() {
        gameOptions.currentValue = Double.random(in: 0...100)
        gameOptions.targetValue = Int.random(in: 0...100)
    }
}
