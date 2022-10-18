//
//  FavoriteMenuItem+CoreDataProperties.swift
//  GoodEating
//
//  Created by Deonte Kilgore on 10/18/22.
//
//

import Foundation
import CoreData


extension FavoriteMenuItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavoriteMenuItem> {
        return NSFetchRequest<FavoriteMenuItem>(entityName: "FavoriteMenuItem")
    }

    @NSManaged public var id: String
    @NSManaged public var img: String
    @NSManaged public var name: String
    @NSManaged public var dsc: String
    @NSManaged public var price: Float
    @NSManaged public var rate: Float
    @NSManaged public var country: String

}

extension FavoriteMenuItem : Identifiable {
    func convertToMenuItem() -> MenuItem {
        return MenuItem(id: self.id,
                        img: self.img,
                        name: self.name,
                        dsc: self.dsc,
                        price: self.price,
                        rate: self.rate,
                        country: self.country)
    }
}
