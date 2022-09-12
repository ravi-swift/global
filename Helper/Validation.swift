//
//  Validation.swift
//  VOnPharmaCare
//
//  Created by MAC on 19/08/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation

func isValideMobile(value: String) -> Bool {
    let regularExpressionForPhone = "^\\d{10}$"
    let testPhone = NSPredicate(format:"SELF MATCHES %@", regularExpressionForPhone)
    return testPhone.evaluate(with: value)
}

func isValidEmail(value: String) -> Bool {
   let regularExpressionForEmail = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
   let testEmail = NSPredicate(format:"SELF MATCHES %@", regularExpressionForEmail)
   return testEmail.evaluate(with: value)
}
