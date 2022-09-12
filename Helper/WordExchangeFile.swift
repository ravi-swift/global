//
//  WordExchangeFile.swift
//  VOnPharmaCare
//
//  Created by MAC on 26/12/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation
import UIKit

func setAllWords(){
    if let wordDetailsARRAY = UserDefaults.standard.value(forKey: "wordDataDict") {
        let wordARRAY = wordDetailsARRAY as! NSArray
        let wordDict = NSMutableDictionary()
        for word in wordARRAY {
            let dict = word as! NSDictionary
            let title = dict.value(forKey: "title") as! String
            let value = dict.value(forKey: "value") as! String
            wordDict.setValue(value, forKey: title)
        }
       
        print(wordDict)
        // MARK:- SideMenu Screen Data
        if let vOnPharmaCare = wordDict.value(forKey: "VONPharmaCare") {
            strVONPharmaCare = vOnPharmaCare as? String ?? strVONPharmaCare
        }
        if let home = wordDict.value(forKey: "Home") {
            strHome = home as? String ?? strHome
        }
        if let requestForMedicine = wordDict.value(forKey: "Request For Medicine") {
            strRequestForMedicine = requestForMedicine as? String ?? strRequestForMedicine
        }
        if let myOrder = wordDict.value(forKey: "My Order") {
            strMyOrder = myOrder as? String ?? strMyOrder
        }
        if let notifications = wordDict.value(forKey: "Notifications"){
            strNotifications = notifications as? String ?? strNotifications
        }
        if let accountManage = wordDict.value(forKey: "Account Manage"){
            strAccountManage = accountManage as? String ?? strAccountManage
        }
        if let profile = wordDict.value(forKey: "Profile"){
            strProfile = profile as? String ?? strProfile
        }
        if let manageAddress = wordDict.value(forKey: "Manage Address") {
            strManageAddress = manageAddress as? String ?? strManageAddress
        }
        if let changeLanguage = wordDict.value(forKey: "Change Language") {
            strChangeLanguage = changeLanguage as? String ?? strChangeLanguage
        }
        if let communicate = wordDict.value(forKey: "Communicate") {
            strCommunicate = communicate as? String ?? strCommunicate
        }
        if let contactUs = wordDict.value(forKey: "Contact Us") {
            strContactUs = contactUs as? String ?? strContactUs
        }
        if let shareApp = wordDict.value(forKey: "Share app") {
            strShareApp = shareApp as? String ?? strShareApp
        }
        if let rateApp = wordDict.value(forKey: "Rate app") {
            strRateApp = rateApp as? String ?? strRateApp
        }
        if let legal = wordDict.value(forKey: "Legal"){
            strLegal = legal as? String ?? strLegal
        }
        if let version = wordDict.value(forKey: "Version"){
            strVersion = version as? String ?? strVersion
        }
        if let logOut = wordDict.value(forKey: "Log Out"){
            strLogOut = logOut as? String ?? strLogOut
        }
        if let termsAndCondition = wordDict.value(forKey: "Terms and Conditions") {
            strTermsAndConditions = termsAndCondition as? String ?? strTermsAndConditions
        }
        if let privacyPolicy = wordDict.value(forKey: "Privacy Policy"){
            strPrivacyPolicy = privacyPolicy as? String ?? strPrivacyPolicy
        }
        if let login = wordDict.value(forKey: "Login") {
            strLogin = login as? String ?? strLogin
        }
        
        //MARK:- HomeVC Data
        if let uploadPrescription = wordDict.value(forKey: "Upload Prescription"){
            strUploadPrescription = uploadPrescription as? String ?? strUploadPrescription
        }
        if let uploadPresDetail = wordDict.value(forKey: "Upload prescription and get your medicine,This is a fastest way to get your medicine."){
            strUploadPre = uploadPresDetail as? String ?? strUploadPre
        }
        if let shopBycategory = wordDict.value(forKey: "Shop By Category"){
            strShopByCategory = shopBycategory as? String ?? strShopByCategory
        }
        
        //MARK:- HomeVC -> Product Cart
        if let productCart = wordDict.value(forKey: "Product Cart"){
            strProductCart = productCart as? String ?? strProductCart
        }
        if let quicklyBuyProduct = wordDict.value(forKey: "Quickly Buy Products"){
            strQuickBuy = quicklyBuyProduct as? String ?? strQuickBuy
        }
        if let couponCode = wordDict.value(forKey: "Coupon Code"){
            strCouponCode = couponCode as? String ?? strCouponCode
        }
        if let apply = wordDict.value(forKey: "Apply"){
            strApply = apply as? String ?? strApply
        }
        if let mrpTotal = wordDict.value(forKey: "M.R.P Total"){
            strMRPtotal = mrpTotal as? String ?? strMRPtotal
        }
        if let priceDiscount = wordDict.value(forKey: "Price Discount"){
            strPriceDiscount = priceDiscount as? String ?? strPriceDiscount
        }
        if let couponDiscount = wordDict.value(forKey: "Coupon Discount"){
            strCouponDiscount = couponDiscount as? String ?? strCouponDiscount
        }
        if let total = wordDict.value(forKey: "Total"){
            strTotal = total as? String ?? strTotal
        }
        if let totalPayble = wordDict.value(forKey: "Total Payable :"){
            strTotalPayble = totalPayble as? String ?? strTotalPayble
        }
        if let checkOut = wordDict.value(forKey: "Checkout"){
            strCheckout = checkOut as? String ?? strCheckout
        }
        if let cartEmpty = wordDict.value(forKey: "Your cart is empty"){
            strYourCartIsEmpty = cartEmpty as? String ?? strYourCartIsEmpty
        }
        if let addMedicineToCart = wordDict.value(forKey: "ADD MEDICINES TO CART"){
            strADDMEDICINESTOCART = addMedicineToCart as? String ?? strADDMEDICINESTOCART
        }
        if let looksLike = wordDict.value(forKey: "Looks like you have not added any Medicines to your cart yet"){
            strLookslike = looksLike as? String ?? strLookslike
        }
        if let yourCart = wordDict.value(forKey: strYourCart){
            strYourCart = yourCart as? String ?? strYourCart
        }
        
        //MARK:- HomeVC -> Product Cart -> OrderDetailVC
        if let orderDetails = wordDict.value(forKey: "Order Detail"){
            strOrderDetail = orderDetails as? String ?? strOrderDetail
        }
        if let userDetail = wordDict.value(forKey: "User Detail"){
            strUserDetail = userDetail as? String ?? strUserDetail
        }
        if let selectHomeAdd = wordDict.value(forKey: "Select Address For Home Delivery"){
            strSelectHomeAdd = selectHomeAdd as? String ?? strSelectHomeAdd
        }
        if let selfPickup = wordDict.value(forKey: "Check and select self pickup store location to avoid delivery charges"){
            strSelfPickUp = selfPickup as? String ?? strSelfPickUp
        }
        if let orderReady = wordDict.value(forKey: "Your order will be ready when you reach on store"){
            strOrderReady = orderReady as? String ?? strOrderReady
        }
        if let productDetail = wordDict.value(forKey: "Product Detail"){
            strProductDetail = productDetail as? String ?? strProductDetail
        }
        if let teampUpdate = wordDict.value(forKey: "Sometimes product MRP/discount can be varied based on stock availability. Our team will update you before the order confirmation"){
            strTeamupdate = teampUpdate as? String ?? strTeamupdate
        }
        if let shippingCharge = wordDict.value(forKey: "Shipping Charge"){
            strShippingCharge = shippingCharge as? String ?? strShippingCharge
        }
        if let confirm = wordDict.value(forKey: "Confirm"){
            strConfirm = confirm as? String ?? strConfirm
        }
        if let selectAddress = wordDict.value(forKey: "Select Address"){
            strSelectAddress = selectAddress as? String ?? strSelectAddress
        }
        
        //MARK:- HomeVC -> Product Cart -> OrderDetailVC -> SuccessOrderVC
        if let orderSuccess = wordDict.value(forKey: "Order Place Successfully"){
            strOrderPlaceSuccessfully = orderSuccess as? String ?? strOrderPlaceSuccessfully
        }
        if let orderNumber = wordDict.value(forKey: "Your Order Number:"){
            strYourOrderNumber = orderNumber as? String ?? strYourOrderNumber
        }
        if let myOrder = wordDict.value(forKey: "My Order"){
            strMyOrder = myOrder as? String ?? strMyOrder
        }
        if let home = wordDict.value(forKey: "Home"){
            strHome = home as? String ?? strHome
        }
        
        // MARK:- Home -> Upload Prescription Screen
        if let uploaded0_4Prescription = wordDict.value(forKey: "Uploaded 0/4 Prescription(s)"){
            strUploaded0_4Prescription = uploaded0_4Prescription as? String ?? strUploaded0_4Prescription
        }
        if let pleaseUploadedBackSide = wordDict.value(forKey: "Please upload the back side of prescription,if present") {
            strPleaseUploadTheBackSideOfPrescriptionIfPresent = pleaseUploadedBackSide as? String ?? strPleaseUploadTheBackSideOfPrescriptionIfPresent
        }
        if let selectPrescription = wordDict.value(forKey: "Select Prescription") {
            strSelectPrescription = selectPrescription as? String ?? strSelectPrescription
        }
        if let selectDeliveryDate = wordDict.value(forKey: "Select Delivery Date") {
            strSelectDeliveryDate = selectDeliveryDate as? String ?? strSelectDeliveryDate
        }
        if let enterPreDes = wordDict.value(forKey: "Enter Prescription Description"){
            strEnterPrescriptionDescription = enterPreDes as? String ?? strEnterPrescriptionDescription
        }
        if let continueBtn = wordDict.value(forKey: "Continue"){
            strContinue = continueBtn as? String ?? strContinue
        }
        if let validPreGuide = wordDict.value(forKey: "Valid Prescription Guide"){
            strValidPrescriptionGuide = validPreGuide as? String ?? strValidPrescriptionGuide
        }
        if let validPreGuide2 = wordDict.value(forKey: "Image should be sharp and contain below mention 4 points with valid details."){
            strValidPrescriptionGuide2 = validPreGuide2 as? String ?? strValidPrescriptionGuide2
        }
        if let uploaded = wordDict.value(forKey: "Uploaded"){
            strUploaded = uploaded as? String ?? strUploaded
        }
        if let countUploaded = wordDict.value(forKey: "/4 Prescription(s)"){
            strTotal_num_of_pres = countUploaded as? String ?? strTotal_num_of_pres
        }
        if let selectOnlyFourImg = wordDict.value(forKey: "You may only select 4 Images"){
            strYouMayOnlySelect4Images = selectOnlyFourImg as? String ?? strYouMayOnlySelect4Images
        }
        if let pleaseEnterDes = wordDict.value(forKey: "Please enter description"){
            strPleaseEnterDescription = pleaseEnterDes as? String ?? strPleaseEnterDescription
        }
        if let pleaseUploadPrescription = wordDict.value(forKey: "Please upload a prescription"){
            strPleaseUploadPrescription = pleaseUploadPrescription as? String ?? strPleaseUploadPrescription
        }
        
        //MARK:- HomeVC -> UploadPrescriptionVC -> SelectPrescriptionVC
        if let takePictureWithCamera = wordDict.value(forKey: "Tack a picture with your camera"){
            strTackPictureWithCamera = takePictureWithCamera as? String ?? strTackPictureWithCamera
        }
        if let chooseGalaryImg = wordDict.value(forKey: "Choose an image from gallery"){
            strChooseImageGallery = chooseGalaryImg as? String ?? strChooseImageGallery
        }
        if let chooseExistingUploaded = wordDict.value(forKey: "Choose an existence upload"){
            strChooseExistenceUpload = chooseExistingUploaded as? String ?? strChooseExistenceUpload
        }
        if let camera = wordDict.value(forKey: "Camera"){
            strCamera = camera as? String ?? strCamera
        }
        if let gallery = wordDict.value(forKey: "Gallery"){
            strGallery = gallery as? String ?? strGallery
        }
        if let existing = wordDict.value(forKey: "Existing"){
            strExisting = existing as? String ?? strExisting
        }
        //MARK:- HomeVC -> ProductDetailsVC
        if let addToCart = wordDict.value(forKey: "Add To Cart"){
            strAddToCart = addToCart as? String ?? strAddToCart
        }
        if let addedToCart = wordDict.value(forKey: "added to cart"){
            strAddedToCart = addedToCart as? String ?? strAddedToCart
        }
        //MARK:- SideBarVC -> Request Medicine
        if let requestMedicine = wordDict.value(forKey: "Request Medicine"){
            strRequestMedicine = requestMedicine as? String ?? strRequestMedicine
        }
        //MARK:- SideBarVC -> Request Medicine -> Details
        if let sendRequest = wordDict.value(forKey: "Send Request") {
            strSendRequest = sendRequest as? String ?? strSendRequest
        }
        if let description = wordDict.value(forKey: "Description"){
            strDescription = description as? String ?? strDescription
        }
        
        //MARK:- SideBarVC -> AddressListVC
        if let office = wordDict.value(forKey: "Office"){
            strOffice = office as? String ?? strOffice
        }
        if let other = wordDict.value(forKey: "Other"){
            strOther = other as? String ?? strOther
        }
        if let address = wordDict.value(forKey: "Address :"){
            strAddress = address as? String ?? strAddress
        }
        if let landmark = wordDict.value(forKey: "Landmark :"){
            strLandmark = landmark as? String ?? strLandmark
        }
        if let city = wordDict.value(forKey: "City :"){
            strCity = city as? String ?? strCity
        }
        if let pinCode = wordDict.value(forKey: "Pin Code :"){
            strPincode = pinCode as? String ?? strPincode
        }
        if let email = wordDict.value(forKey: "Email :"){
            strEmail2 = email as? String ?? strEmail2
        }
        if let mobileNumber = wordDict.value(forKey: "Mobile :"){
            strMobile = mobileNumber as? String ?? strMobile
        }
        
        //MARK:- SideBarVC -> Manage Address -> Details
        if let mapSmallFont = wordDict.value(forKey: "It will help our delivery boy to find your place. To change the location you can drag and drop the pin on map"){
            strmapSmallFont = mapSmallFont as? String ?? strmapSmallFont
        }
        if let saveAddress = wordDict.value(forKey: "Save Address"){
            strSaveAddress = saveAddress as? String ?? strSaveAddress
        }
        if let name = wordDict.value(forKey: "Name"){
            strName = name as? String ?? strName
        }
        if let mobileNumber = wordDict.value(forKey: "Mobile Number"){
            strMobileNumber = mobileNumber as? String ?? strMobileNumber
        }
        if let email = wordDict.value(forKey: "Email"){
            strEmail = email as? String ?? strEmail
        }
        if let additionalNumber = wordDict.value(forKey: "Enter Additional Number"){
            strEnterAdditionalNumber = additionalNumber as? String ?? strEnterAdditionalNumber
        }
        if let pincodeValidation = wordDict.value(forKey: "Pincode  can not be blank"){
            strPincodeValidation = pincodeValidation as? String ?? strPincodeValidation
        }
        if let enterValidnumber = wordDict.value(forKey: "Enter Valid Mobile Number"){
            strEnterValidMobileNumber = enterValidnumber as? String ?? strEnterValidMobileNumber
        }
        if let nameValidation = wordDict.value(forKey: "Name can not blank"){
            strNameValidation = nameValidation as? String ?? strNameValidation
        }
        if let mobileValidation = wordDict.value(forKey: "Mobile number can not be blank"){
            strMobileValidation = mobileValidation as? String ?? strMobileValidation
        }
        if let validMobileNumber = wordDict.value(forKey: "Enter Valid Mobile Number"){
            strEnterValidMobileNumber = validMobileNumber as? String ?? strEnterValidMobileNumber
        }
        if let emailvalidation = wordDict.value(forKey: "Email can not be blank"){
            strEmailvalidation = emailvalidation as? String ?? strEmailvalidation
        }
        if let validEmailValidation = wordDict.value(forKey: "Email Address not valid"){
            strEmailAddressNotValid = validEmailValidation as? String ?? strEmailAddressNotValid
        }
        if let addressValidation = wordDict.value(forKey: "Address  can not be blank"){
            strAddressValidation = addressValidation as? String ?? strAddressValidation
        }
        
        //MARK:- SideBarVC -> MyOrderVC
        if let pendingOrder = wordDict.value(forKey: "Pending Order"){
            strPendingOrder = pendingOrder as? String ?? strPendingOrder
        }
        if let completeOrder = wordDict.value(forKey: "Complete Order"){
            strCompleteOrder = completeOrder as? String ?? strCompleteOrder
        }
        if let confirm = wordDict.value(forKey: "Confirm"){
            strConfirm = confirm as? String ?? strConfirm
        }
        if let waitingConfirmation = wordDict.value(forKey: "waiting for confirmation"){
            strWaiting = waitingConfirmation as? String ?? strWaiting
        }
        if let cancel = wordDict.value(forKey: "Cancel"){
            strCancel = cancel as? String ?? strCancel
        }
        if let canceled = wordDict.value(forKey: "Canceled"){
            strCanceled = canceled as? String ?? strCanceled
        }
        
        //MARK:- SideBarVC -> MyOrderVC -> OrderDataVC
        if let orderDate = wordDict.value(forKey: "Order Date :"){
            strOrderDate = orderDate as? String ?? strOrderDate
        }
        if let expectedDeliverydate = wordDict.value(forKey: "Expected Delivery Date :- "){
            strExpectedDeliveryDate = expectedDeliverydate as? String ?? strExpectedDeliveryDate
        }
        if let status = wordDict.value(forKey: "Status :"){
            strStatus = status as? String ?? strStatus
        }
        if let shippingCharge = wordDict.value(forKey: "Shipping Charge"){
            strShippingCharge = shippingCharge as? String ?? strShippingCharge
        }
        if let pickupFromStore = wordDict.value(forKey: "Pickup From Store"){
            strPickupFromStore = pickupFromStore as? String ?? strPickupFromStore
        }
        if let locationdelivery = wordDict.value(forKey: "Location Delivery"){
            strLocationDelivery = locationdelivery as? String ?? strLocationDelivery
        }
        if let reOrder = wordDict.value(forKey: "ReOrder"){
            strReOrder = reOrder as? String ?? strReOrder
        }
        if let cancelOrder = wordDict.value(forKey: "Cancel Order"){
            strCancelOrder = cancelOrder as? String ?? strCancelOrder
        }
        
        //MARK:- SideBarVC -> NotificationVC
        
        //MARK:- SideBarVC -> UserProfileVC
        if let submit = wordDict.value(forKey: "Submit"){
            strSubmit = submit as? String ?? strSubmit
        }
        
        //MARK:- SideBarVC -> ContactUsVC
        if let message = wordDict.value(forKey: "Message"){
            strMessage = message as? String ?? strMessage
        }
        if let messageValidation = wordDict.value(forKey: "Message can not blank"){
            strMessagevalidation = messageValidation as? String ?? strMessagevalidation
        }
        
        //MARK:- SideBarVC -> ContactUsVC
        if let yes = wordDict.value(forKey: "Yes"){
            strYes = yes as? String ?? strYes
        }
        if let logoutText = wordDict.value(forKey: "Are you sure you want to Logout from VonPharmaCare?"){
            strLogoutFromVonPharmaCare = logoutText as? String ?? strLogoutFromVonPharmaCare
        }
        if let logout = wordDict.value(forKey: "Log Out"){
            strLogOut = logout as? String ?? strLogOut
        }
        
        //MARK:- LoginVC
        if let password = wordDict.value(forKey: "Password"){
            strPassword = password as? String ?? strPassword
        }
        if let forgotPassword = wordDict.value(forKey: "Forgot Password ?"){
            strForgotPassword = forgotPassword as? String ?? strForgotPassword
        }
        if let login = wordDict.value(forKey: "Login"){
            strLogin = login as? String ?? strLogin
        }
        if let register = wordDict.value(forKey: "Register"){
            strRegister = register as? String ?? strRegister
        }
        if let dontAccount = wordDict.value(forKey: "Do not have an account?"){
            strDonthaveAccount = dontAccount as? String ?? strDonthaveAccount
        }
        
        if let loginRequired = wordDict.value(forKey: "Login Required"){
            strLoginRequired = loginRequired as? String ?? strLoginRequired
        }
        if let needDoLogin = wordDict.value(forKey: "You need to do Login to use some Features of the App"){
            strIsUserLogin = needDoLogin as? String ?? strIsUserLogin
        }
        
        //MARK:- Register
        if let confirmPassword = wordDict.value(forKey: "Confirm Password"){
            strConfirmPassword = confirmPassword as? String ?? strConfirmPassword
        }
        if let signUp = wordDict.value(forKey: "Signup"){
            strSignup = signUp as? String ?? strSignup
        }
        if let alreadyAccount = wordDict.value(forKey: "Already Have an account?"){
            strAlreadyAccount = alreadyAccount as? String ?? strAlreadyAccount
        }
        if let enterValidNumber = wordDict.value(forKey: "Enter Valid Mobile Number") {
            strEnterValidNumber = enterValidNumber as? String ?? strEnterValidNumber
        }
        if let passwordNotBlank = wordDict.value(forKey: "Password can not be Blank"){
            strPasswordCanNotBeBlank = passwordNotBlank as? String ?? strPasswordCanNotBeBlank
        }
        if let confirmPasswordNotBlank = wordDict.value(forKey: "Confirm Password can not be blank"){
            strConfirmPasswordCanNotBeBlank = confirmPasswordNotBlank as? String ?? strConfirmPasswordCanNotBeBlank
        }
        if let passwordConfirmPasswordNotmatch = wordDict.value(forKey: "Password and Confirm Password does not match"){
            strPasswordAndConfirmPasswordDoesNotMatch = passwordConfirmPasswordNotmatch as? String ?? strPasswordAndConfirmPasswordDoesNotMatch
        }
        if let minimumPasswordLenghth = wordDict.value(forKey: "Password must be greater than 8 character"){
            strMinimumPasswordValidation = minimumPasswordLenghth as? String ?? strMinimumPasswordValidation
        }
        
        
        //MARK:- Register -> Otp Varification
        if let enterOtp = wordDict.value(forKey: "Enter OTP"){
            strEnterOTP = enterOtp as? String ?? strEnterOTP
        }
        if let verifyOtp = wordDict.value(forKey: "Please Verify Your Number"){
            strPleaseVerifyYourNumber = verifyOtp as? String ?? strPleaseVerifyYourNumber
        }
        if let fourDigitvarification = wordDict.value(forKey: "Please verify your number.We sent you 4 digit OTP to your number please enter below."){
            strplease_verify_your_number_we_sent_you_4_digit_otp_to_your_number_please_enter_below = fourDigitvarification as? String ?? strplease_verify_your_number_we_sent_you_4_digit_otp_to_your_number_please_enter_below
        }
        
        //MARK:- Other Text
        if let confirmationdelete = wordDict.value(forKey: "Are you sure want to delete?"){
            strAreyouSureWantToDelete = confirmationdelete as? String ?? strAreyouSureWantToDelete
        }
        if let sendUpdateFromMedicalteam = wordDict.value(forKey: "We will send an update once your prescriptions is verified by our medical team."){
            strUpdatePrescriptionVerifiedByTeam = sendUpdateFromMedicalteam as? String ?? strUpdatePrescriptionVerifiedByTeam
        }
        if let rejected = wordDict.value(forKey: "Rejected"){
            strRejected = rejected as? String ?? strRejected
        }
        if let setDeliveryLocation = wordDict.value(forKey: "Set Your Delivery Location "){
            strDelivryLocation = setDeliveryLocation as? String ?? strDelivryLocation
        }
        if let pleaseEnableyourlocationService = wordDict.value(forKey: "Please Enable your location Service"){
            strPleaseEnableyourlocationService = pleaseEnableyourlocationService as? String ?? strPleaseEnableyourlocationService
        }
        if let locationVisible = wordDict.value(forKey: "Location Disable"){
            strLocationDisable = locationVisible as? String ?? strLocationDisable
        }
        if let new = wordDict.value(forKey: "New"){
            strNew = new as? String ?? strNew
        }
        if let returnDone = wordDict.value(forKey: "Returned Done"){
            strReturnedDone = returnDone as? String ?? strReturnedDone
        }
        if let failed = wordDict.value(forKey: "Failed"){
            strFailed = failed as? String ?? strFailed
        }
        if let done = wordDict.value(forKey: "Done"){
            strDone = done as? String ?? strDone
        }
        if let vOnGiftCard = wordDict.value(forKey: "Von Gift Card"){
            strVonGiftCard = vOnGiftCard as? String ?? "Von Gift Card"
        }
        if let refereFends = wordDict.value(forKey: "Refer & Earn"){
            strReferrerFriend = refereFends as? String ?? "Referrer & Earn"
        }
        if let walletHistory = wordDict.value(forKey: "Wallet History"){
            strWalletHistory = walletHistory as? String ?? "Wallet History"
        }
        if let refereCode = wordDict.value(forKey: "Referrer Code"){
            strReferrerCode = refereCode as? String ?? "Referrer Code"
        }
        if let invalidOtp = wordDict.value(forKey: "Invalid OTP"){
            strInvalidOtp = invalidOtp as? String ?? "Invalid OTP"
        }
        if let notSuffientBalance = wordDict.value(forKey: "Not Sufficient Balance"){
            strNotSufficientBalance = notSuffientBalance as? String ?? "Not Sufficient Balance"
        }
        if let shareCodeWithFrds = wordDict.value(forKey: "Share this Code With your Friend"){
            strShareCodeWithFrds = shareCodeWithFrds as? String ?? "Share this Code With your Friend"
        }
        if let notLoginText = wordDict.value(forKey: "You are Not Logined, Please Login To Account"){
            strNotLoginText = notLoginText as? String ?? "You are Not Logined, Please Login To Account"
        }
        if let didNotGetCode = wordDict.value(forKey: "Did not get Code ?"){
            strDidNotGetCode = didNotGetCode as? String ?? "Did not get Code ?"
        }
        if let generateCode = wordDict.value(forKey: "Generate Code"){
            strGenerateCode = generateCode as? String ?? "Generate Code"
        }
        if let shareAndEarntext = wordDict.value(forKey: "You Get Rs 5 And Your Friend Get Rs 10"){
            strShareAndEarnText = shareAndEarntext as? String ?? "You Get Rs 5 And Your Friend Get Rs 10"
        }
        if let earntextDetails = wordDict.value(forKey: "Both you and your friend get referral bonus on app installation and using referral code. Pro tip : Share in Whatsapp/ Instagram/ Facebook groups for better results."){
            strShareEarndetail = earntextDetails as? String ?? strShareEarndetail
        }
        if let forward = wordDict.value(forKey: "Forward"){
            strForward = forward as? String ?? "Forward"
        }
    }
}
