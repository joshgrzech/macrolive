import SwiftUI

struct ToolbarView: View {
    @EnvironmentObject var viewModel: ContentViewModel

    var body: some View {
        List {
            // Combined Categories
            ForEach(viewModel.allCategories, id: \.id) { category in
                CategoryButton(
                    category: category.name,
                    isSelected: Binding(
                        get: { viewModel.isSelected(category: category) },
                        set: {
                            viewModel.selectCategory(
                                category: category, isSelected: $0)
                        }
                    ),
                    color: category.type == .macro ? Color.orange : Color.blue
                )
            }
        }
        .listStyle(SidebarListStyle())

    }

}
