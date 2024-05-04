//
//  PlayersView.swift
//  VampiresVSHunters
//
//  Created by deshollow on 21.01.2024.
//

import SwiftUI

struct PlayersView: View {
    
    var body: some View {
        VStack {
            Text("Players View")
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
    PlayersView()
}



//import SwiftUI
//
//struct PlayersView: View {
//
//    var body: some View {
//        VStack {
//            Text("PlayersView")
//        }
//    }
//}
//
//#Preview {
//    PlayersView()
//}
