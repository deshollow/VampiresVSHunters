//
//  PlayersView.swift
//  VampiresVSHunters
//
//  Created by deshollow on 21.01.2024.
//

import SwiftUI

struct TagItem: Identifiable, Hashable {
    
    var id = UUID().uuidString
    var name: String
    var size: CGFloat = 0
}

extension UIScreen {
    static func getScreenWidth() -> CGFloat {
        return UIScreen.main.bounds.width
    }
    func getScreenHeight() -> CGFloat {
        return UIScreen.main.bounds.height
    }
}

extension String {
    func getSize() -> CGFloat {
        let font = UIFont.systemFont(ofSize: 16)
        let attribute = [NSAttributedString.Key.font: font]
        let size = (self as NSString).size(withAttributes: attribute)
        return size.width
    }
}

struct PlayersView: View {
    
    @State private var showingAlert = false
    @StateObject private var tagsViewModel = TagsViewModel()
    
    var body: some View {
        ZStack {
            VStack {
                Text("Кто будет играть?")
                    .foregroundStyle(Color(.black).opacity(0.8))
                    .padding(80)
                VStack {
                    TextField(" ", text: $tagsViewModel.tag, onCommit: {
                        tagsViewModel.addTag()
                    })
                    .padding()
                    .frame(height: 60)
                    .frame(width: 350)
                    .overlay{
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(lineWidth: 1.0)
                            HStack {
                                Text("Впишите имя")
                                    .padding(.horizontal, 15)
                                    .padding(.vertical, 5)
                                    .background(.orange)
                                    .foregroundColor(.white)
                                    .cornerRadius(5)
                                    .font(.headline)
                                    .offset(x: 15, y: -32)
                                Spacer()
                            }
                        }
                    }
                    VStack(alignment: .leading) {
                        ForEach(tagsViewModel.rows, id: \.self) { rows in
                            HStack(spacing: 15) {
                                ForEach(rows) { row in
                                    Text(row.name)
                                        .font(.system(size: 16))
                                        .padding(10)
                                        .padding(.trailing, 20)
                                        .background(
                                            ZStack(alignment: .trailing) {
                                                Capsule()
                                                    .fill(.gray.opacity(0.1))
                                                Button{
                                                    tagsViewModel.removeTag(by: row.id)
                                                } label: {
                                                    Image(systemName: "xmark")
                                                        .frame(width: 15,
                                                               height: 15)
                                                        .padding(10)
                                                        .foregroundColor(.orange)
                                                }
                                            }
                                        )
                                }
                            }
                        }
                    }
                    Spacer()
                    Text("От трех до десяти игроков")
                        .foregroundStyle(Color(.black).opacity(0.8))
                        .onTapGesture {
                        }
                        .animation(.bouncy)
                    Spacer()
                    Button("Сохранить") {
                        if tagsViewModel.tags.count < 3 {
                            showingAlert = true
                        } else if tagsViewModel.tags.count > 10 {
                            showingAlert = true
                        } else {
                            print("its ok")
                        }
                    }
                    .alert(isPresented: $showingAlert) {
                        Alert(title: Text("Неверное количество игроков"),
                              message: Text("В игре может быть от 3 до 10 участников"),
                              dismissButton: .cancel(Text("Ок")))
                        
                    }
                    .font(.title)
                    .foregroundColor(.blue)
                    .padding(.bottom, 100)
                }
            }
            .padding(10)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    CustomBackButtonView()
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(#colorLiteral(red:0.8980392157, green: 0.9333333333, blue: 1, alpha: 1)))
    }
}

#Preview {
    PlayersView()
}
