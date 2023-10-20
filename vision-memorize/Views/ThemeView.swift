//
//  ThemeView.swift
//  vision-memorize
//
//  Created by David Garcia on 10/19/23.
//

import SwiftUI

struct ThemeView: View {
    
    @Environment(\.openWindow) private var openWindow
    
    
    @State var circleWidthMultiplier: CGFloat = 1;
    @State var isClicked = false;
    
    var body: some View {
        Text("Theme")
            .monospaced()
            .font(.system(size: 30, weight: .medium))
            .padding(.trailing, 10)
        
        if(isClicked) {
//            WindowGroup() {
//                View {
//                    
//                }
//            }
        }
        
        ZStack() {
            Circle()
                .frame(width: 40 * circleWidthMultiplier)
            Circle()
                .stroke(lineWidth: 2)
                .frame(width: 45 * circleWidthMultiplier)
                .foregroundColor(.black)
        }
        .onTapGesture {
            // There's probably a better way to do this animation
            if(isClicked) {
                circleWidthMultiplier = 1.0
                isClicked = false
                return
            }
            openWindow(id: "ThemeOptionsView")
            isClicked = true
        }
    }
    
    
}




#Preview {
    ThemeView()
}
