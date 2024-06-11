//
//  GameScreen.swift
//  DiceGame
//
//  Created by Efehan Şentürk on 8.06.2024.
//

import SwiftUI

struct GameScreen: View {
    var username1 = "test1"
    var username2 = "test2"
    @State var point1 = 0
    @State var point2 = 0
    @State private var randomDice1 = ""
    @State private var randomDice2 = ""
    @State private var currentGamer1 = false
    @State private var currentGamer2 = false
    
    @State private var showWinScreen = false
    @State private var winner = ""
    var body: some View {
        NavigationStack {
            ZStack {
                AppBackground()
                VStack(spacing:50){
                    HStack {
                        Text("Dice Game")
                            .bold()
                            .font(.title)
                        Image(systemName: "dice.fill")
                            .bold()
                    }
                    HStack {
                        VStack (spacing:10){
                            Text(username1)
                                .font(.title2)
                                .bold()
                            Text("\(point1)")
                            Image(systemName: currentGamer1 ? "arrow.up" : "")
                                .font(.title)
                        }
                        Spacer()
                        VStack(spacing:10){
                            Text(username2)
                                .font(.title2)
                                .bold()
                            Text("\(point2)")
                            Image(systemName: currentGamer2 ? "arrow.up" : "")
                                .font(.title)
                        }
                    }.padding(.horizontal,35)
                    
                    HStack(spacing:45) {
                        Image(randomDice1)
                            .resizable()
                            .frame(width: 120 , height: 120)
                        Image(randomDice2)
                            .resizable()
                            .frame(width: 120 ,height: 120)
                    }
                    
                    ButtonView(buttonTitle: "Roll Dice", buttonFunc: {
                        let random1 = Int.random(in:0...GameController.diceArray.count-1);
                        let random2 = Int.random(in: 0...GameController.diceArray.count-1)
                        randomDice1 = GameController.diceArray[random1]
                        randomDice2 = GameController.diceArray[random2]
                        
                        if currentGamer1 {
                            if (random1+1) + (random2 + 1) == 7 {
                                point1 = 0
                            }else {
                                point1 += (random1+1) + (random2 + 1) }

                        }else{
                            if (random1+1) + (random2 + 1) == 7 {
                                point2 = 0
                            }else {
                                point2 += (random1+1) + (random2 + 1) }
                        }
                        
                        if point1 >= 70 {
                            winner = username1
                            showWinScreen = true
                        }
                       else if point2 >= 70 {
                            winner = username2
                            showWinScreen = true
                        }
                        
                        currentGamer1.toggle()
                        currentGamer2.toggle()
                        
                        //toggle metodu bool değerleri o anki durumlarının zıttına çevirir. True ise false , false ise true yapar
                    })
                    
                    Spacer()
                    
                    
                }
            }.navigationBarBackButtonHidden()
                .navigationDestination(isPresented: $showWinScreen, destination: {
                    WinScreen(gamerName: winner)
                })
                .onAppear(){
                    randomDice1 = GameController.diceArray[Int.random(in: 0...GameController.diceArray.count-1)]
                    randomDice2 = GameController.diceArray[Int.random(in: 0...GameController.diceArray.count-1)]
                    
                    if Bool.random(){
                        currentGamer1 = true
                    }else{
                        currentGamer2 = true
                    }
                }
        }

    }
}

#Preview {
    GameScreen()
}
