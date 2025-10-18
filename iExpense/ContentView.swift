//
//  ContentView.swift
//  iExpense
//
//  Created by Alonso Acosta Enriquez on 17/10/25.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("tap_count") private var tapCount: Int = 0
    
    var body: some View {
        Button("Tap Count: \(tapCount)") {
            tapCount += 1
        }
    }
}

#Preview {
    ContentView()
}
