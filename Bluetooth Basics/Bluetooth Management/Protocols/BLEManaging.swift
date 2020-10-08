//
//  BLEManaging.swift
//  Bluetooth Basics
//
//  Created by Alvin Andino on 5/17/20.
//  Copyright © 2020 Alvin Andino. All rights reserved.
//

import Combine

protocol BLEManaging: class {
    var readyToScan: AnyPublisher<Void, Never> { get }
    var discoveredPeripheral: AnyPublisher<AdveristingPeripheral, Never> { get }
    func scanForPeripherals()
}
