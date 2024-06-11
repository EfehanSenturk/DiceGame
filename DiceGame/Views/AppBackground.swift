//
//  AppBackground.swift
//  DiceGame
//
//  Created by Efehan Şentürk on 8.06.2024.
//

import SwiftUI

struct AppBackground: View {
    var body: some View {
        VStack {
            ContainerRelativeShape()
                .fill(LinearGradient(colors: [Color("backroundTop"), Color("backgroundBottom")], startPoint: .topLeading, endPoint: .bottomTrailing))
                .ignoresSafeArea()
                
        }
    }
}

#Preview {
    AppBackground()
}
