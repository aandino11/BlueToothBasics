//
//  PeripheralDetailView.swift
//  Bluetooth Basics
//
//  Created by Alvin Andino on 5/16/20.
//  Copyright © 2020 Alvin Andino. All rights reserved.
//

import SwiftUI

struct PeripheralDetailView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Peripheral UUID")
            List {
                ForEach(0..<2) { item in
                    ServiceSection()
                }
            }.listStyle(GroupedListStyle())
        }.navigationBarTitle("Peripheral Name")
    }
}


struct ServiceSection: View {
    var body: some View {
        Section(header: Text("Service Name")) {
            ForEach(0..<3) { item in
                CharacteristicCell()
            }
        }
    }
}

struct CharacteristicCell: View {
    var body: some View {
        NavigationLink(destination: Text("hello")) {
             VStack(alignment: .leading) {
                 Text("Characteristic Name")
                 Text("Characteristic Value")
             }
        }
    }
}

struct PeripheralDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PeripheralDetailView()
    }
}
