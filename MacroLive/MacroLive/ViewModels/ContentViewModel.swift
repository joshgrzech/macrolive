import Combine
import Foundation
import SwiftUI

/// ViewModel for managing the main content of the application
class ContentViewModel: ObservableObject {
    @Published var actions = ConstantsManager.shared.getAllActions()
    @Published var macros = ConstantsManager.shared.getAllMacros()
    @Published var selectedCategory: String?
    @Published var selectedMacroCategory: String?
    @Published var selectedAction: ObservableAction?
    @Published var selectedMacro = ObservableMacro(name: "", category: "", actions: [])

    var allCategories: [Category] {
        actions.map { Category(name: $0.name, type: .action) }
            + macros.map { Category(name: $0.name, type: .macro) }
    }

    func isSelected(category: Category) -> Bool {
        switch category.type {
        case .macro:
            return selectedMacroCategory == category.name
        case .action:
            return selectedCategory == category.name
        }
    }

    func selectCategory(category: Category, isSelected: Bool) {
        switch category.type {
        case .macro:
            selectedMacroCategory = isSelected ? category.name : nil
            selectedCategory = nil
            selectedAction = nil
        case .action:
            selectedCategory = isSelected ? category.name : nil
            selectedMacroCategory = nil

        }
    }

    func newMacro() {
        self.selectedMacro = ObservableMacro(name: "", category: "", actions: [])
    }
}
enum CategoryType {
    case macro, action
}

struct Category: Identifiable {
    let id = UUID()
    let name: String
    let type: CategoryType
}
