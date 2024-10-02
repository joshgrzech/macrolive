//
//  MacroBuilderAction.swift
//  Syncopate
//
//  Created by Joshua Grzech on 9/5/24.
//

import Foundation


class MacroBuilderAction: NSObject, ObservableObject, Identifiable  {
    let id = UUID()
    @Published var action: ObservableAction
    @Published var argument: Parameter?

    init(action: ObservableAction) {
        self.action = action
        self.argument = action.parameters.first
    }


}
