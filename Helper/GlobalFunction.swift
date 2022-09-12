//
//  GlobalFunction.swift
//  VOnPharmaCare
//
//  Created by MAC on 29/05/1942 Saka.
//  Copyright © 1942 MAC. All rights reserved.
//

import Foundation
import UIKit
import LGSideMenuController
import JNKeychain
import Alamofire
import AlamofireObjectMapper
import CoreLocation

func saveImageAndGetPath(image : UIImage) -> String{
    // get the documents directory url
    let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    // choose a name for your image
    let fileName = imageName()+".jpg"
    let fileURL = documentsDirectory.appendingPathComponent(fileName)
    if let data = image.jpegData(compressionQuality:  1.0),
        !FileManager.default.fileExists(atPath: fileURL.path) {
        do {
            // writes the image data to disk
            print("file saved")
            try data.write(to: fileURL)
            return fileName
        } catch {
            print("error saving file:", error)
        }
    }
    return ""
}

func getDirectoryPath() -> String {
    let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
    let documentsDirectory = paths[0]
    return documentsDirectory
}

func getImageFromDocumentDirectory(name: String) -> UIImage?{
    let fileManager = FileManager.default
    let imagePAth = (getDirectoryPath() as NSString).appendingPathComponent(name)
    if fileManager.fileExists(atPath: imagePAth){
        return UIImage(contentsOfFile: imagePAth)
    }
    return nil
}

func imageName() -> String{
    let date : Date = Date()
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyMMdd'_'HHmmss"
    return dateFormatter.string(from: date)
}

func saveUserData(value: Response){
    if let response = value.signupResponse?.first{
        UserDefaults.standard.set(response.toJSON(), forKey: "user_data")
    }
}

func getUserData() -> SignUpResponse?{
    if let data = UserDefaults.standard.value(forKey: "user_data") as? [String:Any]{
        return SignUpResponse(JSON: data)
    }
    return nil
}

func saveUserPassword(pwd: String){
    UserDefaults.standard.setValue(pwd, forKey: "user_password")
}

func getUserPassword() -> String{
   return UserDefaults.standard.value(forKey: "user_password") as! String
}

func removeAllUserDefaulsData(){
    UserDefaults.standard.removeObject(forKey: "user_data")
    UserDefaults.standard.removeObject(forKey: "user_password")
}

func setRootLoginVC(){
    let vc = storyBoard.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
    let rootController = UINavigationController(rootViewController: vc)
    rootController.interactivePopGestureRecognizer?.isEnabled = false
    appDelegate.window?.rootViewController = rootController
//    appDelegate.window?.makeKeyAndVisible()
}

func setHomeVC(){
    let vc = storyBoard.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
    let rootVC = UINavigationController(rootViewController: vc)
    rootVC.interactivePopGestureRecognizer?.isEnabled = false
    let sideMenuVC = storyBoard.instantiateViewController(withIdentifier: "SideBarVC") as! SideBarVC
    sideMenuVC.superVC = vc
    let sideMenuController =  LGSideMenuController.init(rootViewController: rootVC, leftViewController: sideMenuVC, rightViewController: nil)
    sideMenuController.leftViewWidth = screenWidth/1.2
    sideMenuController.leftViewPresentationStyle = .slideAbove
    sideMenuController.delegate = sideMenuVC
    appDelegate.window?.rootViewController = sideMenuController
//    appDelegate.window?.makeKeyAndVisible()
}

func heightForView(text:String, font:UIFont, width:CGFloat) -> CGFloat{
    let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
    label.numberOfLines = 0
    label.lineBreakMode = NSLineBreakMode.byWordWrapping
    label.font = font
    label.text = text

    label.sizeToFit()
    return label.frame.height
}

func widthForView(text:String, font:UIFont) -> CGFloat{
    let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude))
    label.numberOfLines = 0
    label.lineBreakMode = NSLineBreakMode.byWordWrapping
    label.font = font
    label.text = text

    label.sizeToFit()
    return label.frame.width
}


func strikeLabel(str: String) -> NSAttributedString{
    let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: str)
    attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
    return attributeString
}

func getStatusColor(status: String) -> UIColor{
    switch status {
    case "New":
        return border_blue_color
    case "Confirm":
        return confirm
    case "Canceled":
        return canceled
    case "Returned Done":
        return returned_done
    case "Delivered":
        return delivered
    case "Failed":
        return failed
    case "Returned":
        return returned_done
    case "Done":
        return done
    case "Forward":
        return forward
    case "Reject":
        return reject
    default:
        return delivered
    }
}
func isLoginUser() -> Bool{
    if getUserData() != nil{
        return true
    }
    return false
}
func displayLoginVC(viewController: UIViewController){
    let vc = storyBoard.instantiateViewController(withIdentifier: "LoginPopUpVC") as! LoginPopUpVC
    vc.modalPresentationStyle = .overCurrentContext
    vc.superVC = viewController
    viewController.present(vc, animated: true, completion: nil)
}

