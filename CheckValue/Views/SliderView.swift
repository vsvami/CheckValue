//
//  SliderView.swift
//  CheckValue
//
//  Created by Vladimir Dmitriev on 01.05.24.
//

import SwiftUI

struct SliderView: View {
    @EnvironmentObject private var contentViewVM: ContentViewViewModel
    
    var body: some View {
        HStack {
            Text("0")
            SliderRepresentation()
            Text("100")
        }
    }
}

#Preview {
    SliderView()
        .environmentObject(ContentViewViewModel())
}
