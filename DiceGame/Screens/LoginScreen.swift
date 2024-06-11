//
//  ContentView.swift
//  DiceGame
//
//  Created by Efehan Şentürk on 8.06.2024.
//

import SwiftUI

struct LoginScreen: View {
    @State private var username1 = ""
    @State private var username2 = ""
    @State private var showGameScreen = false
    var body: some View {
        NavigationStack {
            ZStack {
                AppBackground()
                
                VStack(spacing:30) {
                    HStack {
                        Text("Dice Game")
                            .bold()
                            .font(.title)
                        Image(systemName: "dice.fill")
                            .bold()
                            .font(.system(size: 30))
                        
                    }
                    TextFieldView(username: $username1 ,placeholder: "Username1")
                    TextFieldView(username: $username2, placeholder: "Username2")
                    
                    ButtonView(buttonTitle: "START") {
                        let nameControl = GameController()
                        nameControl.userNameController(username1: username1, username2: username2) { result in
                            if result {
                                showGameScreen = result
                            }else {
                                print("bilgileri düzgün girin")
                            }
                        }
                    }
                    
                    
                    Spacer()
                }.padding()
            }.navigationBarBackButtonHidden()
            .navigationDestination(isPresented: $showGameScreen) {
                GameScreen(username1: username1,username2: username2)
                    
        }
        }
        
    }
}

#Preview {
    LoginScreen()
}
