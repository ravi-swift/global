//
//  RequestModel.swift
//  VOnPharmaCare
//
//  Created by MAC on 02/06/1942 Saka.
//  Copyright © 1942 MAC. All rights reserved.
//

import Foundation
import ObjectMapper

class SignUpRequest: Mappable {
    public var first_name: String?
    public var phone: String?
    public var email: String?
    public var password: String?
    public var onesignal_token: String?
    public var device_token: String?
    public var device_type: String?
    
    init(first_name: String?,phone: String?,email: String?,password: String?,onesignal_token: String?,device_token: String?,device_type: String?) {
        self.first_name = first_name
        self.phone = phone
        self.email = email
        self.password = password
        self.onesignal_token = onesignal_token
        self.device_token = device_token
        self.device_type = device_type
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        first_name <- map["first_name"]
        phone <- map["phone"]
        email <- map["email"]
        password <- map["password"]
        onesignal_token <- map["onesignal_token"]
        device_token <- map["device_token"]
        device_type <- map["device_type"]
    }
}

class LoginRequest: Mappable{
    public var phone: String?
//    public var password: String?
    public var device_type: String?
    public var onesignal_token: String?
    public var device_token: String?
    
    init(phone: String?,password: String?,device_type: String?,onesignal_token: String?,device_token: String?){
        self.phone = phone
//        self.password = password
        self.device_type = device_type
        self.onesignal_token = onesignal_token
        self.device_token = device_token
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        phone <- map["phone"]
//        password <- map["password"]
        device_type <- map["device_type"]
        onesignal_token <- map["onesignal_token"]
        device_token <- map["device_token"]
    }
}

class ForgotPasswordRequest: Mappable {
    public var phone: String?
    
    
    init(phone: String?){
        self.phone = phone
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        phone <- map["phone"]
    }
}

class UpdatePasswordRequest: Mappable {
    public var security_pin: String?
    public var new_password: String?
    public var customer_id: Int?
    
    init(security_pin: String?,new_password: String?,customer_id: Int?){
        self.security_pin = security_pin
        self.new_password = new_password
        self.customer_id = customer_id
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        security_pin <- map["security_pin"]
        new_password <- map["new_password"]
        customer_id <- map["customer_id"]
    }
}

class CheckOTPRequest: Mappable {
    public var otp: String?
    public var customer_id: Int?
    
    init(otp: String?,customer_id: Int?){
        self.otp = otp
        self.customer_id = customer_id
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        otp <- map["otp"]
        customer_id <- map["customer_id"]
    }
}

class SectionIndex:Mappable{
    public var section: Int?
    public var row: Int?
    
    init(section:Int?,row: Int?) {
        self.section = section
        self.row = row
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        section <- map["section"]
        row <- map["row"]
    }
}
class APITokenRequest: Mappable {
    public var api_token: String?
    
    init(api_token: String?) {
        self.api_token = api_token
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        api_token <- map["api_token"]
    }
}
class AddAddressRequest: Mappable {
    public var api_token: String?
    public var first_name: String?
    public var email: String?
    public var phone: String?
    public var address: String?
    public var type: String?
    public var country: String?
    public var state: String?
    public var city: String?
    public var zip: String?
    public var additionalNumber: String?
    public var lat: Double?
    public var lang: Double?
    public var landmark: String?
    
    init(api_token: String?,first_name: String?,email: String?,phone: String?,address: String?,type: String?,country: String?,state: String?,city: String?,zip: String?,landmark: String?,additionalNumber: String?, lat: Double,lang: Double) {
        self.api_token = api_token
        self.first_name = first_name
        self.email = email
        self.phone = phone
        self.address = address
        self.type = type
        self.country = country
        self.state = state
        self.city = city
        self.zip = zip
        self.landmark = landmark
        self.additionalNumber = additionalNumber
        self.lat = lat
        self.lang = lang
    }
    
