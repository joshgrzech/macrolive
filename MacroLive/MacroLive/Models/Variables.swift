//
//  Variables.swift
//  Syncopate
//
//  Created by Joshua Grzech on 8/25/24.
//

import Combine
import SwiftUI

enum VariableType: String, CaseIterable, Codable {
    case trackIndex, sceneIndex, trackSendLetter, deviceParameter,
        deviceChainIndex, drumPadIndex, clipName, locatorName,
        timeSignature, warpMode, insertMode,
        fileName, midiMessage, noteRepeatRate, quantizeValue,
        relativeJumpValue, relativeAdjustValue, boolean, number, string,
        controlSurfaceName, deviceBank, playbackMode, slicingMode,
        slicingPlaybackMode,
        chokeGroup, launchMode, monitoringState, crossfadeAssign, none, any,
        readOnly, random, keystroke, deviceName, userDefined
}

class Variable: ObservableObject, Identifiable, Codable, Hashable {
    let id = UUID()
    var name: String
    var type: VariableType
    var value: String
    var editable: Bool

    enum CodingKeys: String, CodingKey {
        case name, type, value, editable
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)  // Use the id for uniqueness
    }

    // Implement the static `==` function required for Hashable
    static func == (lhs: Variable, rhs: Variable) -> Bool {
        return lhs.id == rhs.id
    }

    init(name: String, type: VariableType, value: String, editable: Bool) {
        self.name = name
        self.type = type
        self.value = value
        self.editable = editable
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        type = try container.decode(VariableType.self, forKey: .type)
        value = try container.decode(String.self, forKey: .value)
        editable = try container.decode(Bool.self, forKey: .editable)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(type, forKey: .type)
        try container.encode(value, forKey: .value)
        try container.encode(editable, forKey: .editable)
    }
}
