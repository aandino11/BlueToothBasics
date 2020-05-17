//
//  PeripheralDetailView.swift
//  Bluetooth Basics
//
//  Created by Alvin Andino on 5/16/20.
//  Copyright © 2020 Alvin Andino. All rights reserved.
//

import SwiftUI

struct PeripheralDetailView: View {
    let viewModel: PeripheralDetailViewModel

    var body: some View {
        VStack(alignment: .leading) {
            Text(viewModel.headerText)
            List {
                ForEach(viewModel.serviceSectionViewModels) { serviceSectionViewModel in
                    ServiceSection(viewModel: serviceSectionViewModel)
                }
            }.listStyle(GroupedListStyle())
        }.navigationBarTitle(viewModel.navigationBarTitle)
    }
}


struct ServiceSection: View {
    let viewModel: ServiceSectionViewModel

    var body: some View {
        Section(header: Text(viewModel.headerText)) {
            ForEach(viewModel.characteristicCellViewModels) { characteristicCellViewModel in
                CharacteristicCell(viewModel: characteristicCellViewModel)
            }
        }
    }
}

struct CharacteristicCell: View {
    let viewModel: CharacteristicCellViewModel

    var body: some View {
        NavigationLink(destination: CharacteristicDetailView()) {
            VStack(alignment: .leading) {
                Text(viewModel.headerText)
                Text(viewModel.subHeaderText)
            }
        }
    }
}

struct PeripheralDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PeripheralDetailView(viewModel: PeripheralDetailViewModel())
    }
}
