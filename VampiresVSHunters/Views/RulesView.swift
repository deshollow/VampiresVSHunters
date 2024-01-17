//
//  MainView.swift
//  VampiresVSHunters
//
//  Created by deshollow on 12.01.2024.
//

import SwiftUI

struct RulesView: View {
    
    var body: some View {
        Image("RulesLogo")
            .resizable()
            .frame(width: 60, height: 60, alignment: .center)
        
        List {
            ForEach(0 ..< RulesDataStore.shared.headers.count) { index in
                VStack(alignment: .leading) {
                    Text(RulesDataStore.shared.headers[index])
                        .font(.headline)
                        .padding(.top)
                    Spacer()
                    Text(RulesDataStore.shared.texts[index])
                        .padding(.bottom)
                }
            }
        }
    }
}


#Preview {
    RulesView()
}

//Image(systemName: "questionmark.circle.fill")
//    .resizable()
//    .frame(width: 50, height: 50, alignment: .center)
//    .foregroundColor(Color(red: 219 / 255, green: 216 / 255, blue: 252 / 255))
