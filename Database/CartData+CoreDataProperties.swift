//
//  CartData+CoreDataProperties.swift
//  
//
//  Created by MAC on 21/09/20.
//
//

import Foundation
import CoreData


extension CartData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CartData> {
        return NSFetchRequest<CartData>(entityName: "CartData")
    }

    @NSManaged public var qty: Int64
    @NSManaged public var product_discount_value: Float
    @NSManaged public var price_diff_value: Float
    @NSManaged public var price: Float
    @NSManaged public var prescription: Bool
    @NSManaged public var medicine_name: String?
    @NSManaged public var medicine_id: Int64
    @NSManaged public var medicine_descriptions: String?
    @NSManaged public var discount_price: Float

}
