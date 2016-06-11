//
//  Creature+CoreDataProperties.swift
//  MCMSSwift2
//
//  Created by Cindy Barnsdale on 6/11/16.
//  Copyright © 2016 Pelican Inc. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Creature {

    @NSManaged var creatureName: String?
    @NSManaged var cretureAccessory: NSObject?
    @NSManaged var creatureImage: NSData?

}
