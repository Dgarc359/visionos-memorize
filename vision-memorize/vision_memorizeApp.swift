//
//  vision_memorizeApp.swift
//  vision-memorize
//
//  Created by David Garcia on 10/12/23.
//

import SwiftUI

@main
struct vision_memorizeApp: App {
    var body: some Scene {
        WindowGroup {
//            CardView()
            Areas()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
