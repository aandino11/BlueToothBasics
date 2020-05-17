//
//  WriteValueView.swift
//  Bluetooth Basics
//
//  Created by Alvin Andino on 5/16/20.
//  Copyright © 2020 Alvin Andino. All rights reserved.
//

import SwiftUI

struct WriteValueView: View {
    @Environment(\.presentationMode) var presentation
    let onWriteValue: (Int) -> ()

    @State private var writtenInt: Int? {
        didSet {
            print("\(String(describing: writtenInt))")
        }
    }

    // Textfield does not set number value with formatter.
    // This is a work around.
    private var hexNumberProxy: Binding<String> {
        Binding<String>(
            get: { "" },
            set: {
                let value = HexNumberFormatter().number(from: $0)
                self.writtenInt = value as? Int
            }
        )
    }

    var body: some View {
        VStack(alignment: .center) {
            Text("Hex")
                .font(.callout)
                .bold()
            TextField(
                "Value to write...",
                text: hexNumberProxy
            ) {
                if let writtenInt =  self.writtenInt {
                    self.onWriteValue(writtenInt)
                    self.presentation.wrappedValue.dismiss()
                }
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .frame(width: 200)
            Spacer()
        }
    }
}

struct WriteValueView_Previews: PreviewProvider {
    static var previews: some View {
        WriteValueView(onWriteValue: { _ in })
    }
}

private final class HexNumberFormatter: NumberFormatter {
    override func number(from string: String) -> NSNumber? {
        guard let num = Int(string, radix: 16) else {
            return nil
        }
        return NSNumber(value: num)
    }
}
