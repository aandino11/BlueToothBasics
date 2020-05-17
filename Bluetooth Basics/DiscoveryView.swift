//
//  DiscoveryView.swift
//  Bluetooth Basics
//
//  Created by Alvin Andino on 5/16/20.
//  Copyright © 2020 Alvin Andino. All rights reserved.
//

import SwiftUI

struct DiscoveryView: View {
    @ObservedObject private(set) var viewModel: DiscoveryViewModel

    var body: some View {
        NavigationView {
            List(viewModel.peripheralCellViewModels) { viewModel in
                PeripheralCell(viewModel: viewModel)
            }.navigationBarTitle(viewModel.navigationBarTitle)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoveryView(viewModel: DiscoveryViewModel())
    }
}
