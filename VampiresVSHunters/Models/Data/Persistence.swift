//
//  Persistence.swift
//  VampiresVSHunters
//
//  Created by deshollow on 11.06.2024.
//

import Foundation
import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        
        return result
    }()

    let container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "PlayersDataModel")
        container.loadPersistentStores { (_, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()

    init(inMemory: Bool = false) {
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}
