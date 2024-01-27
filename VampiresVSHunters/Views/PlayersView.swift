//
//  PlayersView.swift
//  VampiresVSHunters
//
//  Created by deshollow on 21.01.2024.
//

import SwiftUI

struct PlayersView: View {
    
    @State private var showingMenuView = false
    
    var body: some View {
        VStack {
            Text("PlayersView")
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
////    @Environment(\.presentationMode) var presentationMode
//    
//    var body: some View {
//        VStack {
//            Text("PlayersView!")
////            Button("Назад") {
////                self.presentationMode.wrappedValue.dismiss()
////            }
//        }
//    }
//}
//
//#Preview {
//    PlayersView()
//}

//Вы можете создать свою собственную кнопку и использовать её вместо NavigationLink. Вот пример такой кнопки:
//
//struct CustomButton: View {
//    @Binding var isPressed: Bool
//    let action: () -> Void
//
//    var body: some View {
//        ZStack {
//            RoundedRectangle(cornerRadius: 20)
//                .fill(isPressed ? Color.red : Color.blue)
//                .frame(width: 200, height: 50)
//            
//            Text("Button")
//                .padding()
//                .foregroundColor(.white)
//                .background(isPressed ? Color.gray : .clear)
//                .onTapGesture {
//                    isPressed = true
//                    action()
//                }
//        }
//    }
//}
//Эта кнопка имеет свойство isPressed, которое определяет её цвет. При нажатии на кнопку вызывается функция action, которую вы указываете при использовании этой кнопки.
