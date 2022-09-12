//
//  ResponseModel.swift
//  VOnPharmaCare
//
//  Created by MAC on 02/06/1942 Saka.
//  Copyright © 1942 MAC. All rights reserved.
//

import Foundation
import ObjectMapper

class SignUpResponse: Mappable {
    public var id: Int?
    public var first_name: String?
    public var last_name: String?
    public var email: String?
    public var phone: String?
    public var authenticated: Int?
    public var password: String?
    public var image: String?
    public var api_token: String?
    public var referal_code: String?
    public var referal_from: String?
    public var referal_from_name: String?
    public var wallet_balance: Float?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        first_name <- map["first_name"]
        last_name <- map["last_name"]
        email <- map["email"]
        phone <- map["phone"]
        authenticated <- map["authenticated"]
        password <- map["password"]
        image <- map["image"]
        api_token <- map["api_token"]
        referal_code <- map["referal_code"]
        referal_from <- map["referal_from"]
        referal_from_name <- map["referal_from_name"]
        wallet_balance <- map["wallet_balance"]
    }
}

class HomeListReponse: Mappable {
    public var referal_sender: Int?
    public var referal_receiver: Int?
    public var delivery_charge: CGFloat?
    public var delivery_charge_limit : String?
    public var delivery_charge_text : String?
    public var slider: [SliderData]?
    public var categories: [CategoriesData]?
    public var product: [HomeProducts]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        slider <- map["slider"]
        categories <- map["categories"]
        product <- map["product"]
        delivery_charge <- map["delivery_charge"]
        delivery_charge_limit <- map["delivery_charge_limit"]
        delivery_charge_text <- map["delivery_charge_text"]
        referal_sender <- map["referal_sender"]
        referal_receiver <- map["referal_receiver"]
    }
}
class SliderData: Mappable{
    public var id:Int?
    public var name: String?
    public var link: String?
    public var image: String?
    public var category: Int?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        link <- map["link"]
        image <- map["image"]
        category <- map["category"]
    }
}
class CategoriesData: Mappable {
    public var id:Int?
    public var name: String?
    public var slug: String?
    public var type: Int?
    public var image: String?
    public var categories_id: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        slug <- map["slug"]
        type <- map["type"]
        image <- map["image"]
        categories_id <- map["categories_id"]
    }
}
class HomeProducts: Mappable{
    public var name: String?
    public var items: [HomeProductsData]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        items <- map["items"]
    }
}
class HomeProductsData: Mappable{
    public var id: Int?
    public var name: String?
    public var generic_name: String?
    public var manufature: Int?
    public var batch_no: Int?
    public var price: CGFloat?
    public var discount: Int?
    public var discount_price: CGFloat?
    public var expiration_date: String?
    public var video_url: String?
    public var prescription_required: Bool?
    public var categories: String?
    public var status : Int?
    public var qty: String?
    public var image: [String]?
    public var package_per_unit: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        generic_name <- map["generic_name"]
        manufature <- map["manufature"]
        batch_no <- map["batch_no"]
        price <- map["price"]
        discount <- map["discount"]
        discount_price <- map["discount_price"]
        expiration_date <- map["expiration_date"]
        video_url <- map["video_url"]
        prescription_required <- map["prescription_required"]
        categories <- map["categories"]
        status <- map["status"]
        qty <- map["qty"]
        image <- map["image"]
        package_per_unit <- map["package_per_unit"]
    }
}

class ExistinPrescriptionList: Mappable {
    public var id: Int?
    public var image: [ImageData]?
    public var date: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        image <- map["image"]
        date <- map["date"]
    }
}
class ImageData: Mappable {
    public var id: Int?
    public var img: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        img <- map["img"]
    }
}

class Section: Mappable {
    public var sectionName: String?
    public var section: [SectionItem]?
    
    init(sectionName: String?,section: [SectionItem]?) {
        self.sectionName = sectionName
        self.section = section
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        sectionName <- map["sectionName"]
        section <- map["section"]
    }
}
class SectionItem: Mappable {
    public var name: String?
    public var imgName : String?
    
