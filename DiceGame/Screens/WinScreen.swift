//
//  WinScreen.swift
//  DiceGame
//
//  Created by Efehan Şentürk on 11.06.2024.
//

import SwiftUI

struct WinScreen: View {
    var gamerName : String
    @State private var showLoginScreen = false
    var body: some View {
        NavigationStack {
         
            ZStack{
                AppBackground()
                VStack(spacing : 40) {
                    Text("You are winner \(gamerName)")
                        .font(.title)
                    ButtonView(buttonTitle: "Yeniden Oyna") {
                        showLoginScreen = true
                    }
                }
            }.navigationBarBackButtonHidden()
            .navigationDestination(isPresented: $showLoginScreen) {
                LoginScreen()
            }
        }

    }
}

#Preview {
    WinScreen(gamerName: "")
}
