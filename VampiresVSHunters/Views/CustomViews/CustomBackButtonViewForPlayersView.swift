//
//  CustomBackButtonViewForPlayersVIew.swift
//  VampiresVSHunters
//
//  Created by deshollow on 26.06.2024.
//

import SwiftUI
import CoreData

struct CustomBackButtonViewForPlayersView: View {
    
    @ObservedObject var tagsViewModel: TagsViewModel //как обратиться к CoreData контексту?
    
    @State private var showingAlert = false
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Button(action: {
            if tagsViewModel.tags.count < 3 { //тут видимо должна быть проверка count из CD
                showingAlert = true
            } else if tagsViewModel.tags.count > 10 { //аналогично, макс проверка тегов/имен игроков
                showingAlert = true
            } else {
                print("it's ok")
                dismiss.callAsFunction()
            }
        }, label: {
            Image(systemName: "xmark")
                .font(.title)
                .foregroundColor(.blue)
        })
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Неверное количество игроков"),
                  message: Text("В игре может быть от 3 до 10 участников"),
                  dismissButton: .cancel(Text("Ок")))
            
        }
    }
}
