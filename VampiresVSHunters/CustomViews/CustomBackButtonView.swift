//
//  CustomBackButtonView.swift
//  VampiresVSHunters
//
//  Created by deshollow on 03.05.2024.
//

import SwiftUI

struct CustomBackButtonView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Button(action: {
            dismiss.callAsFunction()
        }, label: {
            Image(systemName: "xmark")
                .font(.title)
                .foregroundColor(.blue)
        })
    }
}
