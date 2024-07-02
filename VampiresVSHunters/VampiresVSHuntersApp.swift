//
//  VampiresVSHuntersApp.swift
//  VampiresVSHunters
//
//  Created by deshollow on 10.01.2024.
//

import SwiftUI

@main
struct VampiresVSHuntersApp: App {
    
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            OpenView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
