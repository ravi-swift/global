//
//  PaymentType.swift
//  VOnPharmaCare
//
//  Created by MAC on 28/09/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation
import UIKit

class PaymentType: NibView {
    
    @IBOutlet weak var paymentlbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var button: UIButton!    
    @IBOutlet weak var mainView: UIView!
    
    
    @IBInspectable var paymentMethod: String?{
        get{
            return self.paymentlbl.text
        }set{
            self.paymentlbl.text = newValue
        }
    }
    
    @IBInspectable var descriptionTxt: String?{
        get{
            return self.descriptionLbl.text
        }set{
            self.descriptionLbl.text = newValue
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addCornerToView(view: self.mainView, value: 5)
    }
}
