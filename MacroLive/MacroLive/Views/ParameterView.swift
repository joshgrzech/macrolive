//
//  ParameterView.swift
//  Syncopate
//
//  Created by Joshua Grzech on 9/5/24.
//
import SwiftUI

struct ParameterView: View {
    @ObservedObject var parameter: Parameter
    let selected: Bool

    var body: some View {
        HStack {
            Text(parameter.name)
            Spacer()
            parameterValueView
        }
        .padding()
        .background(selected ? Color.blue.opacity(0.2) : Color.clear)
        .cornerRadius(8)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(selected ? Color.blue : Color.gray, lineWidth: 1)
        )
    }

    @ViewBuilder
    private var parameterValueView: some View {
        switch parameter.type {
        case .string:
            TextField(
                "Enter value",
                text: Binding(
                    get: { self.parameter.value as? String ?? "" },
                    set: { self.parameter.value = $0 }
                ))
        case .number:
            TextField(
                "Enter number",
                text: Binding(
                    get: { self.parameter.value.map { "\($0)" } ?? "" },
                    set: {
                        if let value = Double($0) {
                            self.parameter.value = value
                        }
                    }
                ))
        case .boolean:
            Toggle(
                "",
                isOn: Binding(
                    get: { self.parameter.value as? Bool ?? false },
                    set: { self.parameter.value = $0 }
                ))
        case .array:
            Text("Array editor not implemented")
        }
    }
}
