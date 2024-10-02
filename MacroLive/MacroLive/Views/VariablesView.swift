import SwiftUI

public struct VariablesView: View {
    @ObservedObject var action: ObservableAction
    @Binding var selection: Parameter?

    public var body: some View {
        Group {
            if action.parameters.count > 2 {
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3)) {
                    parameterButtons
                }
            } else {
                HStack(alignment: .center) {
                    parameterButtons
                }
            }
        }
    }
    
    private var parameterButtons: some View {
        ForEach(action.parameters) { parameter in
            Button {
                selection = parameter
            } label: {
                ParameterView(
                    parameter: parameter,
                    selected: selection?.id == parameter.id
                )
                .frame(height: 40)
            }
            .buttonStyle(.plain)
        }
    }
}
