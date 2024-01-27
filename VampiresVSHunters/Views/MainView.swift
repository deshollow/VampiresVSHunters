//
//  StarterView.swift
//  VampiresVSHunters
//
//  Created by deshollow on 12.01.2024.
//

import SwiftUI

struct MainView: View {
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
                    Text("Старт")
                }
            RulesView()
                .tabItem {
                    Image(systemName: "questionmark.bubble")
                    Text("Правила")
                }
        }
    }
}

#Preview {
    MainView()
}
