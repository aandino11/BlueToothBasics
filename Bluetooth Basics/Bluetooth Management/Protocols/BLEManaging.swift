//
//  BLEManaging.swift
//  Bluetooth Basics
//
//  Created by Alvin Andino on 5/17/20.
//  Copyright © 2020 Alvin Andino. All rights reserved.
//

import Combine

protocol BLEManaging: class {
    var onReadyToScan: (() -> Void)? { get set }
    var discoveredPeripheral: AnyPublisher<AdveristingPeripheral, Never> { get }
    func scanForPeripherals()
}
