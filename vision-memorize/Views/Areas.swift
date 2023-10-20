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
                ThemeView()
//                Text("Theme")
//                    .monospaced()
//                    .font(.system(size: 30, weight: .medium))
//                    .padding(.trailing, 10)
//                
//                ZStack() {
//                    Circle()
//                        .frame(width: 40)
//                    Circle()
//                        .stroke(lineWidth: 2)
//                        .frame(width: 45)
//                        .foregroundColor(.black)
//                }
//                .onTapGesture {
//                }
            }
            .padding(.trailing, 100)
            
            Text("Welcome to Memorize!")
                .monospaced()
                .font(.system(size: 40, weight: .bold))
                .padding(.top, 250)
            
            HStack {
                ForEach(Area.allCases) { area in
                    NavigationLink {
                        if area == Area.gaming {
                            ContentView(cardColor: .green, viewModel: game)
                        }
                        
                        else if area == Area.cars {
                            ContentView(cardColor: .gray, viewModel: game)
                        }
                        
                        else if area == Area.sports {
                            ContentView(cardColor: .red, viewModel: game)
                        }
                    } label: {
                        if area == Area.gaming {
                            Label(area.name, systemImage: "gamecontroller.fill")
                                .monospaced()
                                .font(.title)
                        }
                        else if area == Area.cars {
                            Label(area.name, systemImage: "car.rear.fill")
                                .monospaced()
                                .font(.title)
                        }
                        else if area == Area.sports {
                            Label(area.name, systemImage: "figure.run")
                                .monospaced()
                                .font(.title)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    Areas()
}
