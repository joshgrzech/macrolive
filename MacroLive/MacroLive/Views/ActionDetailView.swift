//
//  ActionDetailView.swift
//  Syncopate
//
//  Created by Joshua Grzech on 9/5/24.
//

import SwiftUI

struct ActionDetailView: View {
    @ObservedObject var action: ObservableAction
    @Binding var selectedParameter: Parameter?

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(action.name)
                .font(.title)
                .fontWeight(.bold)

            Text("Category: \(action.category)")
                .font(.subheadline)

            Text("Parameters:")
                .font(.headline)

            VariablesView(action: action, selection: $selectedParameter)

            if let selectedParameter = selectedParameter {
                ParameterDetailView(parameter: selectedParameter)
            }
        }
        .padding()
    }
}
