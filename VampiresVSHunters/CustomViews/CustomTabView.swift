//
//  StarterView.swift
//  VampiresVSHunters
//
//  Created by deshollow on 12.01.2024.
//


import SwiftUI

struct CustomTabView: View {
    
    var body: some View {
        TabView {
            MenuView()
                .tabItem {
                    Image(systemName: "menucard.fill")
                    Text("Меню")
                }
            StartView()
                .tabItem {
                    Image(systemName: "arrow.right.circle.fill")
                    Text("Играть")
                }
            RulesView()
                .tabItem {
                    Image(systemName: "questionmark.bubble")
                    Text("Правила")
                }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                CustomBackButtonView()
            }
        }
    }
}

#Preview {
    CustomTabView()
}
