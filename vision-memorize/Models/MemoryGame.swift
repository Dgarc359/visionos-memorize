//
//  MemoryGame.swift
//  vision-memorize
//
//  Created by David Garcia on 10/13/23.
//

import Foundation
import SwiftUI

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    private(set) var currentTheme: Theme = Theme(id: 0, name: "custom", pairsToShow: 5, color: .gray, emojis: [])
    private(set) var themesArr: Array<Theme>
    private(set) var currentlyHoveredTheme: Theme = Theme(id: 0, name: "custom", pairsToShow: 5, color: .gray, emojis: [])
    
    private var faceUpCardIndex: Int?
    
    init(numberOfPairsOfCards: Int, themes: Array<Theme>, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        
        // add number of pairs of cards * 2 to cards arr
        for pairIndex in 0..<numberOfPairsOfCards{
            let content: CardContent = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
        
        themesArr = themes
    }
    
    mutating func setCurrentThemeColor(_ setColor: Color) {
        currentTheme = Theme(id: currentTheme.id, name: currentTheme.name, pairsToShow: currentTheme.pairsToShow, color: setColor, emojis: currentTheme.emojis)
    }
    
    
    mutating func setCurrentlyHoveredTheme(_ theme: Theme) {
        currentlyHoveredTheme = theme
    }
    
    mutating func pickTheme(_ theme: Theme) {
        currentTheme = theme
    }
    
    mutating func choose(_ card: Card) {
        print("choosing card \(card.id)")
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
            !cards[chosenIndex].isFaceUp,
            !cards[chosenIndex].isMatched
        {
            if let potentialMatchIndex = faceUpCardIndex {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                faceUpCardIndex = nil
            } else {
                for index in 0..<cards.count {
                    cards[index].isFaceUp = false
                }
                faceUpCardIndex = chosenIndex
            }
            cards[chosenIndex].isFaceUp.toggle()
        }
        print("\(cards)")
    }
    
    struct Theme: Identifiable {
        var id: Int
        var name: String
        var pairsToShow: Int
        var color: Color
        var emojis: Array<CardContent>
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}

