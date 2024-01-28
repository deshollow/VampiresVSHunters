//
//  StartGameView.swift
//  VampiresVSHunters
//
//  Created by deshollow on 17.01.2024.
//

import SwiftUI

struct MenuView: View {
    
    @State private var vampiresCount = 3.0
    
    @State private var showingPlayersView = false
    @State private var showingLocationView = false
    @State private var showingTimersView = false
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Text("Карточка")
                        .foregroundStyle(Color(.black).opacity(0.8))
                        .padding(40)
                    Text("Локация")
                        .foregroundStyle(Color(.black).opacity(0.8))
                        .padding(40)
                    Text("Таймер")
                        .foregroundStyle(Color(.black).opacity(0.8))
                        .padding(40)
                }
                .padding(30)
                VStack(spacing: 30) {
                    NavigationLink(isActive: $showingPlayersView) {
                        PlayersView()
                    } label: {
                        ModifiedButtonVIew(image: "person.fill") {
                            showingPlayersView.toggle()
                        }
                    }
                    NavigationLink(isActive: $showingLocationView) {
                        LocationView()
                    } label: {
                        ModifiedButtonVIew(image: "photo") {
                            showingLocationView.toggle()
                        }
                    }
                    NavigationLink(isActive: $showingTimersView) {
                        TimerView()
                    } label: {
                        ModifiedButtonVIew(image: "alarm") {
                            showingTimersView.toggle()
                        }
                    }
                }
                Spacer()
            }
            .padding(.bottom, 50)
            
            //MARK: Slider logic
            
            HStack {
                Text("Игроки:")
                    .fontWeight(.bold)
                    .foregroundStyle(Color(.black).opacity(0.8))
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
                .tint(.orange)
                Text("10")
            }
            HStack {
                Text("Охотники:")
                    .fontWeight(.bold)
                    .foregroundStyle(Color(.black).opacity(0.8))
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
        .padding(.bottom, 100)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(#colorLiteral(red:0.8980392157, green: 0.9333333333, blue: 1, alpha: 1)))
    }
}

#Preview {
    MenuView()
}

//MARK: Buttons design

struct ModifiedButtonVIew: View {
    var image: String
    var action: (()-> Void)
    
    var body: some View {
        Button(action: action, label: {
            Image(systemName: image)
                .font(.system(size: 25, weight: .bold))
                .padding(.all, 25)
                .foregroundColor(.black.opacity(0.8))
                .background(
                    ZStack {
                        Color(#colorLiteral(red:0.7608050108,
                                            green: 0.8164883852,
                                            blue: 0.9259157777,
                                            alpha: 1))
                        Circle()
                            .foregroundColor(.white)
                            .blur(radius: 4)
                            .offset(x: -8, y: -8)
                        
                        Circle()
                            .fill(LinearGradient(
                                gradient: Gradient(colors: [Color(
                                    red: 231,
                                    green: 238,
                                    blue: 253), Color.white]),
                                startPoint:
                                        .topLeading, endPoint: .bottomTrailing))
                            .padding(2)
                            .blur(radius: 2)
                    }
                        .clipShape(Circle())
                        .shadow(color: Color(#colorLiteral(
                            red:0.7608050108,
                            green: 0.8164883852,
                            blue: 0.9259157777,
                            alpha: 1)), radius: 20, x: 20, y: 20)
                        .shadow(color: Color.white, radius: 20, x: -20, y: -20)
                )
        })
    }
}



//VStack(spacing: 30) {
//    Button (action: {
//        self.showingPlayersView.toggle()
//    }) {
//        Text("Карточка")
//    } .sheet(isPresented: $showingPlayersView) {
//        PlayersView()
//    }
//    Button(action: {}, label: {
//        ModifiedButtonVIew(image: "photo")
//    })
//    Button(action: {}, label: {
//        ModifiedButtonVIew(image: "alarm")
//    })
//}
//Spacer()


