import SwiftUI
import UniformTypeIdentifiers

struct MacroBuilderActionButton: View {
    @ObservedObject var action: ObservableAction

    var body: some View {
        HStack {
            Text(action.name)
            Spacer()
            ForEach(action.parameters) { parameter in
                ParameterView(parameter: parameter, selected: false)
            }
        }
        .padding()
        .background(Color.blue.opacity(0.1))
        .cornerRadius(8)
    }
}

struct MacroBuilderView: View {
    @EnvironmentObject var constantsManager: ConstantsManager
    @ObservedObject var macro: ObservableMacro

    var body: some View {
        VStack {
            TextField("Macro Name", text: $macro.name)
                .padding()

            List {
                Section {
                    if macro.actions.isEmpty {
                        EmptyDropTarget()
                    }

                    ForEach(macro.actions) { action in
                        MacroBuilderActionButton(action: action)
                    }
                    .onDelete(perform: deleteAction)
                }
            }
            .onDrop(
                of: [UTType.action, UTType.macro],
                delegate: MacroDropDelegate(macro: macro, onDrop: addAction))

            NewMacroButton()
        }
    }

    private func addAction(_ action: ObservableAction) {
        macro.actions.append(action)
    }

    private func deleteAction(at offsets: IndexSet) {
        macro.actions.remove(atOffsets: offsets)
    }
}

extension UTType {
    static var action: UTType {
        UTType(exportedAs: "com.joshgrzech.syncopate.action")
    }
}

extension NSItemProvider {
    func loadObjCAction(completion: @escaping (ObjCAction?, Error?) -> Void) {
        self.loadObject(
            ofClass: NSDictionary.self as! any NSItemProviderReading.Type
        ) { dict, error in
            guard let dict = dict as? [String: Any] else {
                completion(nil, error)
                return
            }

            do {
                let data = try JSONSerialization.data(
                    withJSONObject: dict, options: [])
                let objcAction = try JSONDecoder().decode(
                    ObjCAction.self, from: data)
                completion(objcAction, nil)
            } catch {
                completion(nil, error)
            }
        }
    }
}

struct MacroDropDelegate: DropDelegate {
    @ObservedObject var macro: ObservableMacro
    let onDrop: (ObservableAction) -> Void

    func performDrop(info: DropInfo) -> Bool {
        let itemProviders = info.itemProviders(for: [
            UTType.action, UTType.macro,
        ])
        for itemProvider in itemProviders {
            itemProvider.loadObjCAction { objcAction, error in
                if let objcAction = objcAction {
                    DispatchQueue.main.async {
                        let action = objcAction.toObservableAction()
                        onDrop(action)
                    }
                }
            }
            return true
        }
        return false
    }

    func validateDrop(info: DropInfo) -> Bool {
        return info.hasItemsConforming(to: [UTType.action, UTType.macro])
    }
}

// MARK: - Supporting Views

struct EmptyDropTarget: View {
    var body: some View {
        Rectangle()
            .fill(Color.gray.opacity(0.2))
            .frame(height: 60)
            .overlay(Text("Drop Action or Macro Here"))
    }
}

struct NewMacroButton: View {
    @EnvironmentObject var constantsManager: ConstantsManager

    var body: some View {
        Button(action: {
            let newMacro = ObservableMacro(
                name: "New Macro", category: "Custom", actions: [])
            constantsManager.addMacro(newMacro)
        }) {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.green.opacity(0.5))
                .overlay {
                    VStack {
                        Image(systemName: "plus.circle.fill")
                        Text("Create New Macro")
                    }
                }
                .frame(height: 40)
        }
        .buttonStyle(.plain)
        .padding()
    }
}
