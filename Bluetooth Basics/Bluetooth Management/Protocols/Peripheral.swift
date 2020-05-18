//
//  Peripheral.swift
//  Bluetooth Basics
//
//  Created by Alvin Andino on 5/17/20.
//  Copyright © 2020 Alvin Andino. All rights reserved.
//

import Foundation

protocol Peripheral {
    var name: String? { get }
    var identifier: UUID { get }
}

extension Peripheral {
    var defaultName: String {
        return name ?? "Unkown Name"
    }
}
