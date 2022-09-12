//
//  Extension.swift
//  FirebaseDemo
//
//  Created by MAC on 17/08/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation
import UIKit
import NVActivityIndicatorView
import LGSideMenuController
import Photos

class NibView: UIView {
    var view: UIView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Setup view from .xib file
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // Setup view from .xib file
        xibSetup()
    }
}
private extension NibView {
    
    func xibSetup() {
        backgroundColor = UIColor.clear
        view = loadNib()
        // use bounds not frame or it'll be offset
        view.frame = bounds
        // Adding custom subview on top of our view
        addSubview(view)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[childView]|",
                                                      options: [],
                                                      metrics: nil,
                                                      views: ["childView": view]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[childView]|",
                                                      options: [],
                                                      metrics: nil,
                                                      views: ["childView": view]))
    }
}

extension UIView {
    /** Loads instance from nib with the same name. */
    func loadNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nibName = type(of: self).description().components(separatedBy: ".").last!
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as! UIView
    }
}

extension UITextView: UITextViewDelegate {
    
    /// Resize the placeholder when the UITextView bounds change
    override open var bounds: CGRect {
        didSet {
            self.resizePlaceholder()
        }
    }
    
    /// The UITextView placeholder text
    public var placeholder: String? {
        get {
            var placeholderText: String?
            
            if let placeholderLabel = self.viewWithTag(100) as? UILabel {
                placeholderText = placeholderLabel.text
                placeholderLabel.font = UIFont.systemFont(ofSize: 17)
                placeholderLabel.textColor = UIColor.darkGray
            }
            
            return placeholderText
        }
        set {
            if let placeholderLabel = self.viewWithTag(100) as! UILabel? {
                placeholderLabel.text = newValue
                placeholderLabel.font = UIFont.systemFont(ofSize: 17)
                placeholderLabel.sizeToFit()
                
            } else {
                self.addPlaceholder(newValue!)
            }
        }
    }
    
    /// When the UITextView did change, show or hide the label based on if the UITextView is empty or not
    ///
    /// - Parameter textView: The UITextView that got updated
    public func textViewDidChange(_ textView: UITextView) {
        if let placeholderLabel = self.viewWithTag(100) as? UILabel {
            placeholderLabel.isHidden = !self.text.isEmpty
        }
    }
    
    /// Resize the placeholder UILabel to make sure it's in the same position as the UITextView text
    private func resizePlaceholder() {
        if let placeholderLabel = self.viewWithTag(100) as! UILabel? {
            let labelX = self.textContainer.lineFragmentPadding
            let labelY = self.textContainerInset.top - 2
            let labelWidth = self.frame.width - (labelX * 2)
            let labelHeight = placeholderLabel.frame.height

            placeholderLabel.frame = CGRect(x: labelX, y: labelY, width: labelWidth, height: labelHeight)
        }
    }
    
    /// Adds a placeholder UILabel to this UITextView
    private func addPlaceholder(_ placeholderText: String) {
        let placeholderLabel = UILabel()
        
        placeholderLabel.text = placeholderText
        placeholderLabel.font = UIFont(name: "UIFontWeightMedium", size: 18)
        placeholderLabel.sizeToFit()
        
//        placeholderLabel.font = UIFont(name: "UIFontWeightMedium", size: 18)//self.font
        placeholderLabel.textColor = UIColor.lightGray.withAlphaComponent(0.7)
        placeholderLabel.tag = 100
        
        placeholderLabel.isHidden = !self.text.isEmpty
        
        self.addSubview(placeholderLabel)
        self.resizePlaceholder()
        self.delegate = self
    }
    
}
extension UIViewController {
    /// Top most ViewController
    func topMostViewController() -> UIViewController {
        
        if self.presentedViewController == nil {
            return self
        }
        
        if let navigation = self.presentedViewController as? UINavigationController {
            return (navigation.visibleViewController?.topMostViewController())!
        }
        if let tab = self.presentedViewController as? UITabBarController {
            if let selectedTab = tab.selectedViewController {
                return selectedTab.topMostViewController()
            }
            return tab.topMostViewController()
        }
        
        return (self.presentedViewController?.topMostViewController())!
    }
}

extension UIViewController : NVActivityIndicatorViewable {
    func startLoad() {
        startAnimating(loaderSize, type: .ballRotateChase, color:primary_color)
    }
    func stopLoad() {
        stopAnimating()
    }
}

extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}

extension UIImageView {
  func setImageColor(color: UIColor) {
    let templateImage = self.image?.withRenderingMode(.alwaysTemplate)
    self.image = templateImage
    self.tintColor = color
  }
}

