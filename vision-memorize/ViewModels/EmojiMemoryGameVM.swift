//
//  EmojiMemoryGameVM.swift
//  vision-memorize
//
//  Created by David Garcia on 10/13/23.
//

import SwiftUI

class EmojiMemoryGameVM: ObservableObject {
    
    static let emojis = ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎️", "🚓", "🚑", "🚒", "🚐", "🚚", "🚛", "🚜", "🛴", "🛵", "🏍️", "🚲", "🚡", "🚠", "🚟", "🚁", "🛸", "🚀", "🛰️", "🛶"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    @Published private(set) var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intent(s)
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
}
