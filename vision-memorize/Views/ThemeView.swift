//
//  ThemeView.swift
//  vision-memorize
//
//  Created by David Garcia on 10/19/23.
//

import SwiftUI

struct ThemeView: View {
    @ObservedObject var viewModel: EmojiMemoryGameVM
    
    @Environment(\.openWindow) private var openWindow
    
    var body: some View {
        Text("Theme")
            .monospaced()
            .font(.system(size: 30, weight: .medium))
            .padding(.trailing, 10)
        
        ZStack() {
            Circle()
                .frame(width: 40)
                .foregroundColor(viewModel.theme.color)
            Circle()
                .stroke(lineWidth: 2)
                .frame(width: 45)
                .foregroundColor(.black)
        }
        .onTapGesture {
            openWindow(id: "ThemeOptionsView")
        }
    }
}

#Preview {
    let game = EmojiMemoryGameVM()
    return ThemeView(viewModel: game)
}
