//
//  PeripheralCell.swift
//  Bluetooth Basics
//
//  Created by Alvin Andino on 5/16/20.
//  Copyright © 2020 Alvin Andino. All rights reserved.
//

import SwiftUI

struct PeripheralCell: View {
    @ObservedObject var viewModel: PeripheralCellViewModel

    var body: some View {
        NavigationLink(destination:  PeripheralDetailView(viewModel: viewModel.peripheralDetailViewModel)) {
            Text(viewModel.rssiText)
            VStack(alignment: .leading) {
                Text(viewModel.peripheralName)
                Text(viewModel.numberOfServicesText)
            }
        }
    }
}

struct PeripheralCell_Previews: PreviewProvider {
    static var previews: some View {
        PeripheralCell(
            viewModel: PeripheralCellViewModel(
                peripheral: AdveristingPeripheral(
                    rssi: 0,
                    peripheral: MockPeripheral()
                )
            )
        )
    }
}
