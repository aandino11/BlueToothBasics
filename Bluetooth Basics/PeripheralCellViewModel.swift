//
//  PeripheralCellViewModel.swift
//  Bluetooth Basics
//
//  Created by Alvin Andino on 5/17/20.
//  Copyright © 2020 Alvin Andino. All rights reserved.
//

import Foundation

final class PeripheralCellViewModel: Identifiable {
    let peripheralName = "Peripheral Name"
    let numberOfServicesText = "Number of Services"
    let rssiText = "RSSI"
    let peripheralDetailViewModel = PeripheralDetailViewModel()
}
