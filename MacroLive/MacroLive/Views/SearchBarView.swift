//
//  SearchBarView.swift
//  Syncopate
//
//  Created by Joshua Grzech on 8/22/24.
//
import SwiftUI

struct SearchBarView: View {
    @Binding var searchQuery: String

    var body: some View {
        HStack {

            TextField("Search", text: $searchQuery)
                .textFieldStyle(PlainTextFieldStyle())
                .padding(8)
                .background(Color(.systemGray))
                .cornerRadius(8)
            
        }
        .frame(maxWidth: .infinity)

    }

}