    init(name: String?,imgName: String?) {
        self.name = name
        self.imgName = imgName
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        imgName <- map["imgName"]
    }
}
class AddressResponse: Mappable{
    public var id: Int?
    public var customer_id: Int?
    public var first_name: String?
    public var last_name: String?
    public var email: String?
    public var phone: String?
    public var address: String?
    public var type: Int?
    public var country: String?
    public var state: String?
    public var city: String?
    public var zip: String?
    
    public var area: String?
    public var pin: String?
    public var mobilePhone: Int?
    public var alternativ_phone: String?
    public var landmark: String?
    public var lat: Double?
    public var lang: Double?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        customer_id <- map["customer_id"]
        first_name <- map["first_name"]
        last_name <- map["last_name"]
        email <- map["email"]
        phone <- map["phone"]
        address <- map["address"]
        type <- map["type"]
        country <- map["country"]
        state <- map["state"]
        city <- map["city"]
        zip <- map["zip"]
        
        area <- map["area"]
        pin <- map["pin"]
        mobilePhone <- map["phone"]
        alternativ_phone <- map["alternativ_phone"]
        landmark <- map["landmark"]
        lat <- map["lat"]
        lang <- map["lang"]
    }
}
class ProductListReponse: Mappable {
    public var id: Int?
    public var name: String?
    public var generic_name : String?
    public var manufacture: String?
    public var batch_no: Int?
    public var price: Double?
    public var discount: Double?
    public var discount_price: Double?
    public var expiration_date: String?
    public var video_url: String?
    public var prescription_required: Bool?
    public var categories: String?
    public var status: Int?
    public var qty: String?
    public var image: [String]?
    public var package_per_unit: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        generic_name <- map["generic_name"]
        manufacture <- map["manufacture"]
        batch_no <- map["batch_no"]
        price <- map["price"]
        discount <- map["discount"]
        discount_price <- map["discount_price"]
        expiration_date <- map["expiration_date"]
        video_url <- map["video_url"]
        prescription_required <- map["prescription_required"]
        categories <- map["categories"]
        status <- map["status"]
        qty <- map["qty"]
        image <- map["image"]
        package_per_unit <- map["package_per_unit"]
        
    }
}

class RequestMedicineListReponse: Mappable {
    public var id: Int?
    public var order_number: String?
    public var customer_id: Int?
    public var order_status: String?
    public var description: String?
    public var created_at: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        order_number <- map["order_number"]
        customer_id <- map["customer_id"]
        order_status <- map["order_status"]
        description <- map["description"]
        created_at <- map["created_at"]
    }
}
class PendingOrderResponse: Mappable{
    public var id: Int?
    public var order_number: String?
    public var order_type: Int?
    public var sub_total: String?
    public var discount: String?
    public var order_status: String?
    public var payment_status: String?
    public var grand_total: String?
    public var self_pickup: Int?
    public var created_at: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        order_number <- map["order_number"]
        order_type <- map["order_type"]
        sub_total <- map["sub_total"]
        discount <- map["discount"]
        order_status <- map["order_status"]
        payment_status <- map["payment_status"]
        grand_total <- map["grand_total"]
        self_pickup <- map["self_pickup"]
        created_at <- map["created_at"]
    }
}
class NotificationResponse: Mappable{
    public var id: Int?
    public var order_id: Int?
    public var notification: String?
    public var title: String?
    public var notification_type: String?
    public var created_at: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        order_id <- map["order_id"]
        notification <- map["notification"]
        title <- map["title"]
        notification_type <- map["notification_type"]
        created_at <- map["created_at"]
    }
}
class PageResponse: Mappable{
    public var id: Int?
    public var name: String?
    public var text: String?
    public var created_at: String?
    public var updated_at: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        text <- map["text"]
        created_at <- map["created_at"]
        updated_at <- map["updated_at"]
    }
}

