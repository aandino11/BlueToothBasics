//
//  MockPeripheral.swift
//  Bluetooth Basics
//
//  Created by Alvin Andino on 5/17/20.
//  Copyright © 2020 Alvin Andino. All rights reserved.
//

import Foundation

struct MockPeripheral: Peripheral {
    let name: String? = "Mock Name"
    let identifier: UUID = UUID()
}
