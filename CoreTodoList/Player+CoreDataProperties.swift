//
//  Player+CoreDataProperties.swift
//  CoreTodoList
//
//  Created by Tringapps on 01/04/22.
//
//

import Foundation
import CoreData


extension Player {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Player> {
        return NSFetchRequest<Player>(entityName: "Player")
    }

    @NSManaged public var name: String
    @NSManaged public var country: String
    @NSManaged public var role: String
    @NSManaged public var id: Int16
    @NSManaged public var image: String

}

extension Player : Identifiable {

}
