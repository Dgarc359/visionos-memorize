//
//  Areas.swift
//  vision-memorize
//
//  Created by David Garcia on 10/13/23.
//

import SwiftUI

struct Areas: View {
    var game: EmojiMemoryGameVM = EmojiMemoryGameVM()
    
    var body: some View {
        NavigationStack {
            navigateToAreas
        }
    }
    
    var navigateToAreas: some View {
        VStack {
            HStack {
                Spacer()
                ThemeView(viewModel: game)
            }
            .padding(.trailing, 100)
            
            Text("Welcome to Memorize!")
                .monospaced()
                .font(.system(size: 40, weight: .bold))
                .padding(.top, 250)
            
            HStack {
                NavigationLink {
                    ContentView(viewModel: game)
                } label: {
                    Text("Play")
                        .monospaced()
                        .font(.title)
                }
            }
        }
    }
}

#Preview {
    Areas()
}
