//
//  ButtonView.swift
//  DiceGame
//
//  Created by Efehan Şentürk on 8.06.2024.
//

import SwiftUI

struct ButtonView: View {
    var buttonTitle = ""
    var buttonFunc : () -> Void
    var body: some View {
        Button(action: {
            buttonFunc()
        }, label: {
            Text(buttonTitle)
                .padding(.horizontal,50)
                .padding()
                .foregroundStyle(.black)
                .bold()
                .background(Color("textFieldBackground"))
                .cornerRadius(20)
        })
    }
}

#Preview {
    ButtonView(buttonFunc: {})
}
