//
//  HowToPlayView.swift
//  VampiresVSHunters
//
//  Created by deshollow on 12.01.2024.
//

import SwiftUI

struct HowToPlayView: View {
    
    var body: some View {
        ZStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(cardData) { item in
                        GeometryReader { geometry in
                            HowToPlayCardView(card: item)
                                .rotation3DEffect(
                                    Angle(degrees: Double(geometry.frame(in: .global).minX - 30) / -20),
                                    axis: (x: 0,
                                           y: 10,
                                           z: 0)
                                )
                        }
                        .frame(width: 340, height: 500)
                    }
                }
                .padding(28)
                .padding(.bottom, 150)
            }
            NavigationLink( "Меню", destination: CustomTabView())
                .font(.title)
                .foregroundColor(.blue)
                .navigationBarBackButtonHidden()
                .padding(.top, 500)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(#colorLiteral(red:0.8980392157, green: 0.9333333333, blue: 1, alpha: 1)))
    }
}

#Preview {
    HowToPlayView()
        .accessibilityIdentifier("howtoplay")
}

//MARK: Сard design

struct HowToPlayCardView: View {
    
    var card: Card
    
    var body: some View {
        Spacer()
        VStack {
            Text(card.title)
                .font(.title)
                .foregroundColor(.white)
                .padding()
            Image(systemName: card.image)
                .resizable()
                .frame(width: 100, height: 100, alignment: .center)
                .foregroundColor(card.imageColor)
                .padding(.all, 80)
            Text(card.text)
                .foregroundColor(.white)
                .padding()
        }
        .padding()
        .frame(width: 340, height: 500, alignment: .center)
        .background(card.cardColor)
        .cornerRadius(30)
        .shadow(color: .gray, radius: 10, x: 0, y: 15)
    }
}

//MARK: Card structure

struct Card: Identifiable {
    
    var id = UUID()
    var title: String
    var text: String
    var image: String
    var imageColor: Color
    var cardColor: Color
    var textColor: Color
}

//MARK: Card data

let cardData = [
    Card(
        title: "Что такое Вампиры против Охотников?",
        text: "Листайте дальше и узнайте, что нужно делать",
        image: "powersleep",
        imageColor: .yellow,
        cardColor: .black,
        textColor: .white),
    Card(title: "Если вам выпал охотник",
         text: "Ваша задача не дать вампирам догадаться об этом",
         image: "figure.hunting",
         imageColor: .purple,
         cardColor: .black,
         textColor: .white),
    Card(title: "Если вам выпал вампир",
         text: "Ваша задача разоблачить охотника и выжить",
         image: "figure.wrestling",
         imageColor: .red,
         cardColor: .black,
         textColor: .white),
    Card(title: "Задавайте друг другу вопросы!",
         text: "Нажмите на иконку в меню, чтобы прочесть правила",
         image: "questionmark.bubble.fill",
         imageColor: .blue,
         cardColor: .black,
         textColor: .white)
]
