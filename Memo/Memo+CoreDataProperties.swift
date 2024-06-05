//
//  Memo+CoreDataProperties.swift
//  Memo
//
//  Created by JONGHUN PARK on 6/5/24.
//
//

import Foundation
import CoreData


extension Memo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Memo> {
        return NSFetchRequest<Memo>(entityName: "Memo")
    }

    @NSManaged public var date: Date?
    @NSManaged public var title: String?
    @NSManaged public var content: String?

}

extension Memo : Identifiable {

}