    required init?(map: Map) {
        
    }
    
    
    func mapping(map: Map) {
        api_token <- map["api_token"]
        first_name <- map["first_name"]
        email <- map["email"]
        phone <- map["phone"]
        address <- map["address"]
        type <- map["type"]
        country <- map["country"]
        state <- map["state"]
        city <- map["city"]
        zip <- map["zip"]
        landmark <- map["landmark"]
        additionalNumber <- map["alternativ_phone"]
        lat <- map["lat"]
        lang <- map["lang"]
    }
    
}
class EditAddressRequest: Mappable {
    public var api_token: String?
    public var address_id: Int?
    public var first_name: String?
    public var email: String?
    public var phone: String?
    public var address: String?
    public var type: String?
    public var country: String?
    public var state: String?
    public var city: String?
    public var zip: String?
    public var landmark: String?
    public var additionalNumber: String?
    public var lat: Double?
    public var lang: Double?
    
    init(api_token: String?,address_id: Int?,first_name: String?,email: String?,phone: String?,address: String?,type: String?,country: String?,state: String?,city: String?,zip: String?,landmark: String?, additionalNumber: String?,lat: Double, lang: Double) {
        self.api_token = api_token
        self.address_id = address_id
        self.first_name = first_name
        self.email = email
        self.phone = phone
        self.address = address
        self.type = type
        self.country = country
        self.state = state
        self.city = city
        self.zip = zip
        self.landmark = landmark
        self.additionalNumber = additionalNumber
        self.lat = lat
        self.lang = lang
    }
    
    required init?(map: Map) {
        
    }
    
    
    func mapping(map: Map) {
        api_token <- map["api_token"]
        address_id <- map["address_id"]
        first_name <- map["first_name"]
        email <- map["email"]
        phone <- map["phone"]
        address <- map["address"]
        type <- map["type"]
        country <- map["country"]
        state <- map["state"]
        city <- map["city"]
        zip <- map["zip"]
        landmark <- map["landmark"]
        additionalNumber <- map["alternativ_phone"]
        lat <- map["lat"]
        lang <- map["lang"]
    }
}
class DeleteAddressRequest: Mappable {
    public var api_token: String?
    public var address_id: Int?
    
    init(api_token: String?,address_id: Int?) {
        self.api_token = api_token
        self.address_id = address_id
        
    }
    
    required init?(map: Map) {
        
    }
    
    
    func mapping(map: Map) {
        api_token <- map["api_token"]
        address_id <- map["address_id"]
    }
}
class ProductListRequest: Mappable {
    public var categorie_id: Int?
    public var limit: Int?
    
    init(categorie_id: Int?,limit: Int?) {
        self.categorie_id = categorie_id
        self.limit = limit
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        categorie_id <- map["categorie_id"]
        limit <- map["limit"]
    }
}
class MedicineRequest: Mappable {
    public var api_token: String?
    public var limit: Int?
    
    init(api_token: String?,limit: Int?) {
        self.api_token = api_token
        self.limit = limit
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        api_token <- map["api_token"]
        limit <- map["limit"]
    }
}
class UpdateProfileRequest: Mappable{
    public var api_token: String?
    public var name: String?
    public var phone: String?
    public var email: String?
    public var password: String?
    
    init(api_token: String?,name: String?,phone: String?,email: String?,password: String?) {
        self.api_token = api_token
        self.name = name
        self.phone = phone
        self.email = email
        self.password = password
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        api_token <- map["api_token"]
        name <- map["name"]
        phone <- map["phone"]
        email <- map["email"]
        password <- map["password"]
    }
}
class ContactUsRequest: Mappable{
    
    public var name: String?
    public var email: String?
    public var message: String?
    public var phone: String?
    
    init(name: String?,email: String?,message: String?,phone: String?) {
        self.name = name
        self.email = email
        self.message = message
        self.phone = phone
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        email <- map["email"]
        message <- map["message"]
        phone <- map["phone"]
    }
}
class PageRequest: Mappable{
    
    public var name: String?
    
    
    init(name: String?) {
        self.name = name
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        name <- map["name"]
    }
}
class ProductDetailsRequest: Mappable{
    
    public var product_id: Int?
    
    
    init(product_id: Int?) {
        self.product_id =  product_id
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        product_id <- map["product_id"]
    }
}
class SaltRequest: Mappable{
    
    public var salt_id: Int?
    
    
    init(salt_id: Int?) {
        self.salt_id = salt_id
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        salt_id <- map["salt_id"]
    }
}

