//
//  CheckValueApp.swift
//  CheckValue
//
//  Created by Vladimir Dmitriev on 28.04.24.
//

import SwiftUI

@main
struct CheckValueApp: App {
    @StateObject private var checkValueVM = ContentViewViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .environmentObject(checkValueVM)
    }
}
