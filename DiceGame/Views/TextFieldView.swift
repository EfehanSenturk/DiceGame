//
//  TextFieldView.swift
//  DiceGame
//
//  Created by Efehan Şentürk on 8.06.2024.
//

import SwiftUI

struct TextFieldView: View {
    @Binding var username : String
    var placeholder = ""
    var body: some View {
        TextField(text : $username) {
            Text(placeholder)
                .font(.title2)
                .bold()
        }
        .padding()
        .background(Color("textFieldBackground"))
        .shadow(radius: 15)
        .cornerRadius(20)
    }
}

#Preview {
    TextFieldView(username: .constant(""))
}
