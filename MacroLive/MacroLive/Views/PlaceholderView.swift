//
//  PlaceholderView.swift
//  Syncopate
//
//  Created by Joshua Grzech on 8/22/24.
//
import SwiftUI

struct PlaceholderView: View {
    let text: String
    var body: some View {
        VStack {
            Spacer()
            Text(text)
                .italic()
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)

    }

}
