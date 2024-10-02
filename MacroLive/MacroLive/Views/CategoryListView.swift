import SwiftUI

struct CategoryListView: View {
    @EnvironmentObject var viewModel: ContentViewModel

    var body: some View {
        Group {
            if let selectedCategory = viewModel.selectedCategory {
                actionList(for: selectedCategory)
            } else if let selectedMacroCategory = viewModel
                .selectedMacroCategory
            {
                macroList(for: selectedMacroCategory)
            } else {
                PlaceholderView(
                    text:
                        "Select a category to view its available actions or macros"
                )
            }
        }
        .listStyle(SidebarListStyle())
    }

    private func actionList(for category: String) -> some View {
        List {
            ForEach(viewModel.actions.filter { $0.category == category }) {
                action in
                ActionButton(
                    action: {
                        viewModel.selectedAction = action
                    },
                    content: action
                )
            }
        }
    }

    private func macroList(for category: String) -> some View {
        List {
            ForEach(viewModel.macros.filter { $0.category == category }) {
                macro in
                MacroButton(
                    content: macro,
                    action: {
                        viewModel.selectedMacro = macro
                    }
                )
            }
        }
    }
}
