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
        return Just(()).eraseToAnyPublisher()
    }

    var discoveredPeripheral: AnyPublisher<AdveristingPeripheral, Never> {
        return Publishers.Sequence(sequence: mockPeripherals).eraseToAnyPublisher()
    }

    func scanForPeripherals() {
        print("Scanning For Peripherals")
    }
}

private extension MockBLEManager {
    var mockPeripherals: [AdveristingPeripheral] {
        return [
            AdveristingPeripheral(rssi: Int.random(in: -100...0), peripheral: MockPeripheral()),
            AdveristingPeripheral(rssi: Int.random(in: -100...0), peripheral: MockPeripheral()),
            AdveristingPeripheral(rssi: Int.random(in: -100...0), peripheral: MockPeripheral()),
            AdveristingPeripheral(rssi: Int.random(in: -100...0), peripheral: MockPeripheral()),
            AdveristingPeripheral(rssi: Int.random(in: -100...0), peripheral: MockPeripheral()),
            AdveristingPeripheral(rssi: Int.random(in: -100...0), peripheral: MockPeripheral()),
            AdveristingPeripheral(rssi: Int.random(in: -100...0), peripheral: MockPeripheral()),
            AdveristingPeripheral(rssi: Int.random(in: -100...0), peripheral: MockPeripheral()),
            AdveristingPeripheral(rssi: Int.random(in: -100...0), peripheral: MockPeripheral()),
            AdveristingPeripheral(rssi: Int.random(in: -100...0), peripheral: MockPeripheral())
        ]
    }
}
