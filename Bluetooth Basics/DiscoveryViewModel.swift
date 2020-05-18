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
        bleManager.onReadyToScan = { [weak self] in
            self?.bleManager.scanForPeripherals()
        }

        // TODO: Clean this up
        bleManager.discoveredPeripheral
            .filter
            { peripheral in
                let optionalViewModel = self.peripheralCellViewModels.first {
                    $0.peripheralIdentifier == peripheral.peripheral.identifier
                }
                guard let foundViewModel = optionalViewModel else {
                    return true
                }
                foundViewModel.rssiText = String(peripheral.rssi)

                return false
            }
            .map
            { peripheral in
                return PeripheralCellViewModel(peripheral: peripheral)
            }
            .sink
            { viewModel in
                self.peripheralCellViewModels.append(viewModel)
            }
            .store(in: &bag)
    }
}
