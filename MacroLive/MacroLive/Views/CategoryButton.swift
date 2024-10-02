//
//  CategoryButton.swift
//  Syncopate
//
//  Created by Joshua Grzech on 8/22/24.
//
import SwiftUI

struct CategoryButton: View {
    let category: String
    @Binding var isSelected: Bool
    let color: Color

    var body: some View {
        Button {
            self.isSelected = !self.isSelected
        } label: {

            HStack {
                Text(category)
                    .font(.caption)
                Spacer()

            }
            .foregroundStyle(isSelected ? Color.white : color)
        }
        .onHover(perform: { hovered in

        })
        .buttonStyle(.plain)
        .accessibilityLabel("\(category) category")
        .accessibilityHint("Select to view actions in the \(category) category")

    }

}