class SubstituteRequest: Mappable{
    
    public var product_id: Int?
    public var limit: Int?
    
    
    init(product_id: Int?,limit: Int?) {
        self.product_id = product_id
        self.limit = limit
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        self.product_id <- map["product_id"]
        self.limit <- map["limit"]
    }
}
class AutoSuggestionRequest: Mappable{
    public var keyword: String?
    
    init(keyword: String?) {
        self.keyword = keyword
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        keyword <- map["keyword"]
    }
}
class AutoSuggestionMoreRequest: Mappable{
    public var keyword: String?
    public var limit: Int?
    
    init(keyword: String?,limit: Int?) {
        self.keyword = keyword
        self.limit = limit
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        keyword <- map["keyword"]
        limit <- map["limit"]
    }
}
class OrderDataRequest: Mappable{
    public var api_token: String?
    public var order_id: Int?
    
    init(api_token: String?,order_id: Int?) {
        self.api_token = api_token
        self.order_id = order_id
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        api_token <- map["api_token"]
        order_id <- map["order_id"]
    }
}
class SectionProductRequst: Mappable{
    public var section_name: String?
    public var limit: Int?
    
    init(section_name: String?,limit: Int?) {
        self.section_name = section_name
        self.limit = limit
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        section_name <- map["section_name"]
        limit <- map["limit"]
    }
}

class CouponRequest: Mappable {
    public var api_token: String?
    public var code: String?
    
    init(api_token: String?,code: String?) {
        self.api_token = api_token
        self.code = code
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        api_token <- map["api_token"]
        code <- map["code"]
    }
}
class PlaceOrderRequest: Mappable{
    public var api_token : String?
    public var order: String?
    public var device_type: String?
    public var app_version: String?
    
    init(api_token: String?,order: String?, app_version: String?, device_type: String?) {
        self.api_token = api_token
        self.order = order
        self.app_version = appVersion
        self.device_type = device_type
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        api_token <- map["api_token"]
        order <- map["order"]
        app_version <- map["app_version"]
        device_type <- map["device_type"]
    }
}

class PlaceOrderDataRequest: Mappable {
    public var address: PlaceOrderAddress?
    public var coupon_code: String?
    public var description: String?
    public var discount: String?
    public var discount_type: String?
    public var discount_value: String?
    public var grand_total: String?
    public var order_date: String?
    public var order_item: [PlaceOrderItem]?
    public var payment_type: String?
    public var price_discount: String?
    public var self_pickup: String?
    public var shipping_price: String?
    public var sub_total: String?
    
    init(address: PlaceOrderAddress?,coupon_code: String?,description: String?,discount: String?,discount_type: String?,discount_value: String?,grand_total: String?,order_date: String?,order_item: [PlaceOrderItem]?,payment_type: String?,price_discount: String?,self_pickup: String?,shipping_price: String?,sub_total: String?) {
        self.address = address
        self.coupon_code = coupon_code
        self.description = description
        self.discount = discount
        self.discount_type = discount_type
        self.discount_value = discount_value
        self.grand_total = grand_total
        self.order_date = order_date
        self.order_item = order_item
        self.payment_type = payment_type
        self.price_discount = price_discount
        self.self_pickup = self_pickup
        self.shipping_price = shipping_price
        self.sub_total = sub_total
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        address <- map["address"]
        coupon_code <- map["coupon_code"]
        description <- map["description"]
        discount <- map["discount"]
        discount_type <- map["discount_type"]
        discount_value <- map["discount_value"]
        grand_total <- map["grand_total"]
        order_date <- map["order_date"]
        order_item <- map["order_item"]
        payment_type <- map["payment_type"]
        price_discount <- map["price_discount"]
        self_pickup <- map["self_pickup"]
        shipping_price <- map["shipping_price"]
        sub_total <- map["sub_total"]
    }
}

class PlaceOrderAddress: Mappable{
    public var address: String?
    public var city: String?
    public var country: String?
    public var email: String?
    public var first_name: String?
    public var last_name: String?
    public var phone: String?
    public var pin: String?
    public var state: String?
    public var lat: Double?
    public var lang: Double?
    
