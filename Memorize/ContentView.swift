//
//  ContentView.swift
//  Memorize
//
//  Created by Aleksandr Valter on 24.04.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }
        .foregroundColor(.blue)
        .padding()
    }
}

struct CardView: View {
    var isFaceUp: Bool = false
    
    var body: some View {
        ZStack() {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 24)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 24)
                    .strokeBorder(lineWidth: 8)
                Text("👽")
                    .font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 24)
            }
        }
    }
}

#Preview {
    ContentView()
}
