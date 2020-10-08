//
//  DiscoveryViewModel.swift
//  Bluetooth Basics
//
//  Created by Alvin Andino on 5/17/20.
//  Copyright © 2020 Alvin Andino. All rights reserved.
//

import Foundation
import Combine

final class DiscoveryViewModel: ObservableObject {
    let navigationBarTitle = "Peripherals Nearby"

    @Published private(set) var peripheralCellViewModels: [PeripheralCellViewModel] = []

    private var bag = Set<AnyCancellable>()
    private let bleManager: BLEManaging

    init(bleManager: BLEManaging) {
        self.bleManager = bleManager
        bindToBLEManager()
    }

    private func bindToBLEManager() {
        bleManager.readyToScan
            .sink
            {
                self.bleManager.scanForPeripherals()
            }
            .store(in: &bag)

        bleManager.discoveredPeripheral
            .sink
            { peripheral in
                guard let foundViewModel = self.findViewModel(for: peripheral) else {
                    return
                }
                foundViewModel.rssiText = String(peripheral.rssi)
            }
            .store(in: &bag)

        // Checkpoint 2
    }

    private func findViewModel(for peripheral: AdveristingPeripheral) -> PeripheralCellViewModel? {
        return peripheralCellViewModels.first {
            $0.peripheralIdentifier == peripheral.peripheral.identifier
        }
    }

    private func hasViewModel(for peripheral: AdveristingPeripheral) -> Bool {
        return findViewModel(for: peripheral) != nil
    }
}
