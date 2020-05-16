//
//  DiscoveryView.swift
//  Bluetooth Basics
//
//  Created by Alvin Andino on 5/16/20.
//  Copyright © 2020 Alvin Andino. All rights reserved.
//

import SwiftUI

struct DiscoveryView: View {
    var body: some View {
        NavigationView {
            List(0..<5) { item in
                NavigationLink(destination: Text("Name")) {
                    Text("RSSI")
                    VStack(alignment: .leading) {
                        Text("Peripheral Name")
                        Text("Number of Services")
                    }
                }
            }.navigationBarTitle("Peripherals Nearby")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoveryView()
    }
}
