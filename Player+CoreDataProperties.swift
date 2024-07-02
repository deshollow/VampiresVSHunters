//
//  Player+CoreDataProperties.swift
//  VampiresVSHunters
//
//  Created by deshollow on 11.06.2024.
//

import Foundation
import CoreData


extension Player {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Player> {
        return NSFetchRequest<Player>(entityName: "Player")
    }

    @NSManaged public var name: String?

}

extension Player : Identifiable {

}

