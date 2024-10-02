import Foundation
import Combine

class ConstantsManager: ObservableObject {
    static let shared = ConstantsManager()
    
    @Published private var actions: [String: [ObservableAction]] = [:]
    @Published private var macros: [String: [ObservableMacro]] = [:]
    
    private init() {
        loadConstants()
    }
    
    private func loadConstants() {
        loadActions()
        loadMacros()
    }
    
    private func loadActions() {
        for (category, categoryActions) in ActionConstants.allActions {
            let observableActions = categoryActions.compactMap { name, actionData -> ObservableAction? in
                guard let actionDict = actionData as? [String: Any] else {
                    print("Failed to cast actionData to [String: Any] for action: \(name)")
                    return nil
                }
                
                guard let parameters = createParameters(from: actionDict["parameters"] as? [[String: Any]]) else {
                    print("Failed to create parameters for action: \(name)")
                    return nil
                }
                
                return ObservableAction(name: name, category: category, parameters: parameters)
            }
            actions[category] = observableActions
        }
    }
    
    private func createParameters(from data: [[String: Any]]?) -> [Parameter]? {
        return data?.compactMap { paramData -> Parameter? in
            guard let name = paramData["name"] as? String,
                  let typeString = paramData["type"] as? String else {
                return nil
            }
            let type = Parameter.ParameterType(rawValue: typeString) ?? .string
            let initialValue = paramData["defaultValue"]
            return Parameter(name: name, type: type, initialValue: initialValue)
        }
    }
    
    private func loadMacros() {
        for (category, categoryMacros) in MacroConstants.allMacros {
            let observableMacros = categoryMacros.compactMap { name, macroActions -> ObservableMacro? in
                let observableActions = macroActions.compactMap { actionData -> ObservableAction? in
                    guard let actionName = actionData["name"] as? String,
                          let actionCategory = actionData["category"] as? String else {
                        return nil
                    }
                    return getAction(category: actionCategory, name: actionName)
                }
                return ObservableMacro(name: name, category: category, actions: observableActions)
            }
            macros[category] = observableMacros
        }
    }
    
    
    func getAction(category: String, name: String) -> ObservableAction? {
        return actions[category]?.first { $0.name == name }
    }
    
    func getMacro(category: String, name: String) -> ObservableMacro? {
        return macros[category]?.first { $0.name == name }
    }
    
    func getAllActions() -> [ObservableAction] {
        return actions.values.flatMap { $0 }
    }
    
    func getAllMacros() -> [ObservableMacro] {
        return macros.values.flatMap { $0 }
    }
    
    func addMacro(_ macro: ObservableMacro) {
        if macros[macro.category] != nil {
            macros[macro.category]?.append(macro)
        } else {
            macros[macro.category] = [macro]
        }
        objectWillChange.send()
    }
    
    func addAction(_ action: ObservableAction) {
        if actions[action.category] != nil {
            actions[action.category]?.append(action)
        } else {
            actions[action.category] = [action]
        }
        objectWillChange.send()
    }
}

// MARK: - Supporting Types

class ObservableAction: ObservableObject, Identifiable {
    let id = UUID()
    @Published var name: String
    @Published var category: String
    @Published var parameters: [Parameter]
    
    init(name: String, category: String, parameters: [Parameter]) {
        self.name = name
        self.category = category
        self.parameters = parameters
    }
}

class ObservableMacro: ObservableObject, Identifiable {
    let id = UUID()
    @Published var name: String
    @Published var category: String
    @Published var actions: [ObservableAction]
    
    init(name: String, category: String, actions: [ObservableAction]) {
        self.name = name
        self.category = category
        self.actions = actions
    }
}

class Parameter: ObservableObject, Identifiable {
    let id = UUID()
    let name: String
    let type: ParameterType
    @Published var value: Any?
    
    enum ParameterType: String {
        case string, number, boolean, array
    }
    
    init(name: String, type: ParameterType, initialValue: Any? = nil) {
        self.name = name
        self.type = type
        self.value = initialValue
    }
}
