//
//  PeripheralCellViewModel.swift
//  Bluetooth Basics
//
//  Created by Alvin Andino on 5/17/20.
//  Copyright © 2020 Alvin Andino. All rights reserved.
//

import Foundation

final class PeripheralCellViewModel: Identifiable, ObservableObject {
    let numberOfServicesText = "Number of Services"

    @Published var rssiText: String

    var peripheralName: String {
        return adveristingPeripheral.peripheral.defaultName
    }

    var peripheralIdentifier: UUID {
        return adveristingPeripheral.peripheral.identifier
    }

    let peripheralDetailViewModel = PeripheralDetailViewModel()

    private let adveristingPeripheral: AdveristingPeripheral

    init(peripheral: AdveristingPeripheral) {
        self.adveristingPeripheral = peripheral
        rssiText = String(peripheral.rssi)
    }
}
