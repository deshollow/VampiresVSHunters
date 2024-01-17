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
            Spacer()
            List {
                HStack {
                    Spacer()
                    Image("RulesLogo")
                        .resizable()
                        .frame(width: 60, height: 60)
                    Spacer()
                }
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
}

#Preview {
    RulesView()
}

