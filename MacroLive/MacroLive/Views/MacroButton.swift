import SwiftUI

struct MacroButton: View {
    @ObservedObject var content: ObservableMacro
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Text(content.name)
                    .lineLimit(1)
                    .truncationMode(.middle)
                Spacer()
                Image(systemName: "eye.fill")
            }
        }
        .buttonStyle(MacroButtonStyle())
        .onDrag {
            let objcMacro = ObjCMacro.from(content)
            let provider = NSItemProvider(object: objcMacro)
            provider.suggestedName = content.name
            return provider
        }
    }
}

struct MacroButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(10)
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
}
