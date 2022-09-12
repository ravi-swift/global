//
//  CartTransaction.swift
//  VOnPharmaCare
//
//  Created by MAC on 21/09/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation
import UIKit
import CoreData
import NotificationCenter

let context = appDelegate.persistentContainer.viewContext
let entity = NSEntityDescription.entity(forEntityName: "CartData", in: context)


func saveCartData(product: AddProductRequest, iscomeFromAddCartDat: Bool){
    if isExist(product: product){
        if let data = getExistingProduct(product: product){
            data.setValuesForKeys(product.toJSON())
            do{
                print("Updating")
               try context.save()
            }catch {
                print("Failed updating")
            }
//                showToast(message: "Added to cart")
        }
        /*
        if iscomeFromAddCartDat == false {
            showToast(message: "Product is already in cart")
        }else{
            if let data = getExistingProduct(product: product){
                data.setValuesForKeys(product.toJSON())
                do{
                    print("Updating")
                   try context.save()
                }catch {
                    print("Failed updating")
                }
//                showToast(message: "Added to cart")
            }
        }
 */
    }else{
        if iscomeFromAddCartDat == false {
            let newProduct = NSManagedObject(entity: entity!, insertInto: context)
            newProduct.setValuesForKeys(product.toJSON())
            do {
               try context.save()
               NotificationCenter.default.post(name: Notification.Name("quicklyBuyProductAdded"), object: nil)
    //            showToast(message: "Added to cart")
              } catch {
               print("Failed saving")
            }
        }
    }
}

func getCartData() -> [AddProductRequest]{
    var productArray: [AddProductRequest] = []
    let request = NSFetchRequest<NSManagedObject>(entityName: "CartData")
   
    do {
        let result = try context.fetch(request) as! [CartData]
        print(request)
        for i in result{
            let product = AddProductRequest(medicine_id: Int(truncating: NSNumber(value: i.medicine_id)), price: CGFloat(i.price), prescription: i.prescription, qty: Int(truncating: NSNumber(value: i.qty)), discount_price: CGFloat(i.discount_price), medicine_name: i.medicine_name, medicine_descriptions: i.medicine_descriptions, product_discount_value: CGFloat(i.product_discount_value), price_diff_value: CGFloat(i.price_diff_value))
            productArray.append(product)
        }
        return productArray
    } catch {
        print("Failed")
    }
    return productArray
}

func isExist(product: AddProductRequest) -> Bool{
    let request = NSFetchRequest<NSFetchRequestResult>(entityName: "CartData")
    let predicate = NSPredicate(format: "medicine_id = %d", Int64(product.medicine_id ?? 0))
    request.predicate = predicate
    do {
        let results = try context.fetch(request)
        return results.isEmpty ? false : true
    } catch {
        print("Failed")
    }
    return false
}

func getExistingProduct(product: AddProductRequest) -> NSManagedObject?{
    let request = NSFetchRequest<NSFetchRequestResult>(entityName: "CartData")
    let predicate = NSPredicate(format: "medicine_id = %d", Int64(product.medicine_id ?? 0))
    request.predicate = predicate
    do {
        let results = try context.fetch(request) as! [NSManagedObject]
        return results.first ?? results[0]
    } catch {
        print("Failed")
    }
    return nil
}

func getPrescriptionRequiredProducts() -> [AddProductRequest]{
    var productArray: [AddProductRequest] = []
    let request = NSFetchRequest<NSManagedObject>(entityName: "CartData")
    let predicate = NSPredicate(format: "prescription == true")
    request.predicate = predicate
    do {
        let results = try context.fetch(request) as! [CartData]
        for i in results{
            let product = AddProductRequest(medicine_id: Int(truncating: NSNumber(value: i.medicine_id)), price: CGFloat(i.price), prescription: i.prescription, qty: Int(truncating: NSNumber(value: i.qty)), discount_price: CGFloat(i.discount_price), medicine_name: i.medicine_name, medicine_descriptions: i.medicine_descriptions, product_discount_value: CGFloat(i.product_discount_value), price_diff_value: CGFloat(i.price_diff_value))
            productArray.append(product)
        }
        return productArray
    } catch {
        print("Failed")
    }
    return productArray
}

func getNormalProducts() -> [AddProductRequest]{
    var productArray: [AddProductRequest] = []
    let request = NSFetchRequest<NSManagedObject>(entityName: "CartData")
    let predicate = NSPredicate(format: "prescription == false")
    request.predicate = predicate
    do {
        let results = try context.fetch(request) as! [CartData]
        for i in results{
            let product = AddProductRequest(medicine_id: Int(truncating: NSNumber(value: i.medicine_id)), price: CGFloat(i.price), prescription: i.prescription, qty: Int(truncating: NSNumber(value: i.qty)), discount_price: CGFloat(i.discount_price), medicine_name: i.medicine_name, medicine_descriptions: i.medicine_descriptions, product_discount_value: CGFloat(i.product_discount_value), price_diff_value: CGFloat(i.price_diff_value))
            productArray.append(product)
        }
        print(productArray.toJSON())
        return productArray
    } catch {
        print("Failed")
    }
    return productArray
}

func removeProductFromCart(id: Int){
    let request = NSFetchRequest<NSManagedObject>(entityName: "CartData")
    let predicate = NSPredicate(format: "medicine_id = %d",id)
    request.predicate = predicate
    do {
        let results = try context.fetch(request)
        if let first = results.first{
            context.delete(first)
            do{
                print("Deleted Product")
               try context.save()
            }catch {
                print("Failed deleting")
            }
        }
    } catch {
        print("Failed")
    }
}

func removeAllProductsFromCart(){
    let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "CartData")
    let request = NSBatchDeleteRequest(fetchRequest: fetch)
    do {
        try context.execute(request)
        do{
            print("Deleted All product")
            try context.save()
        }catch {
            print("Failed deleting")
        }
    } catch {
        print("Failed")
    }
}
