//
//  vision_memorizeApp.swift
//  vision-memorize
//
//  Created by David Garcia on 10/12/23.
//

import SwiftUI

@main
struct vision_memorizeApp: App {
    let game: EmojiMemoryGameVM = EmojiMemoryGameVM()
    var body: some Scene {
        WindowGroup {
            Areas(game: game)
        }
        WindowGroup(id: "ThemeOptionsView") {
            ThemeOptionsView(viewModel: game)
        }
    }
}
