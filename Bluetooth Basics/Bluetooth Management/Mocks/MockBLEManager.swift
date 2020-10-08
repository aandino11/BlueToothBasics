//
//  MockBLEManager.swift
//  Bluetooth Basics
//
//  Created by Alvin Andino on 5/17/20.
//  Copyright © 2020 Alvin Andino. All rights reserved.
//

import Foundation
import Combine

final class MockBLEManager: BLEManaging {
    var readyToScan: AnyPublisher<Void, Never> {
        return PassthroughSubject<Void, Never>().eraseToAnyPublisher()
    }

    var discoveredPeripheral: AnyPublisher<AdveristingPeripheral, Never> {
        return PassthroughSubject<AdveristingPeripheral, Never>().eraseToAnyPublisher()
    }

    func scanForPeripherals() {
        print("Scanning For Peripherals")
    }
}
