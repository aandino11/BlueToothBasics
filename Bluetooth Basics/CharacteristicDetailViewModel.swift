//
//  CharacteristicDetailViewModel.swift
//  Bluetooth Basics
//
//  Created by Alvin Andino on 5/17/20.
//  Copyright © 2020 Alvin Andino. All rights reserved.
//

import Foundation

private enum CharacteristicProperty: String, CaseIterable {
    case read = "Read"
    case writeWithoutResponse = "Write Without Response"
    case write = "Write"
    case notify = "Notify"
}

struct CharacteristicDetailViewModel {
    let navigationBarTitle = "Charateristic Name"
    let subHeaderText = "Characteristic UUID"
    let shouldShowReadSection = true
    let readValue = "A Read Value"
    let shouldShowWriteSection = true
    let onWriteValue: (Int) -> () = {
        print("Recieved Value: \($0)")
    }
    let characteristicProperities: [String] = {
        return CharacteristicProperty.allCases.map { $0.rawValue }
    }()
}
