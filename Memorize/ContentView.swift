//
//  ContentView.swift
//  Memorize
//
//  Created by Aleksandr Valter on 24.04.2025.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["👽","🐙","🐳","🦀","🐻","🐰","🐝","🦋","🐌","🐫","🐕","🐈"]
    
    @State var cardCount = 4
    
    var body: some View {
        VStack(spacing: 20) {
            ScrollView{
                cards
            }
            Spacer()
            cardCountAdjusters
        }
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.green)
        .padding()
    }
    
    var cardCountAdjusters: some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }
        .padding([.horizontal], 50)
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(
            action: { cardCount += offset },
            label: { Image(systemName: symbol)}
        )
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.fill.badge.minus")
    }
    
    var cardAdder: some View {
        cardCountAdjuster(by: 1, symbol: "rectangle.fill.badge.plus")
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = false
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 24)
            Group {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 8)
                Text(content)
                    .font(.largeTitle)
                    .padding()
            }
            .opacity(isFaceUp ? 1 : 0)
            base.opacity(isFaceUp ? 0 : 1)
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
