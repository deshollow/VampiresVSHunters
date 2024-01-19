//
//  StartGameView.swift
//  VampiresVSHunters
//
//  Created by deshollow on 17.01.2024.
//

import SwiftUI

struct MenuView: View {
    
    @State private var vampiresCount = 3.0
    
    var body: some View {
        VStack {
            HStack {
                Text("Количество Вампиров:")
                if vampiresCount == 10.0 {
                    Text("max")
                        .font(.title2)
                } else {
                    Text("\(Int(vampiresCount))")
                        .font(.title2)
                }
            }
            HStack {
                Text("min")
                Slider(value: $vampiresCount, in: 3...10.0
                )
                .frame(width: 280)
                .tint(.yellow)
                Text("10")
            }
            .padding()
            HStack {
                Text("Количество Охотников:")
                HStack {
                    if vampiresCount <= 4 {
                        Text("1")
                            .font(.title2)
                    } else if vampiresCount > 4 && vampiresCount <= 6 {
                        Text("1-2")
                            .font(.title2)
                    } else if vampiresCount > 6 && vampiresCount <= 8 {
                        Text("1-3")
                            .font(.title2)
                    } else {
                        Text("1-4")
                            .font(.title2)
                    }
                }
            }
        }
    }
}

#Preview {
    MenuView()
}


