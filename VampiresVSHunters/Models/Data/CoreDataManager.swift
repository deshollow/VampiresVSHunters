//
//  CoreDataManager.swift
//  VampiresVSHunters
//
//  Created by deshollow on 09.06.2024.
//

import Foundation
import CoreData

final class CoreDataManager {
    private let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "PlayersDataModel")
        container.loadPersistentStores { (_, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    private lazy var mainContext: NSManagedObjectContext = {
        return persistentContainer.viewContext
    }()
    
    func saveContext() {
        if mainContext.hasChanges {
            do {
                try mainContext.save()
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
    }
}
