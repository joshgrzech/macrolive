import SwiftUI

// ActionButton View

// Updated MacroDetailView
struct MacroDetailView: View {
    @EnvironmentObject var viewModel: ContentViewModel
    @ObservedObject var macro: ObservableMacro

    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            // Title and Category Section
            Section {
                Text(macro.name)
                    .font(.title2)
                    .fontWeight(.bold)
            }

            // Actions Section with ActionButtons
            Section(header: Text("Actions").font(.title3).fontWeight(.bold)) {
                ForEach(macro.actions) { macroAction in
                    HStack {
                        ActionButton(
                            action: {
                            },
                            content: macroAction
                        )

                    }

                }
            }
        }
        .padding()
        .listStyle(SidebarListStyle())

    }

}