class ProductDetailResponse: Mappable{
    public var id: Int?
    public var name: String?
    public var composition: String?
    public var composition_array: [CompositionData]?
    public var generic_name : String?
    public var manufature: String?
    public var price: CGFloat?
    public var discount: Int?
    public var discount_price: CGFloat?
    public var batch_no: Int?
    public var expiration_date: String?
    public var video_url: String?
    public var prescription_required: Bool?
    public var categories: [String]?
    public var status: Int?
    public var qty: String?
    public var image: [String]?
    public var package_per_unit : String?
    public var description: String?
    public var stock_manager: Int?
    public var product: [Product]?
    public var substitutes: [String]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        composition <- map["composition"]
        composition_array <- map["composition_array"]
        generic_name <- map["generic_name"]
        manufature <- map["manufature"]
        price <- map["price"]
        discount <- map["discount"]
        discount_price <- map["discount_price"]
        batch_no <- map["batch_no"]
        expiration_date <- map["expiration_date"]
        video_url <- map["video_url"]
        prescription_required <- map["prescription_required"]
        categories <- map["categories"]
        status <- map["status"]
        qty <- map["qty"]
        image <- map["image"]
        package_per_unit <- map["package_per_unit"]
        description <- map["description"]
        stock_manager <- map["stock_manager"]
        product <- map["product"]
        substitutes <- map["subsitutes"]
    }
}
class Product: Mappable{
    public var items: [String]?
    public var name: String?
    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        items <- map["items"]
        name <- map["name"]
    }
}
class CompositionData: Mappable{
    public var salt_id: Int?
    public var name: String?
    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        salt_id <- map["salt_id"]
        name <- map["name"]
    }
}
class SaltResponse: Mappable{
    public var salt_id: Int?
    public var name: String?
    public var salt: [SaltData]?
    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        salt_id <- map["salt_id"]
        name <- map["name"]
        salt <- map["salt"]
    }
}
class SaltData : Mappable{
    public var name: String?
    public var description: String?
    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        description <- map["description"]
    }
}

class SubstituteResponse: Mappable{
    public var id: Int?
    public var user_id: Int?
    public var name: String?
    public var composition: String?
    public var generic_name: String?
    public var manufature: Int?
    public var batch_no: Int?
    public var price: CGFloat?
    public var discount: Int?
    public var discount_price: CGFloat?
    public var expiration_date: String?
    public var video_url: String?
    public var prescription_required: Bool?
    public var categories: String?
    public var status: Int?
    public var qty: String?
    public var image: [String]?
    public var description: String?
    public var package_per_unit: String?
    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        user_id <- map["user_id"]
        name <- map["name"]
        composition <- map["composition"]
        generic_name <- map["generic_name"]
        manufature <- map["manufature"]
        batch_no <- map["batch_no"]
        price <- map["price"]
        discount <- map["discount"]
        discount_price <- map["discount_price"]
        expiration_date <- map["expiration_date"]
        video_url <- map["video_url"]
        prescription_required <- map["prescription_required"]
        categories <- map["categories"]
        status <- map["status"]
        qty <- map["qty"]
        image <- map["image"]
        description <- map["description"]
        package_per_unit <- map["package_per_unit"]
    }
}

