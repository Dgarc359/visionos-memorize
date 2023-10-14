//
//  ContentView.swift
//  vision-memorize
//
//  Created by David Garcia on 10/12/23.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    
    @State private var showImmersiveSpace = false
    @State private var immersiveSpaceIsShown = false
    
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
    
    var cardColor: Color
    @ObservedObject var viewModel: EmojiMemoryGameVM
    
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 125))]) {
                ForEach(viewModel.cards) { card in
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                }
            }
        }
        .padding(.bottom, 30)
        .foregroundColor(cardColor)
        .padding(.horizontal, 30)
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            
            if card.isFaceUp {
               shape.fill().foregroundColor(.white)
                
               shape.strokeBorder(lineWidth: 5)
                
                Text(card.content)
                    .font(.system(size: 100, weight: .bold))
            } else if card.isMatched {
                shape.opacity(0)
            } else {
                shape.fill()
            }
        }
    }
}

#Preview(windowStyle: .automatic) {
    let game = EmojiMemoryGameVM()
    ContentView(cardColor: .red, viewModel: game)
}
