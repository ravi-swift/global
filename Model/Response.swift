//
//  Response.swift
//  VOnPharmaCare
//
//  Created by MAC on 02/06/1942 Saka.
//  Copyright © 1942 MAC. All rights reserved.
//

import Foundation
import ObjectMapper

class Response: Mappable{
    public var success: String?
    public var message: String?
    public var offset: Int?
    public var signupResponse: [SignUpResponse]?
    public var forgotPasswordResponse: [ForgotPasswordResponse]?
    public var homeResponse: HomeListReponse?
    public var categoryListResponse : [CategoriesData]?
    public var existingImageList: [ExistinPrescriptionList]?
    public var addressListResponse: [AddressResponse]?
    public var productListResponse: [ProductListReponse]?
    public var requestMedicineResponse: [RequestMedicineListReponse]?
    public var pendingOrderResponse: [PendingOrderResponse]?
    public var notificationResponse: [NotificationResponse]?
    public var pageResponse: PageResponse?
    public var productDetailResponse: ProductDetailResponse?
    public var saltResponse: SaltResponse?
    public var substituteResponse: [SubstituteResponse]?
    public var orderReponse: OrderResponse?
    public var couponResponse: [CouponResponse]?
    public var placeOrderResponse: PlaceOrderResponse?
    public var medicineDetailsResponse: [RequestMedicineDetails]?
    public var walletResponse: WalletResponse?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        success <- map["success"]
        message <- map["message"]
        offset <- map["offset"]
        signupResponse <- map["data"]
        forgotPasswordResponse <- map["data"]
        homeResponse <- map["data"]
        categoryListResponse <- map["data"]
        existingImageList <- map["data"]
        addressListResponse <- map["data"]
        productListResponse <- map["data"]
        requestMedicineResponse <- map["data"]
        pendingOrderResponse <- map["data"]
        notificationResponse <- map["data"]
        pageResponse <- map["data"]
        productDetailResponse <- map["data"]
        saltResponse <- map["data"]
        substituteResponse <- map["data"]
        orderReponse <- map["data"]
        couponResponse <- map["data"]
        placeOrderResponse <- map["data"]
        medicineDetailsResponse <- map["data"]
        walletResponse <- map["data"]
    }
}

