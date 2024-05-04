//
//  LocationView.swift
//  VampiresVSHunters
//
//  Created by deshollow on 21.01.2024.
//

import SwiftUI

struct LocationView: View {
    
    var body: some View {
        VStack {
            Text("Location View")
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
    LocationView()
}