    init(address: String?,city: String?,country: String?,email: String?,first_name: String?,last_name: String?,phone: String?,pin: String?,state: String?,lat: Double?,lang: Double?) {
        self.address = address
        self.city = city
        self.country = country
        self.email = email
        self.first_name = first_name
        self.last_name = last_name
        self.phone = phone
        self.pin = pin
        self.state = state
        self.lat = lat
        self.lang = lang
    }
    
    required init?(map: Map) {
        
    }
    
    
    func mapping(map: Map) {
        address <- map["address"]
        city <- map["city"]
        country <- map["country"]
        email <- map["email"]
        first_name <- map["first_name"]
        last_name <- map["last_name"]
        phone <- map["phone"]
        pin <- map["pin"]
        state <- map["state"]
        lat <- map["lat"]
        lang <- map["lang"]
    }
}

class PlaceOrderItem: Mappable{
    public var add_pro_option: String?
    public var id: String?
    public var prescription_required: String?
    public var pro_discount_price: String?
    public var pro_discount_value: String?
    public var pro_mrp_price: String?
    public var pro_name: String?
    public var pro_price: String?
    public var pro_qty: String?
    public var pro_sku: String?
    public var total_amount: String?
    
    init(add_pro_option: String?,id: String?,prescription_required: String?,pro_discount_price: String?,pro_discount_value: String?,pro_mrp_price: String?,pro_name: String?,pro_price: String?,pro_qty: String?,pro_sku: String?,total_amount: String?) {
        self.add_pro_option = add_pro_option
        self.id = id
        self.prescription_required = prescription_required
        self.pro_discount_price = pro_discount_price
        self.pro_discount_value = pro_discount_value
        self.pro_mrp_price = pro_mrp_price
        self.pro_name = pro_name
        self.pro_price = pro_price
        self.pro_qty = pro_qty
        self.pro_sku = pro_sku
        self.total_amount = total_amount
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        add_pro_option <- map["add_pro_option"]
        id <- map["id"]
        prescription_required <- map["prescription_required"]
        pro_discount_price <- map["pro_discount_price"]
        pro_discount_value <- map["pro_discount_value"]
        pro_mrp_price <- map["pro_mrp_price"]
        pro_name <- map["pro_name"]
        pro_price <- map["pro_price"]
        pro_qty <- map["pro_qty"]
        pro_sku <- map["pro_sku"]
        total_amount <- map["total_amount"]
    }
}

class CancelOrderRequest: Mappable {
    public var api_token : String?
    public var order_id: Int?
    public var reason: String?
    
    init(api_token: String?,order_id: Int?,reason: String?) {
        self.api_token = api_token
        self.order_id = order_id
        self.reason = reason
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        api_token <- map["api_token"]
        order_id <- map["order_id"]
        reason <- map["reason"]
    }
}
class PrescriptionRequest: Mappable {
    public var api_token : String?
    public var order_id: Int?
    public var description: String?
    public var device_type: String?
    public var app_version: String?
    
    init(api_token: String?,description: String?,app_version: String?, device_type: String?) {
        self.api_token = api_token
        self.description = description
        self.app_version = app_version
        self.device_type = device_type
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        api_token <- map["api_token"]
        description <- map["description"]
        app_version <- map["pp_version "]
        device_type <- map["device_type"]
    }
}
class PlaceRequest: Mappable{
    public var api_token : String?
    public var order_id: Int?
    public var address: String?
    public var order_date: String?
    
    init(api_token: String?,order_id: Int?,address: String?,order_date: String?) {
        self.api_token = api_token
        self.order_id = order_id
        self.address = address
        self.order_date = order_date
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        api_token <- map["api_token"]
        order_id <- map["order_id"]
        address <- map["address"]
        order_date <- map["order_date"]
    }
}
class PlaceOrderWithPrescription: Mappable{
    public var api_token : String?
    public var address: String?
    public var order_date: String?
    public var self_pickup: String?
    public var device_type: String?
    public var app_version: String?
    
    init(api_token: String?,address: String?,order_date: String?,self_pickup: String?,app_version:String?,device_type:String?) {
        self.api_token = api_token
        self.address = address
        self.order_date = order_date
        self.self_pickup = self_pickup
        self.app_version = app_version
        self.device_type = device_type
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        api_token <- map["api_token"]
        address <- map["address"]
        order_date <- map["order_date"]
        self_pickup <- map["self_pickup"]
        app_version <- map["app_version"]
        device_type <- map["device_type"]
    }
}

