//
//  ObjCMacro.swift
//  Syncopate
//
//  Created by Joshua Grzech on 9/5/24.
//


import Foundation
import UniformTypeIdentifiers

class ObjCMacro: NSObject, Codable, NSItemProviderReading, NSItemProviderWriting {
    static var readableTypeIdentifiersForItemProvider: [String] {
        return [UTType.macro.identifier]
    }
    
    static var writableTypeIdentifiersForItemProvider: [String] {
        return [UTType.macro.identifier]
    }
    
    static func object(withItemProviderData data: Data, typeIdentifier: String) throws -> Self {
        let decoder = JSONDecoder()
        let macro = try decoder.decode(ObjCMacro.self, from: data)
        return macro as! Self
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
    let actions: [ObjCAction]
    
    init(name: String, category: String, actions: [ObjCAction]) {
        self.name = name
        self.category = category
        self.actions = actions
        super.init()
    }
    
    static func from(_ macro: ObservableMacro) -> ObjCMacro {
        let objcActions = macro.actions.map { ObjCAction.from($0) }
        return ObjCMacro(name: macro.name, category: macro.category, actions: objcActions)
    }
    
    func toObservableMacro() -> ObservableMacro {
        let observableActions = actions.map { $0.toObservableAction() }
        return ObservableMacro(name: name, category: category, actions: observableActions)
    }
}

// Extension to UTType to include the macro type
extension UTType {
    static var macro: UTType {
        UTType(exportedAs: "com.yourapp.macro")
    }
}

// Note: Ensure that ObservableMacro, ObservableAction, and ObjCAction 
// are properly defined as per previous discussions.