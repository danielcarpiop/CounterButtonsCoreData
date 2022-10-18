//
//  Entity+CoreDataProperties.swift
//  CounterButtons
//
//  Created by mobdev on 17-10-22.
//
//

import Foundation
import CoreData


extension Entity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Entity> {
        return NSFetchRequest<Entity>(entityName: "Entity")
    }

    @NSManaged public var valueCD: Int64

}

extension Entity : Identifiable {

}
