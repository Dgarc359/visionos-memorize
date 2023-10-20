//
//  EmojiMemoryGameVM.swift
//  vision-memorize
//
//  Created by David Garcia on 10/13/23.
//

import SwiftUI

enum Themes: CaseIterable, Identifiable {
    case gaming, cars, sports, custom
    
    var id: Self { self }
    var pairsToShow: Int {
        switch self {
        case.gaming: 4
        case.cars: 2
        case.sports: 6
        case.custom: 5
        }
    }
    
    var title: String {
        switch self {
        case.gaming:
            "gaming"
        case.cars:
            "cars"
        case.sports:
            "sports"
        case.custom:
            "custom"
        }
    }
    
    var color: Color {
        switch self {
        case.gaming: return .green
        case.cars: return .blue
        case.sports: return .red
        case.custom: return .gray
        }
    }
}

class EmojiMemoryGameVM: ObservableObject {
    
    static let emojis = ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎️", "🚓", "🚑", "🚒", "🚐", "🚚", "🚛", "🚜", "🛴", "🛵", "🏍️", "🚲", "🚡", "🚠", "🚟", "🚁", "🛸", "🚀", "🛰️", "🛶"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4, themes: [
            MemoryGame.Theme(id: 0, name: "test", pairsToShow: 2, color: .red, emojis: emojis)]
        ) { pairIndex in
            emojis[pairIndex]
        }
        
    }
    
    @Published private(set) var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    var theme: MemoryGame<String>.Theme {
        return model.currentTheme
    }
    
    var currentlyHoveredTheme: MemoryGame<String>.Theme {
        return model.currentlyHoveredTheme
    }
    
    // MARK: - Intent(s)
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    func pickTheme(_ theme: MemoryGame<String>.Theme) {
        model.pickTheme(theme)
    }
    
    func setCurrentlyHoveredTheme(_ theme: MemoryGame<String>.Theme) {
        model.setCurrentlyHoveredTheme(theme)
    }
    
    func pickCurrentThemeColor(_ color: Color) {
        model.setCurrentThemeColor(color)
    }
    
}