//MARK:- Cart Transaction
class AddProductRequest: Mappable{
    public var medicine_id: Int?
    public var price: CGFloat?
    public var prescription: Bool?
    public var qty: Int?
    public var discount_price: CGFloat?
    public var medicine_name: String?
    public var medicine_descriptions: String?
    public var product_discount_value: CGFloat?
    public var price_diff_value: CGFloat?
    
    init(medicine_id: Int?,price: CGFloat?,prescription:Bool?,qty: Int?,discount_price: CGFloat?,medicine_name: String?,medicine_descriptions: String?,product_discount_value: CGFloat?,price_diff_value: CGFloat?) {
        self.medicine_id = medicine_id
        self.price = price
        self.prescription = prescription
        self.qty = qty
        self.discount_price = discount_price
        self.medicine_name = medicine_name
        self.medicine_descriptions = medicine_descriptions
        self.product_discount_value = product_discount_value
        self.price_diff_value = price_diff_value
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        medicine_id <- map["medicine_id"]
        price <- map["price"]
        prescription <- map["prescription"]
        qty <- map["qty"]
        discount_price <- map["discount_price"]
        medicine_name <- map["medicine_name"]
        medicine_descriptions <- map["medicine_descriptions"]
        product_discount_value <- map["product_discount_value"]
        price_diff_value <- map["price_diff_value"]
    }
}
class DeviceRegisterRequest: Mappable {
    public var uniq_device_id: String?
    public var timezone: String?
    public var menufacture_company: String?
    public var version: String?
    public var type: String?
    public var user_appversion: String?
    public var firebase_token: String?
    public var onesignal_token: String?
    
    init(uniq_device_id: String?,timezone: String?,menufacture_company: String?,version: String?,type: String?,user_appversion: String?,firebase_token: String?,onesignal_token: String?) {
        self.uniq_device_id = uniq_device_id
        self.timezone = timezone
        self.menufacture_company = menufacture_company
        self.version = version
        self.type = type
        self.user_appversion = user_appversion
        self.firebase_token = firebase_token
        self.onesignal_token = onesignal_token
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        uniq_device_id <- map["uniq_device_id"]
        timezone <- map["timezone"]
        menufacture_company <- map["menufacture_company"]
        version <- map["version"]
        type <- map["type"]
        user_appversion <- map["user_appversion"]
        firebase_token <- map["firebase_token"]
        onesignal_token <- map["onesignal_token"]
    }
}
class UpdateNumberRequest: Mappable {
    public var api_token : String?
    public var phone: String?
    public var otp: String?
    
    init(api_token: String?,phone: String?,otp: String?) {
        self.api_token = api_token
        self.phone = phone
        self.otp = otp
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        api_token <- map["api_token"]
        phone <- map["phone"]
        otp <- map["otp"]
    }
}

class OrderHistoryList: Mappable {
    public var api_token : String?
    public var year : String?
    
    init(api_token: String?,year: String?) {
        self.api_token = api_token
        self.year = year
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        api_token <- map["api_token"]
        year <- map["year"]
    }
}

class PostSelectedLanguage: Mappable{
    public var language_id: Int?
    
    init(language_id: Int?) {
        self.language_id = language_id
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        language_id <- map["language_id"]
    }
}

class CaptureTransaction: Mappable {
    public var api_token: String?
    public var payment_type: Int?
    public var order_id: Int?
    public var is_wallet: Int?
    public var wallet_amount: Int?
    
    init(api_token:String?, payment_type:Int?, order_id:Int?, is_wallet:Int?, wallet_amount:Int?) {
        self.api_token = apiToken
        self.payment_type = payment_type
        self.order_id = order_id
        self.is_wallet = is_wallet
        self.wallet_amount = wallet_amount
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        api_token <- map["api_token"]
        payment_type <- map["payment_type"]
        order_id <- map["order_id"]
        is_wallet <- map["is_wallet"]
        wallet_amount <- map["wallet_amount"]
    }
}