class OrderResponse: Mappable{
    public var images: [String]?
    public var order_id: Int?
    public var order_status:String?
    public var payment_status: String?
    public var payment_type: String?
    public var order_number: String?
    public var name: String?
    public var phone: String?
    public var address: String?
    public var order_date: String?
    public var shipping_price: String?
    public var self_pickup: Bool?
    public var delievery_date: String?
    public var sub_total: String?
    public var discount: CGFloat?
    public var coupon: String?
    public var discount_type: String?
    public var discount_value: String?
    public var price_discount: String?
    public var total_recived: String?
    public var grand_total: String?
    public var reject_reason: String?
    public var prescription_order_item: [PrescriptionOrderItem]?
    public var order_item: [PrescriptionOrderItem]?
    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        images <- map["images"]
        order_id <- map["order_id"]
        order_status <- map["order_status"]
        payment_status <- map["payment_status"]
        payment_type <- map["payment_type"]
        order_number <- map["order_number"]
        name <- map["name"]
        phone <- map["phone"]
        address <- map["Address"]
        order_date <- map["order_date"]
        shipping_price <- map["shipping_price"]
        self_pickup <- map["self_pickup"]
        delievery_date <- map["delievery_date"]
        sub_total <- map["sub_total"]
        discount <- map["discount"]
        coupon <- map["coupon"]
        discount_type <- map["discount_type"]
        discount_value <- map["discount_value"]
        price_discount <- map["price_discount"]
        total_recived <- map["total_recived"]
        grand_total <- map["grand_total"]
        prescription_order_item <- map["prescription_order_item"]
        order_item <- map["order_item"]
        reject_reason <- map["reject_reason"]
    }
    
}
class PrescriptionOrderItem: Mappable{
    public var id: Int?
    public var pro_id: Int?
    public var pro_name: String?
    public var pro_sku: String?
    public var pro_mrp_price: String?
    public var pro_discount_value: String?
    public var pro_discount_price: String?
    public var pro_price: String?
    public var pro_description: String?
    public var pro_qty: String?
    public var total_amount: String?
    public var prescription_required: Bool?
    public var package_per_unit: String?
    public var manufacturar: String?
    public var pack_size_label: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        pro_id <- map["pro_id"]
        pro_name <- map["pro_name"]
        pro_sku <- map["pro_sku"]
        pro_mrp_price <- map["pro_mrp_price"]
        pro_discount_value <- map["pro_discount_value"]
        pro_discount_price <- map["pro_discount_price"]
        pro_price <- map["pro_price"]
        pro_description <- map["pro_description"]
        pro_qty <- map["pro_qty"]
        total_amount <- map["total_amount"]
        prescription_required <- map["prescription_required"]
        package_per_unit <- map["package_per_unit"]
        manufacturar <- map["manufacturar"]
        pack_size_label <- map["pack_size_label"]
    }
}
class CouponResponse: Mappable {
    public var id: Int?
    public var code: String?
    public var discount_type: Int?
    public var value: String?
    public var minimum_cart_amount: String?
    public var maximun_spend: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        code <- map["code"]
        discount_type <- map["discount_type"]
        value <- map["value"]
        minimum_cart_amount <- map["minimum_cart_amount"]
        maximun_spend <- map["maximun_spend"]
    }
}
class PlaceOrderResponse: Mappable{
//    public var customer_id: Int?
//    public var currency: String?
    public var order_number: String?
//    public var invoice_no: String?
//    public var order_type: Int?
//    public var shipping_price: String?
//    public var self_pickup: String?
//    public var phone: String?
//    public var email: String?
//    public var first_name: String?
//    public var last_name: String?
//    public var address: String?
//    public var city: String?
//    public var pin_code: String?
//    public var country: String?
//    public var state: String?
//    public var grand_total: String?
//    public var note: String?
//    public var coupon: String?
//    public var discount_type: String?
//    public var price_discount: String?
//    public var discount: String?
    public var sub_total: String?
    public var id: Int?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        order_number <- map["order_number"]
        id <- map["id"]
    }
}
class RequestMedicineDetails: Mappable {
    public var id: Int?
    public var order_number: String?
    public var customer_id: Int?
    public var order_status: String?
    public var description: String?
    public var images: [String]?
    public var medicine: [PrescriptionOrderItem]?
    public var created_at: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        order_number <- map["order_number"]
        customer_id <- map["customer_id"]
        order_status <- map["order_status"]
        description <- map["description"]
        images <- map["images"]
        medicine <- map["medicine"]
        created_at <- map["created_at"]
    }
}
class UserNotificationResponse: Mappable{
    public var aps: NotificationApsData?
    public var custom: NotificationAData?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        aps <- map["aps"]
        custom <- map["custom"]
    }
}
class NotificationAData: Mappable {
    public var a: NotificationCustomeData?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        a <- map["a"]
    }
}
class NotificationCustomeData: Mappable{
    public var alert: String?
    public var notification_type: Int?
    public var order_id: Int?
    public var title: String?
    public var type: String?
    public var text: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        alert <- map["alert"]
        notification_type <- map["notification_type"]
        order_id <- map["order_id"]
        title <- map["title"]
        type <- map["type"]
        text <- map["text"]
    }
}
class NotificationApsData: Mappable{
    public var customer_id: Int?
    public var mutable_content: String?
    public var sound: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        customer_id <- map["customer_id"]
        mutable_content <- map["mutable-content"]
        sound <- map["sound"]
    }
}

