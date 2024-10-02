import SwiftUI
import UniformTypeIdentifiers

struct ActionButton: View {
    let action: () -> Void
    @ObservedObject var content: ObservableAction

    var body: some View {
        Button(action: action) {
            HStack {
                Text(formattedActionName)
                    .lineLimit(1)
                    .truncationMode(.middle)
                Spacer()
                Image(systemName: "eye.fill")
            }
        }
        .buttonStyle(ActionButtonStyle())
        .onDrag {
            let objcAction = ObjCAction.from(content)
            let provider = NSItemProvider(object: objcAction)
            provider.suggestedName = content.name
            return provider
        }
    }

    private var formattedActionName: String {
        content.name
            .replacingOccurrences(
                of:
                    "/clyphx/\(content.category.replacingOccurrences(of: " ", with: "_").lowercased())",
                with: " "
            )
            .replacingOccurrences(of: "/clyphx/", with: "")
            .capitalized
            .replacingOccurrences(of: " _", with: "")
            .replacingOccurrences(of: "_", with: " ")
    }
}

struct ActionButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
}
