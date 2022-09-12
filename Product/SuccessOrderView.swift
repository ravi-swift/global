//
//  SuccessOrderView.swift
//  VOnPharmaCare
//
//  Created by MAC on 25/09/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation
import UIKit

class SuccessOrderView: NibView {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var orderNumber: UILabel!
    @IBOutlet weak var homeBtn: BorderButton!
    @IBOutlet weak var myOderBtn: BorderButton!
    @IBOutlet weak var closeBtn: CloseButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addCornerToView(view: self.mainView, value: 15)
        addShadowToView(view: self.myOderBtn, color: .lightGray, value: 2)
        addShadowToView(view: self.homeBtn, color: .lightGray, value: 2)
    }
}