func presentLoginVC(viewController: UIViewController){
    let vc = storyBoard.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
    vc.fromLoginPopUp = true
    let rootController = UINavigationController(rootViewController: vc)
    rootController.modalPresentationStyle = .fullScreen
    rootController.interactivePopGestureRecognizer?.isEnabled = false
    viewController.present(rootController, animated: true, completion: nil)
}
func openDialPad(phone: Int){
    if let url = URL(string: "tel://\(phone)"), UIApplication.shared.canOpenURL(url) {
        if #available(iOS 10, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
}
func openUrl(str: String){
    guard let url = URL(string: str) else {
      return //be safe
    }

    if #available(iOS 10.0, *) {
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    } else {
        UIApplication.shared.openURL(url)
    }
}


//MARK:- UUID
class KeychainManager: NSObject {
    static let sharedInstance = KeychainManager()
    
    func getDeviceIdentifierFromKeychain() -> String {
        // try to get value from keychain
        var deviceUDID  = self.keychain_valueForKey("keychainDeviceUDID") as? String
        if deviceUDID == nil {
            deviceUDID = UIDevice.current.identifierForVendor!.uuidString
            // save new value in keychain
            self.keychain_setObject(deviceUDID as AnyObject, forKey: "keychainDeviceUDID")
        }
        return deviceUDID!
    }
    
    // MARK: - Keychain
    
    func keychain_setObject(_ object: AnyObject, forKey: String) {
        let result = JNKeychain.saveValue(object, forKey: forKey)
        if !result {
            print("keychain saving: smth went wrong")
        }
    }
    
    func keychain_deleteObjectForKey(_ key: String) -> Bool {
        let result = JNKeychain.deleteValue(forKey: key)
        return result
    }
    
    func keychain_valueForKey(_ key: String) -> AnyObject? {
        let value = JNKeychain.loadValue(forKey: key)
        return value as AnyObject?
    }
}
//MARK:- Register Device
func deviceRegistration(){
    let data = DeviceRegisterRequest(uniq_device_id: KeychainManager.sharedInstance.getDeviceIdentifierFromKeychain(), timezone: TimeZone.current.identifier, menufacture_company: UIDevice.current.name, version: UIDevice.current.systemVersion, type: "iOS", user_appversion: appVersion, firebase_token: firebase_token, onesignal_token: onesignal_token)
    Alamofire.request(device_registration_url, method: .post, parameters: data.toJSON(), encoding: URLEncoding.default, headers: headers).responseObject {  (response: DataResponse<Response>) in
        switch response.result{
        case .success(let value):
            if value.success == "1"{
                print(value.message ?? "")
                isRegisterDevice = true
            }else{
                showToast(message: value.message ?? "")
            }
            break
        case .failure(let error):
            showToast(message: error.localizedDescription)
            break
        }
    }
}

//MARK:- CheckAppVersion
func checkAppversion(){
    Alamofire.request(app_version, method: .get, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
        switch response.result {
        case .success(let val):
            let dict = val as! NSDictionary
            let appversion = dict.value(forKey: "ios_version") as? String
            let appMessage = dict.value(forKey: "ios_message") as? String

            let versionCompare = appVersion.compare(appversion!, options: .numeric)
            if versionCompare == .orderedSame {
                print("same version")
            } else if versionCompare == .orderedAscending {
                // will execute the code here
                print("ask user to update")
                let alertControl = UIAlertController(title: strAppVersion, message: appMessage, preferredStyle: .alert)
                let OkAction = UIAlertAction(title: "Update", style: .default) { (action) in
                    let url = "https://apps.apple.com/us/app/v-on-pharma-care-health-care/id1550764464"
                    UIApplication.shared.open(URL(string: url)!, options: [:], completionHandler: nil)
                }
                let cancelAction = UIAlertAction(title: "Later", style: .cancel, handler: nil)
                alertControl.addAction(OkAction)
                alertControl.addAction(cancelAction)
                keyWindow?.rootViewController?.present(alertControl, animated: true, completion: nil)
            } else if versionCompare == .orderedDescending {
                // execute if current > appStore
                print("don't expect happen...")
            }
            
//            print("UserAppVersion :-----> \(userAppVersion) \n APIappVersion :-----------> \(apiAppVersion)")
//             if userAppVersion < apiAppVersion {
//                let alertControl = UIAlertController(title: strAppVersion, message: appMessage, preferredStyle: .alert)
//                let OkAction = UIAlertAction(title: "Update", style: .default) { (action) in
//                    let url = "https://apps.apple.com/us/app/v-on-pharma-care-health-care/id1550764464"
//                    UIApplication.shared.open(URL(string: url)!, options: [:], completionHandler: nil)
//                }
//                let cancelAction = UIAlertAction(title: "Later", style: .cancel, handler: nil)
//                alertControl.addAction(OkAction)
//                alertControl.addAction(cancelAction)
//                keyWindow?.rootViewController?.present(alertControl, animated: true, completion: nil)
//             }
            
        break
        
        case .failure(let error):
        showToast(message: error.localizedDescription)
        break
        }
    }
}

