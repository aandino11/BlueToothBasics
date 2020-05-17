//
//  CharacteristicDetailView.swift
//  Bluetooth Basics
//
//  Created by Alvin Andino on 5/16/20.
//  Copyright © 2020 Alvin Andino. All rights reserved.
//

import SwiftUI

struct CharacteristicDetailView: View {
    let viewModel: CharacteristicDetailViewModel

    var body: some View {
        VStack(alignment: .leading) {
            Text(viewModel.subHeaderText)
            List {
                if viewModel.shouldShowReadSection {
                    ReadSection(readValue: viewModel.readValue)
                }
                if viewModel.shouldShowWriteSection {
                    WriteSection(onWriteValue: viewModel.onWriteValue)
                }
                ProperitiesSection(properities: viewModel.characteristicProperities)
            }.listStyle(GroupedListStyle())
        }.navigationBarTitle(viewModel.navigationBarTitle)
    }
}

struct ReadSection: View {
    let readValue: String

    var body: some View {
        Section(header: Text("Read Values")) {
            Text(readValue)
        }
    }
}

struct WriteSection: View {
    let onWriteValue: (Int) -> ()

    var body: some View {
        Section(header: Text("Write Values")) {
            NavigationLink(destination: WriteValueView(onWriteValue: onWriteValue)) {
                Text("Write a new value")
            }
        }
    }
}

struct ProperitiesSection: View {
    let properities: [String]
    var body: some View {
        Section(header: Text("Properities")) {
            ForEach(properities) { property in
                Text(property)
            }
        }
    }
}

struct CharacteristicDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CharacteristicDetailView(viewModel: CharacteristicDetailViewModel())
    }
}

extension String: Identifiable {
    public var id: ObjectIdentifier {
        return ObjectIdentifier(self as NSString)
    }
}
