//
//  DetailView.swift
//  Syncopate
//
//  Created by Joshua Grzech on 8/28/24.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var viewModel: ContentViewModel

    var body: some View {
        VStack {
            if let selectedAction = viewModel.selectedAction {
                ActionDetailView(
                    action: selectedAction,
                    selectedParameter: Binding(
                        get: {
                            return viewModel.selectedAction!.parameters.first
                        },
                        set: { val in

                        }))
            } else {
                PlaceholderView(
                    text: "Select an action or macro to view its details.")
            }
        }

    }

}
