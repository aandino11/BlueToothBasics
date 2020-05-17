//
//  PeripheralDetailViewModel.swift
//  Bluetooth Basics
//
//  Created by Alvin Andino on 5/17/20.
//  Copyright © 2020 Alvin Andino. All rights reserved.
//

import Foundation

struct PeripheralDetailViewModel {
    let navigationBarTitle = "Peripheral Name"
    let headerText = "Peripheral UUID"

    let serviceSectionViewModels: [ServiceSectionViewModel] = {
        let numberOfServices = 3
        return (0..<numberOfServices).map { _ in
            return ServiceSectionViewModel()
        }
    }()
}

final class ServiceSectionViewModel: Identifiable {
    let headerText = "Service Name"

    let characteristicCellViewModels: [CharacteristicCellViewModel] = {
        let numberOfCharacteristics = 3
        return (0..<numberOfCharacteristics).map { _ in
            return CharacteristicCellViewModel()
        }
    }()
}

final class CharacteristicCellViewModel: Identifiable {
    let headerText = "Characteristic Name"
    let subHeaderText = "Characteristic Value"
}
