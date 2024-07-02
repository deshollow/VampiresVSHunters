//
//  TagViewModel.swift
//  VampiresVSHunters
//
//  Created by deshollow on 06.05.2024.
//

import SwiftUI
import Combine
import CoreData

class TagsViewModel: ObservableObject {
    
    @Published var tag: String = ""
    @Published var rows: [[TagItem]] = []
    @Published var tags: [TagItem] = []
    
    private let viewContext = PersistenceController.shared.container.viewContext
    private let fetchRequest = Player.fetchRequest()
    init() {
        seed()
        prepareTagsList()
    }
    
    func addTag() {
        let newPlayer = Player(context: viewContext)
        newPlayer.name = tag

        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        
        tag = ""
        prepareTagsList()
    }
    func removeTag(by id: NSManagedObjectID) {
        let player = viewContext.object(with: id)
        viewContext.delete(player)
        
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        prepareTagsList()
    }
    func prepareTagsList() {
        let players = try? viewContext.fetch(fetchRequest)
        if let players = players, !players.isEmpty {
            tags = players.map({ player in
                return TagItem(name: player.name ?? "", managedObjectId: player.objectID)
            })
        }
        
        var rows: [[TagItem]] = []
        var curRow: [TagItem] = []
        let screenWidth = UIScreen.getScreenWidth() - 20
        
        if !tags.isEmpty {
            for index in 0..<tags.count {
                self.tags[index].size = tags[index].name.getSize()
            }
            var totalWidth: CGFloat = 0
            let spacing: CGFloat = 65
            
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
    
    private func seed() {
        let fetchRequest = Player.fetchRequest()
        let players = try? viewContext.fetch(fetchRequest)
        if let players = players, players.isEmpty {
            let player1 = Player(context: viewContext)
            player1.name = "Юля"
            
            let player2 = Player(context: viewContext)
            player2.name = "Антон"
            
            let player3 = Player(context: viewContext)
            player3.name = "Илья"
            
            let player4 = Player(context: viewContext)
            player4.name = "Арсений"
            
            let player5 = Player(context: viewContext)
            player5.name = "Петя"
            
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}


