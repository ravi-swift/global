//
//  Corner.swift
//  VOnPharmaCare
//
//  Created by MAC on 19/08/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation
import UIKit

func addCornerToView(view: UIView,value: CGFloat){
    view.layer.cornerRadius = value
    view.clipsToBounds = true
}

func addShadowToView(view: UIView,color: UIColor,value: CGFloat){
    view.layer.shadowColor = color.cgColor
    view.layer.shadowOpacity = 1
    view.layer.shadowOffset = .zero
    view.layer.shadowRadius = value
    view.clipsToBounds = false
}

func addBorderToView(view: UIView,color: UIColor,value: CGFloat){
    view.layer.borderWidth = value
    view.layer.borderColor = color.cgColor
}

func addRoundCorners(view: UIView,corners: UIRectCorner, radius: CGFloat) {
    let path = UIBezierPath(roundedRect: view.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
    let mask = CAShapeLayer()
    mask.path = path.cgPath
    view.layer.mask = mask
}

func addBottomLeftRightCornerToView(view: UIView,value: CGFloat){
    view.clipsToBounds = true
    view.layer.cornerRadius = value
    view.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]
}

func addTopLeftRightCornerToView(view: UIView,value: CGFloat){
    view.clipsToBounds = true
    view.layer.cornerRadius = value
    view.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
}

func addTopLeftCornerToView(view: UIView,value: CGFloat){
    view.clipsToBounds = true
    view.layer.cornerRadius = value
    view.layer.maskedCorners = [.layerMinXMinYCorner]
}
