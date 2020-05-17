//
//  CharacteristicDetailView.swift
//  Bluetooth Basics
//
//  Created by Alvin Andino on 5/16/20.
//  Copyright © 2020 Alvin Andino. All rights reserved.
//

import SwiftUI

struct CharacteristicDetailView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Characteristic UUID")
            List {
                ReadSection()
                WriteSection()
                ProperitiesSection()
            }.listStyle(GroupedListStyle())
        }.navigationBarTitle("Charateristic Name")
    }
}

struct ReadSection: View {
    var body: some View {
        Section(header: Text("Read Values")) {
            Text("Hello")
        }
    }
}

struct WriteSection: View {
    var body: some View {
        Section(header: Text("Write Values")) {
            NavigationLink(destination: WriteValueView()) {
                Text("Write a new value")
            }
        }
    }
}

struct ProperitiesSection: View {
    var body: some View {
        Section(header: Text("Properities")) {
            Text("Hello")
        }
    }
}

struct CharacteristicDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CharacteristicDetailView()
    }
}
