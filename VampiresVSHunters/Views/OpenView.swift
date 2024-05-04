//
//  ContentView.swift
//  VampiresVSHunters
//
//  Created by deshollow on 10.01.2024.
//

import SwiftUI

struct OpenView: View {
    
    @State private var showText = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Добро пожаловать в игру!")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundStyle(Color(.black).opacity(0.8))
                Image("OpenScreenLogo")
                    .resizable()
                    .frame(width: 400, height: 260, alignment: .center)
                NavigationLink(
                    "Войти", destination: HowToPlayView()
                )
                .foregroundColor(.blue)
                .font(.title)
                .padding(.bottom, 80)
                Text("быть вампиром или охотником, вот в чем вопрос...")
                    .onTapGesture {
                    }
                    .animation(.spring(duration: 2, bounce: 0.8, blendDuration: 3))
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(#colorLiteral(red:0.8980392157, green: 0.9333333333, blue: 1, alpha: 1)))
        }
    }
}

#Preview {
    OpenView()
}

//draft
