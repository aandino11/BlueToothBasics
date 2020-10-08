//
//  AppHardwareEnvironment.swift
//  Bluetooth Basics
//
//  Created by Alvin Andino on 10/8/20.
//  Copyright © 2020 Alvin Andino. All rights reserved.
//

import Foundation

struct AppHardwareEnvironment {
    static let isSimulator: Bool = {
        #if arch(i386) || arch(x86_64)

            return true
        #else

            return false
        #endif
    }()
}
