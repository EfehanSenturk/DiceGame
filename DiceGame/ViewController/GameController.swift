//
//  GameController.swift
//  DiceGame
//
//  Created by Efehan Şentürk on 8.06.2024.
//

import Foundation

struct GameController {
    
    static let diceArray : [String] = ["zar1","dice2","dice3","dice4","dice5","dice6"]
    
    func userNameController(username1:String ,username2 :String , completedHandler :(Bool) -> Void){
        if !username1.trimmingCharacters(in: .whitespaces).isEmpty && !username2.trimmingCharacters(in: .whitespaces).isEmpty {
            completedHandler(true)
        }else{
            completedHandler(false)
        }
    }
    
    
    
}
