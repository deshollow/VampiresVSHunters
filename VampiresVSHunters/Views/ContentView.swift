//
//  ContentView.swift
//  VampiresVSHunters
//
//  Created by deshollow on 10.01.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showText = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Добро пожаловать в игру!")
                    .font(.headline)
                    .padding()
                Image("OpenScreenLogo")
                    .resizable()
                    .frame(width: 400, height: 260, alignment: .center)
                NavigationLink(
                    "Войти", destination: HowToPlayView()
                )
                .font(.title)
                .foregroundColor(.blue)
                .padding(.bottom, 100)
                Text("быть вампиром или охотником, вот в чем вопрос...")
                    .onTapGesture {
                    }
                    .animation(.spring(duration: 2, bounce: 0.8, blendDuration: 3))
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
