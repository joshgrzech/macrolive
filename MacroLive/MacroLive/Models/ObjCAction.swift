import Foundation
import UniformTypeIdentifiers
class ObjCAction: NSObject, Codable, NSItemProviderReading, NSItemProviderWriting {
    static var readableTypeIdentifiersForItemProvider: [String] {
        return [UTType.action.identifier]
    }
    
    static var writableTypeIdentifiersForItemProvider: [String] {
        return [UTType.action.identifier]
    }
    
    static func object(withItemProviderData data: Data, typeIdentifier: String) throws -> Self {
        let decoder = JSONDecoder()
        let action = try decoder.decode(ObjCAction.self, from: data)
        return action as! Self
    }
    
    func loadData(withTypeIdentifier typeIdentifier: String, forItemProviderCompletionHandler completionHandler: @escaping (Data?, Error?) -> Void) -> Progress? {
        do {
            let data = try JSONEncoder().encode(self)
            completionHandler(data, nil)
        } catch {
            completionHandler(nil, error)
        }
        return nil
    }
    
    let name: String
    let category: String
    let parameterNames: [String]
    let parameterValues: [String]
    
    init(name: String, category: String, parameterNames: [String], parameterValues: [String]) {
        self.name = name
        self.category = category
        self.parameterNames = parameterNames
        self.parameterValues = parameterValues
        super.init()
    }
    
    static func from(_ action: ObservableAction) -> ObjCAction {
        ObjCAction(
            name: action.name,
            category: action.category,
            parameterNames: action.parameters.map { $0.name },
            parameterValues: action.parameters.map { "\($0.value ?? "")" }
        )
    }
    
    func toObservableAction() -> ObservableAction {
        let parameters = zip(parameterNames, parameterValues).map { name, value in
            Parameter(name: name, type: .string, initialValue: value)
        }
        return ObservableAction(name: name, category: category, parameters: parameters)
    }
}
