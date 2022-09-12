//
//  Protocol.swift
//  VOnPharmaCare
//
//  Created by MAC on 29/05/1942 Saka.
//  Copyright © 1942 MAC. All rights reserved.
//

import Foundation

protocol SelectImageTypeDelegate: class{
    func selectImageType(type: PickerType)
}

protocol GoBackDelegate: class {
    func goBack()
}

protocol GetImageReloadData: class{
    func getIndexValue(row: Int,section: Int)
}

protocol GetImagesDataDelegate: class{
    func imagesUrlData(urls: [String])
}

protocol ActionDelegate: class{
    func performAction(action: ConfirmAction,id: Int?,productType: String?)
}

protocol AddressDataDelegate: class {
    func getData(addressObj: AddressResponse)
}
protocol SelfAddressDataDelegate: class {
    func getSelfAddressData(addressObj: AddressResponse)
}
