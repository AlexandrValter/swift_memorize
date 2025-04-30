//
//  ContentView.swift
//  Memorize
//
//  Created by Aleksandr Valter on 24.04.2025.
//

import SwiftUI

struct ContentView: View {
    let seaCreatures = ["🦑","🐙","🐳","🦀","🪼","🐡","🐠","🐬","🦞","🐟","🦈","🦐"]
    let insects = ["🐝","🐛","🦋","🐞","🐜","🪰","🪲","🪳","🦟","🦗","🕷️","🦂"]
    let animals = ["🐶","🐵","🐷","🐹","🐰","🦊","🐻","🐼","🐮","🐨","🐯","🦁"]
    
    @State var emojis: Array<String> = []
    @State var color: Color?
    
    var body: some View {
        VStack(spacing: 20) {
            appTitle
            ScrollView {
                cards
            }
            themesCustomizers
        }
    }
    
    var appTitle: some View {
        Text("Memorize!")
            .font(.largeTitle)
            .foregroundColor(color ?? .black)
            .fontWeight(.bold)
            
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))]) {
            if !emojis.isEmpty {
                ForEach(0..<emojis.count, id: \.self) { index in
                    CardView(content: emojis[index])
                        .aspectRatio(2/3, contentMode: .fit)
                }
            }
        }
        .foregroundColor(color)
        .padding()
    }
    
    func themeSelectorButton(_ theme: Array<String>, icon: String, button title: String, color: Color) -> some View {
        VStack(spacing: 10) {
            Image(systemName: icon)
                .font(.title)
            Text(title)
                .font(.subheadline)
        }
        .foregroundStyle(.blue)
        .onTapGesture {
            emojis = (theme + theme).shuffled()
            self.color = color
        }
        .frame(maxWidth: .infinity)
    }
    
    var themesCustomizers: some View {
        HStack {
            themeSelectorButton(seaCreatures, icon: "fish", button: "Sea creatures", color: .blue)
            themeSelectorButton(insects, icon: "ant", button: "Insects", color: .green)
            themeSelectorButton(animals, icon: "dog", button: "Animals", color: .orange)
        }
        .padding([.horizontal], 30)
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
