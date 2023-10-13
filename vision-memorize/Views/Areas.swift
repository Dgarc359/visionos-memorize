//
//  Areas.swift
//  vision-memorize
//
//  Created by David Garcia on 10/13/23.
//

import SwiftUI

struct Areas: View {
    var body: some View {
        NavigationStack {
            navigateToAreas
        }
    }
    
    var navigateToAreas: some View {
        VStack {
            Text("Welcome to Memorize!")
                .monospaced()
                .font(.system(size: 40, weight: .bold))
                .padding(.top, 250)
            
            HStack {
                ForEach(Area.allCases) { area in
                    NavigationLink {
                        if area == Area.gaming {
                            ContentView(emojis: ["🎮", "🕹️", "👾", "🎲", "🧩", "🤖", "👺", "🛸", "🚀", "🛰️", "⚔️", "🛡️", "🔫", "💣", "🪓", "🏹", "🧨", "🪄", "🔮", "🥁", "🎹", "🎸", "🎺", "🎷", "🎻"], cardColor: .green)
                        }
                        
                        else if area == Area.cars {
                            ContentView(emojis: ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎️", "🚓", "🚑", "🚒", "🚐", "🚚", "🚛", "🚜", "🛴", "🛵", "🏍️", "🚲", "🚡", "🚠", "🚟", "🚁", "🛸", "🚀", "🛰️", "🛶"], cardColor: .gray)
                        }
                        
                        else if area == Area.sports {
                            ContentView(emojis: ["⚽️", "🏀", "🏈", "⚾️", "🥎", "🎾", "🏐", "🏉", "🥏", "🎱", "🏓", "🏸", "🏒", "🏑", "🥍", "🏏", "🥊", "🥋", "跆ekwondo", "🩰", "🤺", "🥇", "🥈", "🥉"], cardColor: .red)
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
