//
//  Constant.swift
//  VOnPharmaCare
//
//  Created by MAC on 19/08/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation
import UIKit
import Toast
import Alamofire
import CoreData

let storyBoard = UIStoryboard(name: "Main", bundle: nil)

enum PickerType{
    case gallery
    case camera
    case existing
}
enum ConfirmAction{
    case yes
    case cancel
}

let appDelegate = UIApplication.shared.delegate as! AppDelegate

var screenWidth : CGFloat{
    return UIScreen.main.bounds.width
}

var screenHeight : CGFloat{
    return UIScreen.main.bounds.height
}

var topSafeArea: CGFloat{
    if #available(iOS 11.0, *) {
        return UIApplication.shared.windows[0].safeAreaInsets.top
    }
    return 0
}
var bottomSafeArea: CGFloat{
    if #available(iOS 11.0, *) {
        return UIApplication.shared.windows[0].safeAreaInsets.bottom
    }
    return 0
}

let loaderSize = CGSize(width: 45, height: 45)

//let appVersion = Bundle.main.infoDictionary?["CFBundleVersion"] as? String
let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String

//Navigation
let naviatioTitleAttribute : [NSAttributedString.Key : Any] = [NSAttributedString.Key.foregroundColor: UIColor.white]

func showToast(message: String){
    let windows = UIApplication.shared.windows
    windows.last?.makeToast(message)
}

var firebase_token: String?
var onesignal_token: String?
let device_type = "1"

let AUTHSTR = "admin:admin"
let credentialData = "\(AUTHSTR)".data(using: String.Encoding.utf8)!
let base64Credentials = credentialData.base64EncodedString() //base64EncodedStringWithOptions([])
let headers : HTTPHeaders =  ["Authorization": "Basic \(base64Credentials)"]

//Message
let userNotFound = "User not found"
let noListFound = "List not found"
let internetMsg = "No Interner Connection"

let lastPage = 3

//Color
let primary_color : UIColor = UIColor(hexString: "2397d0")
let dark_green_color: UIColor = UIColor(hexString: "01ae57")
let price_border_color : UIColor = UIColor(hexString: "a3e0f0")

//API URL
let server_url = ""

let register_url = server_url+"user_register_v1"


var apiToken: String{
    if let token = getUserData()?.api_token{
        return token
    }
    return ""
}

class Connectivity {
    class var isConnectedToInternet:Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}

//Charge
//let delieverCharge : CGFloat = 40.0
var delieverCharge = CGFloat()
var delieverChargeLimit = String()
var deliverdChargeText = String()
var referalSenderAmount = Int()
var referalReceiverAmount = Int()

//Self Pickup Address
let selfPickUpAddress = "shop no. 1 shankheshwar complex,\n opp. Parvat Patiya Flyover,\n Surat, Gujarat 395002"
let willSendMessage = "We will send an update once your prescription is verified by our medical team."

//Key
let one_signal_app_id = "a4423599-f442-44d7-b866-c88153aa7906"
let one_signal_rest_api_key = "NzM4NDQxNTUtZmUzNS00Mjg4LTk0OGUtYWM2YzExOTk1YTU2"

var isRegisterDevice: Bool = false

//Map Key
let mapProvideAPIkey = "AIzaSyDpgl0fZebOtfQmHWPdFXQmLQvkZBrqfKM"

// Get Location
var lat: Double = 21.170240
var lang: Double = 72.831062


var keyWindow: UIWindow? {
    return UIApplication.shared.connectedScenes.filter({$0.activationState == .foregroundActive}).map({$0 as? UIWindowScene}).compactMap({$0}).first?.windows.filter({$0.isKeyWindow}).first
}