//import SwiftUI
//
//struct MenuView: View {
//
//    @State private var vampiresCount = 3.0
//
//    @State private var showingPlayersView = false
//
//    var body: some View {
//        VStack {
//            HStack {
//                VStack {
//                    Text("Карточка")
//                        .foregroundStyle(Color(.black).opacity(0.8))
//                        .padding(40)
//                    Text("Локация")
//                        .foregroundStyle(Color(.black).opacity(0.8))
//                        .padding(40)
//                    Text("Таймер")
//                        .foregroundStyle(Color(.black).opacity(0.8))
//                        .padding(40)
//                }
//                .padding(30)
//                VStack(spacing: 30) {
//                    Button (action: {
//                        self.showingPlayersView.toggle()
//                    }) {
//                        Text("Карточка")
//                    } .sheet(isPresented: $showingPlayersView) {
//                        PlayersView()
//                    }
//                    Button(action: {}, label: {
//                        ModifiedButtonVIew(image: "photo")
//                    })
//                    Button(action: {}, label: {
//                        ModifiedButtonVIew(image: "alarm")
//                    })
//                }
//                Spacer()
//            }
//            .padding(.bottom, 50)
//
//            //MARK: Slider logic
//
//            HStack {
//                Text("Игроки:")
//                    .fontWeight(.bold)
//                    .foregroundStyle(Color(.black).opacity(0.8))
//                if vampiresCount == 10.0 {
//                    Text("max")
//                        .font(.title2)
//                } else {
//                    Text("\(Int(vampiresCount))")
//                        .font(.title2)
//                }
//            }
//            HStack {
//                Text("min")
//                Slider(value: $vampiresCount, in: 3...10.0
//                )
//                .frame(width: 280)
//                .tint(.orange)
//                Text("10")
//            }
//            HStack {
//                Text("Охотники:")
//                    .fontWeight(.bold)
//                    .foregroundStyle(Color(.black).opacity(0.8))
//                HStack {
//                    if vampiresCount <= 4 {
//                        Text("1")
//                            .font(.title2)
//                    } else if vampiresCount > 4 && vampiresCount <= 6 {
//                        Text("1-2")
//                            .font(.title2)
//                    } else if vampiresCount > 6 && vampiresCount <= 8 {
//                        Text("1-3")
//                            .font(.title2)
//                    } else {
//                        Text("1-4")
//                            .font(.title2)
//                    }
//                }
//            }
//        }
//        .padding(.bottom, 100)
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(Color(#colorLiteral(red:0.8980392157, green: 0.9333333333, blue: 1, alpha: 1)))
//    }
//}
//
//#Preview {
//    MenuView()
//}
//
////MARK: Buttons design
//
//struct ModifiedButtonVIew: View {
//    var image: String
//
//    var body: some View {
//        Button(action: {}, label: {
//            Image(systemName: image)
//                .font(.system(size: 25, weight: .bold))
//                .padding(.all, 25)
//                .foregroundColor(.black.opacity(0.8))
//                .background(
//                    ZStack {
//                        Color(#colorLiteral(red:0.7608050108,
//                                            green: 0.8164883852,
//                                            blue: 0.9259157777,
//                                            alpha: 1))
//                        Circle()
//                            .foregroundColor(.white)
//                            .blur(radius: 4)
//                            .offset(x: -8, y: -8)
//
//                        Circle()
//                            .fill(LinearGradient(
//                                gradient: Gradient(colors: [Color(
//                                    red: 231,
//                                    green: 238,
//                                    blue: 253), Color.white]),
//                                startPoint:
//                                        .topLeading, endPoint: .bottomTrailing))
//                            .padding(2)
//                            .blur(radius: 2)
//                    }
//                        .clipShape(Circle())
//                        .shadow(color: Color(#colorLiteral(
//                            red:0.7608050108,
//                            green: 0.8164883852,
//                            blue: 0.9259157777,
//                            alpha: 1)), radius: 20, x: 20, y: 20)
//                        .shadow(color: Color.white, radius: 20, x: -20, y: -20)
//                )
//        })
//    }
//}

