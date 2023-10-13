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
    
    @State var emojis: [String]
    var cardColor: Color
    @State var emojiCount = 6
    

    var body: some View {
        VStack {
            Text("Memorize!")
                .monospaced()
                .font(.system(size: 40, weight: .bold))
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 125))]) {
                    ForEach(emojis.shuffled()[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .padding(.bottom)
            .foregroundColor(cardColor)
            
            Spacer()
            
            HStack {
                remove
                Spacer()
                add
            }
            .padding(.horizontal)
            .font(.largeTitle)
        }
        .padding(.horizontal, 30)
        .padding(.bottom, 30)
    }
    
    var remove: some View {
        Button {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
    }
    
    var add: some View {
        Button {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        } label: { 
            Image(systemName: "plus.circle")
        }
    }
}


struct CardView: View {
    @State var isFaceUp: Bool = false
    var content: String
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                
               shape.strokeBorder(lineWidth: 5)
                
                Text(content)
                    .font(.system(size: 100, weight: .bold))
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView(emojis: ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎️", "🚓", "🚑", "🚒", "🚐", "🚚", "🚛", "🚜", "🛴", "🛵", "🏍️", "🚲", "🚡", "🚠", "🚟", "🚁", "🛸", "🚀", "🛰️", "🛶"], cardColor: .red)
}
