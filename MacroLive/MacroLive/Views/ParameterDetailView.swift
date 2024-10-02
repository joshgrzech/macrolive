//
//  ParameterDetailView.swift
//  Syncopate
//
//  Created by Joshua Grzech on 9/5/24.
//
import SwiftUI

struct ParameterDetailView: View {
    @ObservedObject var parameter: Parameter

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Selected Parameter: \(parameter.name)")
                .font(.headline)

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
                    parameter.name,
                    isOn: Binding(
                        get: { self.parameter.value as? Bool ?? false },
                        set: { self.parameter.value = $0 }
                    ))
            case .array:
                Text("Array editor not implemented")
            }
        }
    }
}
