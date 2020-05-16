//
//  PeripheralCell.swift
//  Bluetooth Basics
//
//  Created by Alvin Andino on 5/16/20.
//  Copyright © 2020 Alvin Andino. All rights reserved.
//

import SwiftUI

struct PeripheralCell: View {
    var body: some View {
        NavigationLink(destination: Text("Name")) {
            Text("RSSI")
            VStack(alignment: .leading) {
                Text("Peripheral Name")
                Text("Number of Services")
            }
        }
    }
}

struct PeripheralCell_Previews: PreviewProvider {
    static var previews: some View {
        PeripheralCell()
    }
}
