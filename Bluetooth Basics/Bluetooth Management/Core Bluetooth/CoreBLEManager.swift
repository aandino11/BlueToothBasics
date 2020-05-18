//
//  CoreBLEManager.swift
//  Bluetooth Basics
//
//  Created by Alvin Andino on 5/17/20.
//  Copyright © 2020 Alvin Andino. All rights reserved.
//

import CoreBluetooth
import Combine

final class CoreBLEManager: NSObject, CBCentralManagerDelegate, BLEManaging {

    var discoveredPeripheral: AnyPublisher<AdveristingPeripheral, Never> {
        return _discoveredPeripheral.eraseToAnyPublisher()
    }

    var onReadyToScan: (() -> Void)?

    private lazy var cbCentralManager: CBCentralManager = {
        return CBCentralManager(
            delegate: self,
            queue: nil
        )
    }()

    private var _discoveredPeripheral = PassthroughSubject<AdveristingPeripheral, Never>()

    override init() {
        super.init()
        // Here to "kick" the lazy var
        let _ = cbCentralManager.isScanning
    }

    func scanForPeripherals() {
        guard cbCentralManager.state == .poweredOn else {
            return
        }
        cbCentralManager.scanForPeripherals(
            withServices: nil,
            options: nil
        )
    }

    // MARK: - CBCentralManagerDelegate

    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        print("Current State: \(central.state)")

        if central.state == .poweredOn {
            onReadyToScan?()
        }
    }

    func centralManager(
        _ central: CBCentralManager,
        didDiscover peripheral: CBPeripheral,
        advertisementData: [String : Any],
        rssi RSSI: NSNumber
    ) {
        print("Discovered Peripheral: \(peripheral.name ?? "Name Unknown"), RSSI: \(RSSI)")
        let advertisingPeripheral = AdveristingPeripheral(
            rssi: Int(truncating: RSSI),
            peripheral: peripheral
        )
        _discoveredPeripheral.send(advertisingPeripheral)

    }
}

extension CBManagerState: CustomStringConvertible {
    public var description: String {
        switch self {
        case .unknown:
            return "Unknown"
        case .resetting:
            return "Resetting"
        case .unsupported:
            return "Unsupported"
        case .unauthorized:
            return "Unauthorized"
        case .poweredOff:
            return "Powered Off"
        case .poweredOn:
            return "Powered On"
        @unknown default:
            return "Unhandled Value: \(rawValue)"
        }
    }
}
