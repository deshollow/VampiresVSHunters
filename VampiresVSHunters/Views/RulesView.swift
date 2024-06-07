//
//  RuleView.swift
//  VampiresVSHunters
//
//  Created by deshollow on 17.01.2024.
//

import SwiftUI

struct RulesView: View {
    
    var body: some View {
        VStack {
            ZStack {
                Spacer()
                List {
                    HStack {
                        Spacer()
                        Image("RulesLogo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(.horizontal, 110)
                            .clipShape(Circle())
                            .padding(.all, 8)
                            .background(Color(#colorLiteral(red:0.8980392157, green: 0.9333333333, blue: 1, alpha: 1)))
                            .clipShape(Circle())
                            .shadow(color:
                                        Color.black.opacity(0.35),
                                    radius: 10, x:8, y:8)
                            .shadow(color: Color.white, radius: 10, x: -10, y: -10)
                        Spacer()
                    }
                    ForEach(0 ..< RulesDataStore.shared.headers.count) { index in
                        VStack(alignment: .leading) {
                            Text(RulesDataStore.shared.headers[index])
                                .font(.headline)
                                .padding(.top)
                                .foregroundStyle(Color(.black).opacity(0.8))
                            Spacer()
                            Text(RulesDataStore.shared.texts[index])
                                .padding(.bottom)
                        }
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    RulesView()
}