extension UIViewController{
    
    func enableSideMenu(){
        self.sideMenuController?.isLeftViewDisabled = false
        self.sideMenuController?.isLeftViewSwipeGestureDisabled = false
    }
    
    func disableSideMenu(){
        self.sideMenuController?.isLeftViewDisabled = true
        self.sideMenuController?.isLeftViewSwipeGestureDisabled = true
    }
}
extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

extension Data {
    var html2AttributedString: NSAttributedString? {
        do {
            return try NSAttributedString(data: self, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            print("error:", error)
            return  nil
        }
    }
    var html2String: String { html2AttributedString?.string ?? "" }
}
extension StringProtocol {
    var html2AttributedString: NSAttributedString? {
        Data(utf8).html2AttributedString
    }
    var html2String: String {
        html2AttributedString?.string ?? ""
    }
}
public extension String {
    var base64Decoded: String? {
        guard let base64 = Data(base64Encoded: self) else { return nil }
        let utf8 = String(data: base64, encoding: .utf8)
        return utf8
    }
    var base64Encoded: String? {
        let utf8 = self.data(using: .utf8)
        let base64 = utf8?.base64EncodedString()
        return base64
    }
}
extension UIColor {
    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0

        getRed(&r, green: &g, blue: &b, alpha: &a)

        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0

        return NSString(format:"#%06x", rgb) as String
    }

    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")

        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }

}
extension String {
    func strikeThrough() -> NSAttributedString {
        let attributeString =  NSMutableAttributedString(string: self)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0,attributeString.length))
        return attributeString
    }
}
extension UIViewController{

//    func addBadge(itemvalue: String) {
//        let bagButton = BadgeButton()
//        bagButton.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
//        bagButton.tintColor = UIColor.white
//        bagButton.backgroundColor = primary_color
//        bagButton.badgeBackgroundColor = dark_green_color
//        addBorderToView(view: bagButton.badgeLabel, color: .white, value: 1)
//        bagButton.setImage(UIImage(named: "ic_cart")?.withRenderingMode(.alwaysTemplate), for: .normal)
//        bagButton.badgeEdgeInsets = UIEdgeInsets(top: bagButton.frame.minY + 13, left: 0, bottom: 0, right: 5)
//        bagButton.badge = itemvalue
//        
//        let rightButton = UIBarButtonItem(customView: bagButton)
//        let currWidth = rightButton.customView?.widthAnchor.constraint(equalToConstant: 35)
//        currWidth?.isActive = true
//        let currHeight = rightButton.customView?.heightAnchor.constraint(equalToConstant: 35)
//        currHeight?.isActive = true
//        self.navigationItem.rightBarButtonItem = rightButton
//    }
}

extension String{
    
   func CGFloatValue() -> CGFloat? {
      guard let doubleValue = Double(self) else {
        return nil
      }

      return CGFloat(doubleValue)
    }
}


extension UILabel{
    
    func addStrike(mainString: String,strikeString: String,font: UIFont){
        let string = mainString
        let strikeString = (string as NSString).range(of: strikeString)
        let attributedString = NSMutableAttributedString(string: string, attributes: [NSAttributedString.Key.font:font])
        attributedString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: strikeString)
        self.attributedText = attributedString
    }
}

extension UIViewController {

    var topbarHeight: CGFloat {
        if #available(iOS 13.0, *) {
            return (view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0.0) +
                (self.navigationController?.navigationBar.frame.height ?? 0.0)
        } else {
            let topBarHeight = UIApplication.shared.statusBarFrame.size.height +
            (self.navigationController?.navigationBar.frame.height ?? 0.0)
            return topBarHeight
        }
    }
}

extension Data {
    var hexString: String {
        let hexString = map { String(format: "%02.2hhx", $0) }.joined()
        return hexString
    }
}


extension PHAsset {

    var image : UIImage {
        var thumbnail = UIImage()
        let requestImageOption = PHImageRequestOptions()
        requestImageOption.resizeMode = PHImageRequestOptionsResizeMode.exact
        requestImageOption.deliveryMode = PHImageRequestOptionsDeliveryMode.highQualityFormat
        requestImageOption.isSynchronous = true
        let imageManager = PHCachingImageManager()
//        imageManager.requestImage(for: self, targetSize: CGSize(width: 100, height: 100), contentMode: .aspectFit, options: nil, resultHandler: { image, _ in
//            thumbnail = image!
//        })
        imageManager.requestImage(for: self, targetSize: PHImageManagerMaximumSize, contentMode: .default, options: requestImageOption) { (image, _) in
            thumbnail = image!
        }
        return thumbnail
    }
}
