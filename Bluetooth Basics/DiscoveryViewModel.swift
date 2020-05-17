//
//  DiscoveryViewModel.swift
//  Bluetooth Basics
//
//  Created by Alvin Andino on 5/17/20.
//  Copyright © 2020 Alvin Andino. All rights reserved.
//

import Foundation

final class DiscoveryViewModel: ObservableObject {
    let navigationBarTitle = "Peripherals Nearby"

    @Published private(set) var peripheralCellViewModels: [PeripheralCellViewModel] = []

    private let numberOfPeripherals = 5

    init() {
        peripheralCellViewModels = (0..<numberOfPeripherals).map { _ in
            return PeripheralCellViewModel()
        }
    }
}
