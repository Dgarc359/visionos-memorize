//
//  ThemeOptionsView.swift
//  vision-memorize
//
//  Created by David Garcia on 10/19/23.
//

import SwiftUI

struct ThemeOptionsView: View {
    @ObservedObject var viewModel: EmojiMemoryGameVM
    init(viewModel: EmojiMemoryGameVM) {
        self.viewModel = viewModel
        viewModel.setCurrentlyHoveredTheme(
            MemoryGame<String>.Theme(id: 0, name: Themes.custom.title, pairsToShow: Themes.custom.pairsToShow, color: Themes.custom.color, emojis: Themes.custom.emojis))
    }
    
    var body: some View {
            HStack {
                ThemeList(viewModel: viewModel)
                .padding(.leading, 50)
                
                Spacer()
                ThemeConfiguration(viewModel: viewModel)
                Spacer()
                
            }
    }
    
    struct ThemeList: View {
        @ObservedObject var viewModel: EmojiMemoryGameVM
        var body: some View {
            VStack { // theme list
                Text("Themes")
                    .font(.system(size: 40))
                    .padding(.top, 50)
                    .padding(.bottom, 20)
                
                ForEach(Themes.allCases) { theme in
                    Spacer()
                    Text(theme.title)
                        .font(.system(size: 40))
                        .onTapGesture {
                            let theme = MemoryGame<String>.Theme(id: 0, name: theme.title, pairsToShow: theme.pairsToShow, color: theme.color, emojis: theme.emojis)
                            viewModel.setCurrentlyHoveredTheme(theme)
                            print("Currently hovering: \(theme)")
                            
                        }
                    Spacer()
                    
                }
                Spacer()
            }
        }
    }
    
    struct ThemeConfiguration: View {
        @ObservedObject var viewModel: EmojiMemoryGameVM
        @Environment(\.dismissWindow) private var dismissWindow
        @State private var debounceTimeElapsed = false
        
        var body: some View {
            VStack {
                Text("Currently in use: \(viewModel.theme.name)")
                    .font(.system(size: 30))
                    .padding(.top, 50)
                Spacer()
                Text("Emojis:")
                    .font(.system(size: 30))
                    .padding(.bottom, 10)
                
                EmojiScroll(viewModel: viewModel)
                    .frame(maxHeight: 60)
                
                Text("Theme Name: \(viewModel.currentlyHoveredTheme.name)")
                    .font(.system(size: 30))
                Spacer()
                Text("Number of pairs of cards to show: \(viewModel.currentlyHoveredTheme.pairsToShow)")
                    .font(.system(size: 30))
                Spacer()
                HStack {
                    Text("Color:")
                        .font(.system(size: 30))
                    ZStack {
                        Rectangle()
                            .foregroundColor(viewModel.currentlyHoveredTheme.color)
                            .frame(width: 20, height: 20)
                        Rectangle()
                            .stroke()
                            .frame(width: 20, height: 20)
                        
                    }
                    
                }
                Spacer()
                Button(action: {
                    print("emojis \(viewModel.theme.emojis)")
                    print("using theme")
                    
                    viewModel.pickTheme(viewModel.currentlyHoveredTheme)
                    Task {
                        print("waiting for 7.5 seconds")
                        try await Task.sleep(nanoseconds: 1_000_000_000)
                        dismissWindow(id: "ThemeOptionsView")
                    }
                }) {
                    Text("Use this theme")
                        .font(.system(size: 30))
                }
                Spacer()
            }
        }
    }
    
    struct EmojiScroll: View {
        @ObservedObject var viewModel: EmojiMemoryGameVM
        var body: some View {
            ScrollView(.horizontal) {
                HStack {
                    ForEach(viewModel.currentlyHoveredTheme.emojis, id: \.self) { emoji in
                        Text(emoji)
                            .font(.system(size: 50))
                            .frame(minWidth: 50)
                    }
                }
            }
        }
    }
}

#Preview {
    let game = EmojiMemoryGameVM()
    return ThemeOptionsView(viewModel: game)
}
