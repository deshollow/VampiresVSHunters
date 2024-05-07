//
//  TagViewModel.swift
//  VampiresVSHunters
//
//  Created by deshollow on 06.05.2024.
//

import SwiftUI

class TagsViewModel: ObservableObject {
    
    @Published var tag: String = ""
    
    @Published var rows: [[TagItem]] = []
    
    @Published var tags: [TagItem] = [
        TagItem(name: "Илья"),
        TagItem(name: "Мира"),
        TagItem(name: "Юля"),
        TagItem(name: "Арс"),
        TagItem(name: "Пит"),
    ]
    
    init() {
        prepareTagsList()
    }
    func addTag() {
        tags.append(TagItem(name: tag))
        tag = ""
        prepareTagsList()
    }
    func removeTag(by id: String) {
        tags = tags.filter{$0.id != id}
        prepareTagsList()
    }
    func prepareTagsList() {
        
        var rows: [[TagItem]] = []
        var curRow: [TagItem] = []
        let screenWidth = UIScreen.getScreenWidth() - 20
        
        if !tags.isEmpty {
            for index in 0..<tags.count {
                self.tags[index].size = tags[index].name.getSize()
            }
            var totalWidth: CGFloat = 0
            var spacing: CGFloat = 65
            
            tags.forEach { tag in
                totalWidth += (tag.size + spacing)
                if totalWidth > screenWidth {
                    totalWidth = (tag.size + spacing)
                    rows.append(curRow)
                    curRow.removeAll()
                }
                curRow.append(tag)
            }
            if !curRow.isEmpty {
                rows.append(curRow)
                curRow.removeAll()
            }
        }
        self.rows = rows
    }
}

