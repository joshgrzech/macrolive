import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()

    var body: some View {
        HSplitView {
            ToolbarView()
                .frame(width: 150)

            HSplitView {

                CategoryListView()
                    .frame(width: 300)

                HSplitView {
                    VSplitView {
                        MacroBuilderView(macro: viewModel.selectedMacro)
                        HStack {
                            PlaceholderView(text: "Workspace")
                        }
                    }
                    DetailView()
                        .frame(width: 300)
                }
                .frame(minHeight: NSScreen.main!.frame.height - 500)

            }
        }
        .environmentObject(viewModel)
        .environmentObject(ConstantsManager.shared)
        .navigationTitle("Syncopate")

    }

}

#Preview {
    ContentView()
}