//MARK:- SelectAppLanguage
func getLamguage(complation: @escaping(_ result: NSArray) -> Void){
    Alamofire.request(get_languages, method: .get, encoding: URLEncoding.default, headers: headers).responseJSON {  (response) in
        switch response.result{
        case .success(let json):
            let dict = json as! NSDictionary
            let success = dict.value(forKey: "success") as? String
            let message = dict.value(forKey: "message") as? String
            if success == "1" {
                let data = dict.value(forKey: "data") as! NSArray
                complation(data)
            }else{
                showToast(message: message ?? "")
            }
//            break
        case .failure(let error):
            showToast(message: error.localizedDescription)
            break
        }
    }
}

//MARK:- PostSelectedAppLanguage
func getLanguageWords(languageId: Int, complation: @escaping(_ result: NSArray) -> Void){
    
    let data = PostSelectedLanguage(language_id: languageId)
    Alamofire.request(get_language_words, method: .post, parameters: data.toJSON(), encoding: URLEncoding.default, headers: headers).responseJSON {  (response) in
        switch response.result{
        case .success(let json):
            let dict = json as! NSDictionary
            let success = dict.value(forKey: "success") as? String
            let message = dict.value(forKey: "message") as? String
            if success == "1" {
                let data = dict.value(forKey: "data") as! NSArray
                complation(data)
            }else{
                showToast(message: message ?? "")
            }
            break
        case .failure(let error):
            showToast(message: error.localizedDescription)
            break
        }
    }}


//MARK:- Compress Image Size
func compressImage(image:UIImage) -> Data? {
    var actualHeight : CGFloat = image.size.height
    var actualWidth : CGFloat = image.size.width
    let maxHeight : CGFloat = 1136.0
    let maxWidth : CGFloat = 640.0
    var imgRatio : CGFloat = actualWidth/actualHeight
    let maxRatio : CGFloat = maxWidth/maxHeight
    var compressionQuality : CGFloat = 0.5

    if (actualHeight > maxHeight || actualWidth > maxWidth){
        if(imgRatio < maxRatio){
            //adjust width according to maxHeight
            imgRatio = maxHeight / actualHeight
            actualWidth = imgRatio * actualWidth
            actualHeight = maxHeight
        }
        else if(imgRatio > maxRatio){
            //adjust height according to maxWidth
            imgRatio = maxWidth / actualWidth
            actualHeight = imgRatio * actualHeight
            actualWidth = maxWidth
        }
        else{
            actualHeight = maxHeight
            actualWidth = maxWidth
            compressionQuality = 1
        }
    }

    let rect = CGRect(x: 0.0, y: 0.0, width: actualWidth, height: actualHeight)
    UIGraphicsBeginImageContext(rect.size)
    image.draw(in: rect)
    guard let img = UIGraphicsGetImageFromCurrentImageContext() else {
        return nil
    }
    UIGraphicsEndImageContext()
    guard let imageData = img.jpegData(compressionQuality: compressionQuality)else{
        return nil
    }
    return imageData
}

// LocationPermission

func getUserLocation(locationManager: CLLocationManager!){
    locationManager.requestAlwaysAuthorization()
    locationManager.requestWhenInUseAuthorization()
    if CLLocationManager.locationServicesEnabled() {
        locationManager.delegate = appDelegate.self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.startUpdatingLocation()
    }
}

func checkLocationPermissin(){
    if CLLocationManager.locationServicesEnabled() {
        switch CLLocationManager.authorizationStatus() {
            case .notDetermined, .restricted, .denied:
                print("No access")
                alertToEnableLocation()
            case .authorizedAlways, .authorizedWhenInUse:
                print("Access")
                let locationManager = CLLocationManager()
                getUserLocation(locationManager: locationManager)
            @unknown default:
            break
        }
        } else {
            print("Location services are not enabled")
    }
}

func alertToEnableLocation()
    {
//Location is Dissable - Alert
        let locationAlertController = UIAlertController (title: strLocationDisable, message: strPleaseEnableyourlocationService, preferredStyle: .alert)

        let settingsAction = UIAlertAction(title: strSetting, style: .default) { (action) in
            let settingsUrl = NSURL(string:UIApplication.openSettingsURLString)
            if let url = settingsUrl {
                UIApplication.shared.openURL(url as URL)
            }
            let locationManager = CLLocationManager()
            getUserLocation(locationManager: locationManager)
        }
        let cancelAction = UIAlertAction(title: strOk, style: .default) { (action) in
            
        }
        locationAlertController .addAction(settingsAction)
        locationAlertController .addAction(cancelAction)
        DispatchQueue.main.async {
            keyWindow?.rootViewController?.present(locationAlertController, animated: true, completion: nil)
        }
    }