class GetLangusge: Mappable{
    public var success: String?
    public var message: String?
    public var data: [GetLanguageData]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        success <- map["success"]
        message <- map["message"]
        data <- map["data"]
    }
}

class GetLanguageData: Mappable {
    public var language_id: Int?
    public var language_name: String?
    public var language_code: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        language_id <- map["language_id"]
        language_name <- map["language_name"]
        language_code <- map["language_code"]
    }
}

class GetLanguageWords: Mappable {
    public var success: String?
    public var data: [AllWordsDetails]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        success <- map["success"]
        data <- map["data"]
    }
}

class AllWordsDetails: Mappable {
    public var title: String?
    public var value: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        title <- map["title"]
        value <- map["value"]
    }
}

class GetOrderHistory: Mappable {
    public var success: String?
    public var data: OrderHistoryData?
    public var message: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        success <- map["success"]
        data <- map["data"]
        message <- map["message"]
    }
}

class OrderHistoryData: Mappable {
    public var total_amount: Float?
    public var orders: [AllOrdersHistory]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        total_amount <- map["total_amount"]
        orders <- map["orders"]
    }
}

class AllOrdersHistory: Mappable {
    public var order_id: Int?
    public var order_number: String?
    public var payable_amount: String?
    public var date: String?
    public var order_type: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        order_id <- map["order_id"]
        order_number <- map["order_number"]
        payable_amount <- map["payable_amount"]
        date <- map["date"]
        order_type <- map["order_type"]
    }
}

class GenerateCode: Mappable {
    public var success: String?
    public var data: [GenerateCodeData]?
    public var message: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        success <- map["success"]
        data <- map["data"]
        message <- map["message"]
    }
}

class GenerateCodeData: Mappable {
    public var id: Int?
    public var first_name: String?
    public var last_name: String?
    public var email: String?
    public var phone: String?
    public var authenticated: Int?
    public var password: String?
    public var referal_code: String?
    public var referal_from: String?
    public var referal_from_name: String?
    public var wallet_balance: Float?
    public var image: String?
    public var api_token: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        first_name <- map["first_name"]
        last_name <- map["last_name"]
        email <- map["email"]
        phone <- map["phone"]
        authenticated <- map["authenticated"]
        password <- map["password"]
        referal_code <- map["referal_code"]
        referal_from <- map["referal_from"]
        referal_from_name <- map["referal_from_name"]
        wallet_balance <- map["wallet_balance"]
        image <- map["image"]
        api_token <- map["api_token"]
    }
}

class WalletResponse: Mappable {
    public var wallet_balance: Int?
    public var history: [WalletHistoryData]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        wallet_balance <- map["wallet_balance"]
        history <- map["history"]
    }
}

class WalletHistoryData: Mappable {
    public var id: Int?
    public var user_id: Int?
    public var message: String?
    public var display_name: String?
    public var amount:String?
    public var transaction_type: Int?
    public var transaction_method: Int?
    public var transaction_obj: String?
    public var created_at: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        user_id <- map["user_id"]
        message <- map["message"]
        amount <- map["amount"]
        display_name <- map["display_name"]
        transaction_type <- map["transaction_type"]
        transaction_method <- map["transaction_method"]
        transaction_obj <- map["transaction_obj"]
        created_at <- map["created_at"]
    }
}

class ForgotPasswordResponse: Mappable {
    public var id: Int?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
    }
}
