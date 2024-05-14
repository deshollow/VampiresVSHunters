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
    @StateObject var tagsViewModel = TagsViewModel()
    
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
                            showingAlert = true //alarm
                        } else if tagsViewModel.tags.count > 10 {
                            showingAlert = true //alarm
                        } else {
                            print("its ok") //save data realization
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



//I

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


// II

//import SwiftUI
//
//struct TagItem: Identifiable, Hashable {
//    var id = UUID().uuidString
//    var name: String
//    var size: CGFloat = 0
//}
//
//extension UIScreen {
//    static func getScreenWidth() -> CGFloat {
//        return UIScreen.main.bounds.width
//    }
//    func getScreenHeight() -> CGFloat {
//        return UIScreen.main.bounds.height
//    }
//}
//
//extension String {
//    func getSize() -> CGFloat {
//        let font = UIFont.systemFont(ofSize: 16)
//        let attribute = [NSAttributedString.Key.font: font]
//        let size = (self as NSString).size(withAttributes: attribute)
//        return size.width
//    }
//}
//
//class TagsViewModel: ObservableObject {
//
//    @Published var tag: String = ""
//
//    @Published var rows: [[TagItem]] = []
//
//    @Published var tags: [TagItem] = [
//        TagItem(name: "name 1"),
//        TagItem(name: "name 2"),
//        TagItem(name: "name 3"),
//        TagItem(name: "name 4"),
//        TagItem(name: "name 5"),
//    ]
//
//    init() {
//        prepareTagsList()
//    }
//    func addTag() {
//        tags.append(TagItem(name: tag))
//        tag = ""
//        prepareTagsList()
//    }
//    func removeTag(by id: String) {
//        tags = tags.filter{$0.id != id}
//        prepareTagsList()
//    }
//    func prepareTagsList() {
//
//        var rows: [[TagItem]] = []
//        var curRow: [TagItem] = []
//        let screenWidth = UIScreen.getScreenWidth() - 20
//
//        if !tags.isEmpty {
//            for index in 0..<tags.count {
//                self.tags[index].size = tags[index].name.getSize()
//            }
//            var totalWidth: CGFloat = 0
//            var spacing: CGFloat = 65
//
//            tags.forEach { tag in
//                totalWidth += (tag.size + spacing)
//                if totalWidth > screenWidth {
//                    totalWidth = (tag.size + spacing)
//                    rows.append(curRow)
//                    curRow.removeAll()
//                }
//                curRow.append(tag)
//            }
//            if !curRow.isEmpty {
//                rows.append(curRow)
//                curRow.removeAll()
//            }
//        }
//        self.rows = rows
//    }
//}
//
//struct PlayersView: View {
//
//    @StateObject var viewModel = TagsViewModel()
//
//    var body: some View {
//        VStack {
//            TextField(" ", text: $viewModel.tag, onCommit: {
//                viewModel.addTag()
//            })
//            .padding()
//            .frame(height: 60)
//            .overlay{
//                ZStack {
//                    RoundedRectangle(cornerRadius: 15)
//                        .stroke(lineWidth: 1.0)
//                    HStack {
//                        Text("Enter Tag")
//                            .padding(.horizontal, 15)
//                            .padding(.vertical, 5)
//                            .background(.blue)
//                            .foregroundColor(.white)
//                            .cornerRadius(5)
//                            .font(.headline)
//                            .offset(x: 15, y: -32)
//                        Spacer()
//                    }
//                }
//            }
//
//            VStack(alignment: .leading) {
//                ForEach(viewModel.rows, id: \.self) { rows in
//                    HStack(spacing: 15) {
//                        ForEach(rows) { row in
//                            Text(row.name)
//                                .font(.system(size: 16))
//                                .padding(10)
//                                .padding(.trailing, 20)
//                                .background(
//                                    ZStack(alignment: .trailing) {
//                                        Capsule()
//                                            .fill(.gray.opacity(0.3))
//                                        Button{
//                                            viewModel.removeTag(by: row.id)
//                                        } label: {
//                                            Image(systemName: "xmark")
//                                                .frame(width: 15,
//                                                       height: 15)
//                                                .padding(10)
//                                                .foregroundColor(.red)
//                                        }
//                                    }
//                                )
//                        }
//                    }
//                }
//            }
//        }
//        .padding(10)
////        .navigationBarBackButtonHidden(true)
////        .toolbar {
////            ToolbarItem(placement: .navigationBarLeading) {
////                CustomBackButtonView()
////            }
////        }
//    }
//}
//
//
//#Preview {
//    PlayersView()
//}

