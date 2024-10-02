//
//  ActionConstants.swift
//  Syncopate
//
//  Created by Joshua Grzech on 8/25/24.
//

// MARK: - Action Constants
@propertyWrapper
struct LazyConstant<T> {
    private let initializer: () -> T
    private var storage: T?
    
    init(wrappedValue: @autoclosure @escaping () -> T) {
        self.initializer = wrappedValue
    }
    
    var wrappedValue: T {
        mutating get {
            if storage == nil {
                storage = initializer()
            }
            return storage!
        }
    }
}

struct ActionConstants {
    static func getAction(category: String, name: String) -> [String: Any]? {
        return allActions[category]?[name]
    }
    static let allActions: [String: [String: [String: Any]]] = [
        "Chain": [
            "/clyphx/chain_choke": [
                "description": "Adjust Drum Rack Chain Choke Group.",
                "parameters": [
                    [
                        "name": "Choke Group",
                        "type": "chokeGroup",
                        "isRequired": true,
                        "allowsRelative": true,
                        "supportedKeywords": ["<", ">"],
                    ]
                ],
                "variations": [
                    [
                        "mapping": "CHOKE",
                        "parameters": ["Choke Group"],
                    ],
                    [
                        "mapping": "CHOKE <",
                        "parameters": [],
                    ],
                    [
                        "mapping": "CHOKE >",
                        "parameters": [],
                    ],
                ],
            ],
            "/clyphx/chain_color": [
                "description": "Set the color of the Chain.",
                "parameters": [
                    [
                        "name": "Color Index",
                        "type": "number",
                        "isRequired": true,
                        "allowsRelative": true,
                        "supportedKeywords": ["<", ">"],
                    ]
                ],
                "variations": [
                    [
                        "mapping": "COLOR",
                        "parameters": ["Color Index"],
                    ],
                    [
                        "mapping": "COLOR <",
                        "parameters": [],
                    ],
                    [
                        "mapping": "COLOR >",
                        "parameters": [],
                    ],
                ],
            ],
            "/clyphx/chain_mute": [
                "description": "Toggle Chain Mute.",
                "parameters": [],
                "variations": [
                    [
                        "mapping": "MUTE",
                        "parameters": [],
                    ]
                ],
            ],
            "/clyphx/chain_note": [
                "description":
                    "Adjust Drum Rack Chain Out Note (in the range of 0 - 127) allowing for transposition.",
                "parameters": [
                    [
                        "name": "Note Value",
                        "type": "number",
                        "isRequired": true,
                        "allowsRelative": true,
                        "supportedKeywords": [],
                    ]
                ],
                "variations": [
                    [
                        "mapping": "NOTE",
                        "parameters": ["Note Value"],
                    ]
                ],
            ],
            "/clyphx/chain_pan": [
                "description": "Adjust Chain Pan.",
                "parameters": [
                    [
                        "name": "Pan Value",
                        "type": "number",
                        "isRequired": true,
                        "allowsRelative": true,
                        "supportedKeywords": [],
                    ]
                ],
                "variations": [
                    [
                        "mapping": "PAN",
                        "parameters": ["Pan Value"],
                    ]
                ],
            ],
            "/clyphx/chain_send": [
                "description": "Adjust Chain Send.",
                "parameters": [
                    [
                        "name": "Send Letter",
                        "type": "trackSendLetter",
                        "isRequired": true,
                        "allowsRelative": false,
                        "supportedKeywords": ["ALL"],
                    ],
                    [
                        "name": "Send Value",
                        "type": "number",
                        "isRequired": true,
                        "allowsRelative": true,
                        "supportedKeywords": [],
                    ],
                ],
                "variations": [
                    [
                        "mapping": "SEND",
                        "parameters": ["Send Letter", "Send Value"],
                    ]
                ],
            ],
            "/clyphx/chain_solo": [
                "description": "Toggle Chain Solo.",
                "parameters": [],
                "variations": [
                    [
                        "mapping": "SOLO",
                        "parameters": [],
                    ]
                ],
            ],
            "/clyphx/chain_volume": [
                "description": "Adjust Chain Volume.",
                "parameters": [
                    [
                        "name": "Volume Value",
                        "type": "number",
                        "isRequired": true,
                        "allowsRelative": true,
                        "supportedKeywords": [],
                    ]
                ],
                "variations": [
                    [
                        "mapping": "VOL",
                        "parameters": ["Volume Value"],
                    ]
                ],
            ],
        ],
        "Clip": [
            "/clyphx/clip_action": [
                "description": "Perform an action on a clip.",
                "parameters": [
                    [
                        "name": "Detune Value",
                        "type": "number",
                        "isRequired": false,
                        "allowsRelative": true,
                        "supportedKeywords": [],
                    ],
                    [
                        "name": "Duplicate Count",
                        "type": "number",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ],
                    [
                        "name": "Color Index",
                        "type": "number",
                        "isRequired": false,
                        "allowsRelative": true,
                        "supportedKeywords": ["<", ">"],
                    ],
                    [
                        "name": "Clip End",
                        "type": "number",
                        "isRequired": false,
                        "allowsRelative": true,
                        "supportedKeywords": ["<", ">"],
                    ],
                    [
                        "name": "Gain Value",
                        "type": "number",
                        "isRequired": false,
                        "allowsRelative": true,
                        "supportedKeywords": [],
                    ],
                    [
                        "name": "Grid Value",
                        "type": "quantizeValue",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": ["OFF"],
                    ],
                    [
                        "name": "Launch Mode",
                        "type": "launchMode",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ],
                    [
                        "name": "Launch Quantize",
                        "type": "quantizeValue",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": ["GLOBAL"],
                    ],
                    [
                        "name": "Clip Name",
                        "type": "clipName",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ],
                    [
                        "name": "Append String",
                        "type": "string",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ],
                    [
                        "name": "Prepend String",
                        "type": "string",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ],
                    [
                        "name": "Identifier",
                        "type": "string",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ],
                    [
                        "name": "Quantize Value",
                        "type": "quantizeValue",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ],
                    [
                        "name": "Quantize Strength",
                        "type": "number",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ],
                    [
                        "name": "Quantize Swing",
                        "type": "number",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ],
                    [
                        "name": "Pitch Range",
                        "type": "string",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ],
                    [
                        "name": "Transpose Value",
                        "type": "number",
                        "isRequired": false,
                        "allowsRelative": true,
                        "supportedKeywords": [],
                    ],
                    [
                        "name": "Time Signature",
                        "type": "timeSignature",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ],
                    [
                        "name": "Segment Length",
                        "type": "number",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ],
                    [
                        "name": "Clip Start",
                        "type": "number",
                        "isRequired": false,
                        "allowsRelative": true,
                        "supportedKeywords": ["<", ">"],
                    ],
                    [
                        "name": "Arrangement Position",
                        "type": "number",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ],
                    [
                        "name": "Conversion Type",
                        "type": "string",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": ["DRUMS", "HARMONY", "MELODY"],
                    ],
                    [
                        "name": "Warp Mode",
                        "type": "warpMode",
                        "isRequired": false,
                        "allowsRelative": true,
                        "supportedKeywords": ["<", ">"],
                    ],
                    [
                        "name": "Velocity Amount",
                        "type": "number",
                        "isRequired": false,
                        "allowsRelative": true,
                        "supportedKeywords": [],
                    ],
                ],
                "variations": [
                    [
                        "mapping": "CENT",
                        "parameters": ["Detune Value"],
                    ],
                    [
                        "mapping": "CHOP",
                        "parameters": [],
                    ],
                    [
                        "mapping": "CHOP",
                        "parameters": ["Duplicate Count"],
                    ],
                    [
                        "mapping": "COLOR",
                        "parameters": ["Color Index"],
                    ],
                    [
                        "mapping": "COLOR <",
                        "parameters": [],
                    ],
                    [
                        "mapping": "COLOR >",
                        "parameters": [],
                    ],
                    [
                        "mapping": "COLOR ASCOL",
                        "parameters": [],
                    ],
                    [
                        "mapping": "COLOR ASROW",
                        "parameters": [],
                    ],
                    [
                        "mapping": "CROP",
                        "parameters": [],
                    ],
                    [
                        "mapping": "DEL",
                        "parameters": [],
                    ],
                    [
                        "mapping": "DUPE",
                        "parameters": [],
                    ],
                    [
                        "mapping": "END",
                        "parameters": ["Clip End"],
                    ],
                    [
                        "mapping": "END <",
                        "parameters": [],
                    ],
                    [
                        "mapping": "END >",
                        "parameters": [],
                    ],
                    [
                        "mapping": "END <x",
                        "parameters": ["Clip End"],
                    ],
                    [
                        "mapping": "END >x",
                        "parameters": ["Clip End"],
                    ],
                    [
                        "mapping": "EXTEND",
                        "parameters": [],
                    ],
                    [
                        "mapping": "GAIN",
                        "parameters": ["Gain Value"],
                    ],
                    [
                        "mapping": "GRID",
                        "parameters": ["Grid Value"],
                    ],
                    [
                        "mapping": "LEGATO",
                        "parameters": [],
                    ],
                    [
                        "mapping": "LMODE",
                        "parameters": ["Launch Mode"],
                    ],
                    [
                        "mapping": "LQ",
                        "parameters": ["Launch Quantize"],
                    ],
                    [
                        "mapping": "MUTE",
                        "parameters": [],
                    ],
                    [
                        "mapping": "NAME",
                        "parameters": ["Clip Name"],
                    ],
                    [
                        "mapping": "NAMEA",
                        "parameters": ["Append String"],
                    ],
                    [
                        "mapping": "NAMEP",
                        "parameters": ["Prepend String"],
                    ],
                    [
                        "mapping": "NAMED",
                        "parameters": ["Identifier", "Clip Name"],
                    ],
                    [
                        "mapping": "NAMES",
                        "parameters": ["Clip Name"],
                    ],
                    [
                        "mapping": "QNTZ",
                        "parameters": ["Quantize Value"],
                    ],
                    [
                        "mapping": "QNTZ",
                        "parameters": ["Quantize Value", "Quantize Strength"],
                    ],
                    [
                        "mapping": "QNTZ",
                        "parameters": [
                            "Quantize Value", "Quantize Strength",
                            "Quantize Swing",
                        ],
                    ],
                    [
                        "mapping": "QNTZ",
                        "parameters": ["Pitch Range", "Quantize Value"],
                    ],
                    [
                        "mapping": "QNTZ",
                        "parameters": [
                            "Pitch Range", "Quantize Value",
                            "Quantize Strength",
                        ],
                    ],
                    [
                        "mapping": "QNTZ",
                        "parameters": [
                            "Pitch Range", "Quantize Value",
                            "Quantize Strength",
                            "Quantize Swing",
                        ],
                    ],
                    [
                        "mapping": "RAM",
                        "parameters": [],
                    ],
                    [
                        "mapping": "SEMI",
                        "parameters": ["Transpose Value"],
                    ],
                    [
                        "mapping": "SIG",
                        "parameters": ["Time Signature"],
                    ],
                    [
                        "mapping": "SPLIT",
                        "parameters": ["Segment Length"],
                    ],
                    [
                        "mapping": "START",
                        "parameters": ["Clip Start"],
                    ],
                    [
                        "mapping": "START <x",
                        "parameters": ["Clip Start"],
                    ],
                    [
                        "mapping": "START >x",
                        "parameters": ["Clip Start"],
                    ],
                    [
                        "mapping": "TOARR",
                        "parameters": ["Arrangement Position"],
                    ],
                    [
                        "mapping": "TODR",
                        "parameters": [],
                    ],
                    [
                        "mapping": "TOMIDI",
                        "parameters": ["Conversion Type"],
                    ],
                    [
                        "mapping": "TOSIMP",
                        "parameters": [],
                    ],
                    [
                        "mapping": "TGRID",
                        "parameters": [],
                    ],
                    [
                        "mapping": "WARP",
                        "parameters": [],
                    ],
                    [
                        "mapping": "WARPMODE",
                        "parameters": ["Warp Mode"],
                    ],
                    [
                        "mapping": "WARPMODE <",
                        "parameters": [],
                    ],
                    [
                        "mapping": "WARPMODE >",
                        "parameters": [],
                    ],
                    [
                        "mapping": "VELOCITY",
                        "parameters": ["Velocity Amount"],
                    ],
                ],
            ],
            "/clyphx/add_clip": [
                "description": "Create a MIDI Clip.",
                "parameters": [
                    [
                        "name": "Scene Index",
                        "type": "sceneIndex",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": ["SEL", "LAST", "EMPTY"],
                    ],
                    [
                        "name": "Clip Length",
                        "type": "number",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ],
                ],
                "standalone": false,
                "track_based": true,
                "variations": [
                    [
                        "mapping": "ADDCLIP",
                        "parameters": [],
                    ],
                    [
                        "mapping": "ADDCLIP",
                        "parameters": ["Scene Index"],
                    ],
                    [
                        "mapping": "ADDCLIP",
                        "parameters": ["Scene Index", "Clip Length"],
                    ],
                ],
            ],
            "/clyphx/copy_clip": [
                "description":
                    "Copy the Clip playing on the Track for use with the PASTECLIP Action.",
                "parameters": [
                    [
                        "name": "Scene Index",
                        "type": "sceneIndex",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": ["SEL", "LAST"],
                    ]
                ],
                "standalone": false,
                "track_based": true,
                "variations": [
                    [
                        "mapping": "COPYCLIP",
                        "parameters": [],
                    ],
                    [
                        "mapping": "COPYCLIP",
                        "parameters": ["Scene Index"],
                    ],
                ],
            ],
            "/clyphx/paste_clip": [
                "description":
                    "Paste the copied Clip into the specified Clip Slot on the Track.",
                "parameters": [
                    [
                        "name": "Scene Index",
                        "type": "sceneIndex",
                        "isRequired": true,
                        "allowsRelative": false,
                        "supportedKeywords": ["SEL", "LAST", "EMPTY"],
                    ]
                ],
                "standalone": false,
                "track_based": true,
                "variations": [
                    [
                        "mapping": "PASTECLIP",
                        "parameters": ["Scene Index"],
                    ]
                ],
            ],
            "/clyphx/paste_clip_empty": [
                "description":
                    "Paste the copied Clip into the first empty Clip Slot on the Track.",
                "parameters": [
                    [
                        "name": "Scene Index",
                        "type": "sceneIndex",
                        "isRequired": true,
                        "allowsRelative": false,
                        "supportedKeywords": ["LAST"],
                    ]
                ],
                "standalone": false,
                "track_based": true,
                "variations": [
                    [
                        "mapping": "PASTECLIPE",
                        "parameters": ["Scene Index"],
                    ]
                ],
            ],
        ],
        "Global": [
            "/clyphx/add_audio_track": [
                "description": "Create an Audio Track.",
                "parameters": [
                    [
                        "name": "Track Index",
                        "type": "trackIndex",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "ADDAUDIO",
                        "parameters": [],
                    ],
                    [
                        "mapping": "ADDAUDIO",
                        "parameters": ["Track Index"],
                    ],
                ],
            ],
            "/clyphx/add_midi_track": [
                "description": "Create a MIDI Track.",
                "parameters": [
                    [
                        "name": "Track Index",
                        "type": "trackIndex",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "ADDMIDI",
                        "parameters": [],
                    ],
                    [
                        "mapping": "ADDMIDI",
                        "parameters": ["Track Index"],
                    ],
                ],
            ],
            "/clyphx/add_return_track": [
                "description":
                    "Create a Return Track at the end of the Return list.",
                "parameters": [],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "ADDRETURN",
                        "parameters": [],
                    ]
                ],
            ],
            "/clyphx/back_to_arranger": [
                "description": "Switch to Arrangement View.",
                "parameters": [],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "B2A",
                        "parameters": [],
                    ]
                ],
            ],
            "/clyphx/bind": [
                "description": "Bind a control.",
                "parameters": [
                    [
                        "name": "Control Name",
                        "type": "string",
                        "isRequired": true,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ],
                    [
                        "name": "Action",
                        "type": "string",
                        "isRequired": true,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ],
                    [
                        "name": "Relative Direction",
                        "type": "string",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": ["<", ">", "<x", ">x"],
                    ],
                ],
                "standalone": true,
                "requires_accessory": "ClyphX Pro Bindings",
                "variations": [
                    [
                        "mapping": "BIND",
                        "parameters": ["Control Name", "Action"],
                    ],
                    [
                        "mapping": "BIND",
                        "parameters": ["Control Name", "Relative Direction"],
                    ],
                    [
                        "mapping": "BIND",
                        "parameters": ["Control Name", "Relative Direction"],
                    ],
                ],
            ],
            "/clyphx/boundp": [
                "description":
                    "Adjust the value of the last parameter that was adjusted via the Bindings Accessory. This is a Continuous Parameter.",
                "parameters": [
                    [
                        "name": "Parameter Value",
                        "type": "number",
                        "isRequired": true,
                        "allowsRelative": true,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": true,
                "requires_accessory": "ClyphX Pro Bindings",
                "variations": [
                    [
                        "mapping": "BOUNDP",
                        "parameters": ["Parameter Value"],
                    ]
                ],
            ],
            "/clyphx/adjust_tempo": [
                "description": "Adjust Tempo.",
                "parameters": [
                    [
                        "name": "Tempo",
                        "type": "number",
                        "isRequired": true,
                        "allowsRelative": true,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "BPM",
                        "parameters": ["Tempo"],
                    ]
                ],
            ],
            "/clyphx/capture_midi": [
                "description": "Trigger Capture MIDI.",
                "parameters": [],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "CAP",
                        "parameters": [],
                    ]
                ],
            ],
            "/clyphx/draw_mode": [
                "description": "Toggle Draw Mode.",
                "parameters": [
                    [
                        "name": "Draw Mode State",
                        "type": "boolean",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "DRAW",
                        "parameters": [],
                    ],
                    [
                        "mapping": "DRAW ON",
                        "parameters": [],
                    ],
                    [
                        "mapping": "DRAW OFF",
                        "parameters": [],
                    ],
                ],
            ],
            "/clyphx/follow_song": [
                "description": "Toggle Follow.",
                "parameters": [
                    [
                        "name": "Follow State",
                        "type": "boolean",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "FOLLOW",
                        "parameters": [],
                    ],
                    [
                        "mapping": "FOLLOW ON",
                        "parameters": [],
                    ],
                    [
                        "mapping": "FOLLOW OFF",
                        "parameters": [],
                    ],
                ],
            ],
            "/clyphx/full_velocity": [
                "description":
                    "Toggle Full Velocity. When on, notes sent from the controller selected as the Input of the ClyphX Pro Control Surface will have full velocity (127).",
                "parameters": [
                    [
                        "name": "Full Velocity State",
                        "type": "boolean",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "FULLVELO",
                        "parameters": [],
                    ],
                    [
                        "mapping": "FULLVELO ON",
                        "parameters": [],
                    ],
                    [
                        "mapping": "FULLVELO OFF",
                        "parameters": [],
                    ],
                ],
            ],
            "/clyphx/adjust_global_quantize": [
                "description": "Adjust Global Quantization.",
                "parameters": [
                    [
                        "name": "Quantize Value",
                        "type": "quantizeValue",
                        "isRequired": false,
                        "allowsRelative": true,
                        "supportedKeywords": ["NONE"],
                    ]
                ],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "GQ",
                        "parameters": [],
                    ],
                    [
                        "mapping": "GQ",
                        "parameters": ["Quantize Value"],
                    ],
                    [
                        "mapping": "GQ >",
                        "parameters": [],
                    ],
                ],
            ],
            "/clyphx/adjust_groove": [
                "description": "Adjust Global Groove Amount.",
                "parameters": [
                    [
                        "name": "Groove Amount",
                        "type": "number",
                        "isRequired": true,
                        "allowsRelative": true,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "GRV",
                        "parameters": ["Groove Amount"],
                    ]
                ],
            ],
            "/clyphx/insert_audio_track": [
                "description":
                    "Insert an Audio Track to the right of the selected Track that will be armed and routed from the selected Track. This will not perform an insertion if the selected Track is not the correct type. For example, if the selected Track doesn't have Audio output, INSAUDIO will do nothing.",
                "parameters": [],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "INSAUDIO",
                        "parameters": [],
                    ]
                ],
            ],
            "/clyphx/insert_midi_track": [
                "description":
                    "Insert a MIDI Track to the right of the selected Track that will be armed and routed from the selected Track. This will not perform an insertion if the selected Track is not the correct type. For example, if the selected Track doesn't have MIDI output, INSMIDI will do nothing.",
                "parameters": [],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "INSMIDI",
                        "parameters": [],
                    ]
                ],
            ],
            "/clyphx/jump_to_locator": [
                "description": "Jump to an Arrangement Locator.",
                "parameters": [
                    [
                        "name": "Locator Name",
                        "type": "locatorName",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ],
                    [
                        "name": "Relative Direction",
                        "type": "string",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": ["<", ">"],
                    ],
                ],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "LOC",
                        "parameters": ["Locator Name"],
                    ],
                    [
                        "mapping": "LOC <",
                        "parameters": [],
                    ],
                    [
                        "mapping": "LOC >",
                        "parameters": [],
                    ],
                ],
            ],
            "/clyphx/jump_to_locator_and_loop": [
                "description":
                    "Jump to the specified Arrangement Locator and set the Arrangement Loop Start position to the Locator's position.",
                "parameters": [
                    [
                        "name": "Locator Name",
                        "type": "locatorName",
                        "isRequired": true,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "LOCLOOP",
                        "parameters": ["Locator Name"],
                    ]
                ],
            ],
            "/clyphx/loop_action": [
                "description": "Control Arrangement Loop.",
                "parameters": [
                    [
                        "name": "Loop State",
                        "type": "boolean",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ],
                    [
                        "name": "Loop Length",
                        "type": "number",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ],
                    [
                        "name": "Loop Multiplier",
                        "type": "number",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ],
                    [
                        "name": "Relative Direction",
                        "type": "string",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": ["<", ">"],
                    ],
                    [
                        "name": "Relative Jump Value",
                        "type": "relativeJumpValue",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ],
                    [
                        "name": "Loop Start",
                        "type": "number",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ],
                ],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "LOOP",
                        "parameters": [],
                    ],
                    [
                        "mapping": "LOOP ON",
                        "parameters": [],
                    ],
                    [
                        "mapping": "LOOP OFF",
                        "parameters": [],
                    ],
                    [
                        "mapping": "LOOP",
                        "parameters": ["Loop Length"],
                    ],
                    [
                        "mapping": "LOOP *",
                        "parameters": ["Loop Multiplier"],
                    ],
                    [
                        "mapping": "LOOP <",
                        "parameters": [],
                    ],
                    [
                        "mapping": "LOOP >",
                        "parameters": [],
                    ],
                    [
                        "mapping": "LOOP <x",
                        "parameters": ["Relative Jump Value"],
                    ],
                    [
                        "mapping": "LOOP >x",
                        "parameters": ["Relative Jump Value"],
                    ],
                    [
                        "mapping": "LOOP RESET",
                        "parameters": [],
                    ],
                    [
                        "mapping": "LOOP START",
                        "parameters": ["Loop Start"],
                    ],
                ],
            ],
            "/clyphx/make_device_docs": [
                "description": "Generate documentation for Live Devices.",
                "parameters": [],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "MAKE_DEV_DOC",
                        "parameters": [],
                    ]
                ],
            ],
            "/clyphx/metronome": [
                "description": "Toggle Metronome.",
                "parameters": [
                    [
                        "name": "Metronome State",
                        "type": "boolean",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "METRO",
                        "parameters": [],
                    ],
                    [
                        "mapping": "METRO ON",
                        "parameters": [],
                    ],
                    [
                        "mapping": "METRO OFF",
                        "parameters": [],
                    ],
                ],
            ],
            "/clyphx/show_message": [
                "description": "Show a message in Live's Status Bar.",
                "parameters": [
                    [
                        "name": "Message",
                        "type": "string",
                        "isRequired": true,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "MSG",
                        "parameters": ["Message"],
                    ]
                ],
            ],
            "/clyphx/open_file": [
                "description": "Open a file with its default application.",
                "parameters": [
                    [
                        "name": "File Path",
                        "type": "fileName",
                        "isRequired": true,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "OPEN",
                        "parameters": ["File Path"],
                    ]
                ],
            ],
            "/clyphx/arrangement_overdub": [
                "description": "Toggle Arrangement Overdub.",
                "parameters": [
                    [
                        "name": "Overdub State",
                        "type": "boolean",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "OVER",
                        "parameters": [],
                    ],
                    [
                        "mapping": "OVER ON",
                        "parameters": [],
                    ],
                    [
                        "mapping": "OVER OFF",
                        "parameters": [],
                    ],
                ],
            ],
            "/clyphx/punch_in": [
                "description": "Toggle Punch In.",
                "parameters": [
                    [
                        "name": "Punch In State",
                        "type": "boolean",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "PIN",
                        "parameters": [],
                    ],
                    [
                        "mapping": "PIN ON",
                        "parameters": [],
                    ],
                    [
                        "mapping": "PIN OFF",
                        "parameters": [],
                    ],
                ],
            ],
            "/clyphx/punch_out": [
                "description": "Toggle Punch Out.",
                "parameters": [
                    [
                        "name": "Punch Out State",
                        "type": "boolean",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "POUT",
                        "parameters": [],
                    ],
                    [
                        "mapping": "POUT ON",
                        "parameters": [],
                    ],
                    [
                        "mapping": "POUT OFF",
                        "parameters": [],
                    ],
                ],
            ],
            "/clyphx/reset_pseqs": [
                "description": "Reset a PSEQ Action List.",
                "parameters": [
                    [
                        "name": "Identifier",
                        "type": "string",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "PSEQ RESET",
                        "parameters": [],
                    ],
                    [
                        "mapping": "PSEQ RESET",
                        "parameters": ["Identifier"],
                    ],
                ],
            ],
            "/clyphx/record_mode": [
                "description": "Toggle Arrangement Record.",
                "parameters": [
                    [
                        "name": "Record Mode State",
                        "type": "boolean",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "REC",
                        "parameters": [],
                    ],
                    [
                        "mapping": "REC ON",
                        "parameters": [],
                    ],
                    [
                        "mapping": "REC OFF",
                        "parameters": [],
                    ],
                ],
            ],
            "/clyphx/reinit_macros_and_variables": [
                "description":
                    "Reinitialize all Macros and Variables to their initial states. This will cause the related files to be re-read allowing you to modify the files, trigger this Action and have the changes to the files immediately be applied.",
                "parameters": [],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "REINIT",
                        "parameters": [],
                    ]
                ],
            ],
            "/clyphx/restart_song": [
                "description": "Restart Arrangement to Position 1.1.1.",
                "parameters": [],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "RESTART",
                        "parameters": [],
                    ]
                ],
            ],
            "/clyphx/adjust_record_quantize": [
                "description": "Adjust Record Quantization.",
                "parameters": [
                    [
                        "name": "Quantize Value",
                        "type": "quantizeValue",
                        "isRequired": false,
                        "allowsRelative": true,
                        "supportedKeywords": ["NONE"],
                    ]
                ],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "RQ",
                        "parameters": [],
                    ],
                    [
                        "mapping": "RQ",
                        "parameters": ["Quantize Value"],
                    ],
                    [
                        "mapping": "RQ >",
                        "parameters": [],
                    ],
                ],
            ],
            "/clyphx/set_note_repeat": [
                "description": "Control Note Repeat.",
                "parameters": [
                    [
                        "name": "Note Repeat Rate",
                        "type": "noteRepeatRate",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": ["OFF"],
                    ]
                ],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "RPT",
                        "parameters": [],
                    ],
                    [
                        "mapping": "RPT",
                        "parameters": ["Note Repeat Rate"],
                    ],
                ],
            ],
            "/clyphx/retrigger_clips": [
                "description":
                    "Retrigger all Clips that are currently recording.",
                "parameters": [],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "RTRIG",
                        "parameters": [],
                    ]
                ],
            ],
            "/clyphx/session_automation_record": [
                "description": "Toggle Automation Arm.",
                "parameters": [
                    [
                        "name": "Automation Arm State",
                        "type": "boolean",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "SATM",
                        "parameters": [],
                    ],
                    [
                        "mapping": "SATM ON",
                        "parameters": [],
                    ],
                    [
                        "mapping": "SATM OFF",
                        "parameters": [],
                    ],
                ],
            ],
            "/clyphx/reenable_automation": [
                "description": "Re-enable automation that has been overridden.",
                "parameters": [],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "SATMR",
                        "parameters": [],
                    ]
                ],
            ],
            "/clyphx/adjust_selected_parameter": [
                "description": "Adjust the value of the selected parameter.",
                "parameters": [
                    [
                        "name": "Parameter Value",
                        "type": "number",
                        "isRequired": true,
                        "allowsRelative": true,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "SELP",
                        "parameters": ["Parameter Value"],
                    ]
                ],
            ],
            "/clyphx/set_song_position": [
                "description": "Set Arrangement Playback Position.",
                "parameters": [
                    [
                        "name": "Song Position",
                        "type": "number",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ],
                    [
                        "name": "Relative Direction",
                        "type": "string",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": ["<", ">"],
                    ],
                    [
                        "name": "Relative Jump Value",
                        "type": "relativeJumpValue",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ],
                ],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "SETJUMP",
                        "parameters": ["Song Position"],
                    ],
                    [
                        "mapping": "SETJUMP <",
                        "parameters": [],
                    ],
                    [
                        "mapping": "SETJUMP >",
                        "parameters": [],
                    ],
                    [
                        "mapping": "SETJUMP <x",
                        "parameters": ["Relative Jump Value"],
                    ],
                    [
                        "mapping": "SETJUMP >x",
                        "parameters": ["Relative Jump Value"],
                    ],
                ],
            ],
            "/clyphx/set_cue": [
                "description":
                    "Add a Locator at the current Arrangement position or, if a Locator already exists at the position, delete the Locator.",
                "parameters": [],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "SETLOC",
                        "parameters": [],
                    ]
                ],
            ],
            "/clyphx/start_playing": [
                "description": "Toggle Playback.",
                "parameters": [
                    [
                        "name": "Playback State",
                        "type": "boolean",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "SETPLAY",
                        "parameters": [],
                    ],
                    [
                        "mapping": "SETPLAY ON",
                        "parameters": [],
                    ],
                    [
                        "mapping": "SETPLAY OFF",
                        "parameters": [],
                    ],
                ],
            ],
            "/clyphx/play_selection": [
                "description":
                    "Play the selection in Arrangement View if there is one.",
                "parameters": [],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "SETPLAYSEL",
                        "parameters": [],
                    ]
                ],
            ],
            "/clyphx/stop_playing": [
                "description": "Stop Playback.",
                "parameters": [],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "SETSTOP",
                        "parameters": [],
                    ]
                ],
            ],
            "/clyphx/adjust_time_signature": [
                "description": "Set the Time Signature.",
                "parameters": [
                    [
                        "name": "Time Signature",
                        "type": "timeSignature",
                        "isRequired": true,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "SIG",
                        "parameters": ["Time Signature"],
                    ]
                ],
            ],
            "/clyphx/session_record": [
                "description": "Toggle Session Record.",
                "parameters": [
                    [
                        "name": "Session Record State",
                        "type": "boolean",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "SREC",
                        "parameters": [],
                    ],
                    [
                        "mapping": "SREC ON",
                        "parameters": [],
                    ],
                    [
                        "mapping": "SREC OFF",
                        "parameters": [],
                    ],
                ],
            ],
            "/clyphx/adjust_swing": [
                "description":
                    "Adjust the Swing amount (in the range of 0 - 100) to apply to Note Repeat (RPT).",
                "parameters": [
                    [
                        "name": "Swing Amount",
                        "type": "number",
                        "isRequired": true,
                        "allowsRelative": true,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "SWING",
                        "parameters": ["Swing Amount"],
                    ]
                ],
            ],
            "/clyphx/tap_tempo": [
                "description": "Tap Tempo.",
                "parameters": [],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "TAPBPM",
                        "parameters": [],
                    ]
                ],
            ],
            "/clyphx/tempo_follower": [
                "description": "Toggle Tempo Follower.",
                "parameters": [
                    [
                        "name": "Tempo Follower State",
                        "type": "boolean",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "TFOLLOW",
                        "parameters": [],
                    ],
                    [
                        "mapping": "TFOLLOW ON",
                        "parameters": [],
                    ],
                    [
                        "mapping": "TFOLLOW OFF",
                        "parameters": [],
                    ],
                ],
            ],
            "/clyphx/show_elapsed_time": [
                "description":
                    "Display the amount of time spent (in the format of hours:minutes:seconds) in Live's Status Bar since the current Live Set was loaded.",
                "parameters": [],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "TIME",
                        "parameters": [],
                    ]
                ],
            ],
            "/clyphx/unbind": [
                "description":
                    "Unbind all bound controls (leaving them with no binding).",
                "parameters": [],
                "standalone": true,
                "requires_accessory": "ClyphX Pro Bindings",
                "variations": [
                    [
                        "mapping": "UNBIND",
                        "parameters": [],
                    ]
                ],
            ],
            "/clyphx/undo": [
                "description": "Undo.",
                "parameters": [],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "UNDO",
                        "parameters": [],
                    ]
                ],
            ],
            "/clyphx/stop_all_clips": [
                "description": "Stop all Clips.",
                "parameters": [],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "STOPALL",
                        "parameters": [],
                    ],
                    [
                        "mapping": "STOPALL NQ",
                        "parameters": [],
                    ],
                ],
            ],
            "/clyphx/wait": [
                "description":
                    "Wait for a specified amount of time (in hundreds of milliseconds) before proceeding to the next Action in the Action List. This cannot be used in PSEQ Action Lists or LSEQ X-Clips.",
                "parameters": [
                    [
                        "name": "Wait Time",
                        "type": "number",
                        "isRequired": true,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": false,
                "variations": [
                    [
                        "mapping": "WAIT",
                        "parameters": ["Wait Time"],
                    ]
                ],
            ],
            "/clyphx/waits": [
                "description":
                    "Wait for a specified amount of time (in Beats) before proceeding to the next Action in the Action List. This cannot be used in PSEQ Action Lists or LSEQ X-Clips.",
                "parameters": [
                    [
                        "name": "Wait Time",
                        "type": "number",
                        "isRequired": true,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": false,
                "variations": [
                    [
                        "mapping": "WAITS",
                        "parameters": ["Wait Time"],
                    ]
                ],
            ],
            "/clyphx/export_settings": [
                "description": "Create a backup of your ClyphX Pro settings.",
                "parameters": [],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "EXPORT_SETTINGS",
                        "parameters": [],
                    ]
                ],
            ],
            "/clyphx/set_insert_mode": [
                "description": "Set the Device insert mode.",
                "parameters": [
                    [
                        "name": "Insert Mode",
                        "type": "insertMode",
                        "isRequired": true,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "INSERT DEFAULT",
                        "parameters": [],
                    ],
                    [
                        "mapping": "INSERT LEFT",
                        "parameters": [],
                    ],
                    [
                        "mapping": "INSERT RIGHT",
                        "parameters": [],
                    ],
                ],
            ],
        ],
        "Control Surface": [
            "/clyphx/control_surface_action": [
                "description": "Perform an action on a control surface.",
                "parameters": [
                    [
                        "name": "Control Surface Name",
                        "type": "controlSurfaceName",
                        "isRequired": true,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ],
                    [
                        "name": "Channel Strip Index",
                        "type": "number",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ],
                    [
                        "name": "Channel Strip Range",
                        "type": "string",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": ["ALL"],
                    ],
                    [
                        "name": "Action",
                        "type": "string",
                        "isRequired": true,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ],
                ],
                "standalone": false,
                "control_surface": true,
                "variations": [
                    [
                        "mapping": "cs x/ACTION NAME",
                        "parameters": [
                            "Control Surface Name", "Channel Strip Index",
                            "Action",
                        ],
                    ],
                    [
                        "mapping": "cs x-y/ACTION NAME",
                        "parameters": [
                            "Control Surface Name", "Channel Strip Range",
                            "Action",
                        ],
                    ],
                ],
            ],
            "/clyphx/control_surface_track_action": [
                "description":
                    "Apply a Track-based Action to the currently selected Track.",
                "parameters": [
                    [
                        "name": "Control Surface Name",
                        "type": "controlSurfaceName",
                        "isRequired": true,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ],
                    [
                        "name": "Action",
                        "type": "string",
                        "isRequired": true,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ],
                ],
                "standalone": false,
                "control_surface": true,
                "variations": [
                    [
                        "mapping": "cs /ACTION NAME",
                        "parameters": ["Control Surface Name", "Action"],
                    ]
                ],
            ],
            "/clyphx/control_surface_bank": [
                "description":
                    "Control the Track Bank selection of a script.",
                "parameters": [
                    [
                        "name": "Control Surface Name",
                        "type": "controlSurfaceName",
                        "isRequired": true,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ],
                    [
                        "name": "Bank Increment",
                        "type": "number",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ],
                ],
                "standalone": false,
                "control_surface": true,
                "variations": [
                    [
                        "mapping": "cs BANK <",
                        "parameters": ["Control Surface Name"],
                    ],
                    [
                        "mapping": "cs BANK >",
                        "parameters": ["Control Surface Name"],
                    ],
                    [
                        "mapping": "cs BANK <x",
                        "parameters": [
                            "Control Surface Name", "Bank Increment",
                        ],
                    ],
                    [
                        "mapping": "cs BANK >x",
                        "parameters": [
                            "Control Surface Name", "Bank Increment",
                        ],
                    ],
                    [
                        "mapping": "cs BANK LAST",
                        "parameters": ["Control Surface Name"],
                    ],
                    [
                        "mapping": "cs BANK FIRST",
                        "parameters": ["Control Surface Name"],
                    ],
                ],
            ],
            "/clyphx/control_surface_colors": [
                "description": "Change the color of the Clip Launch LEDs.",
                "parameters": [
                    [
                        "name": "Control Surface Name",
                        "type": "controlSurfaceName",
                        "isRequired": true,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ],
                    [
                        "name": "Playing Color",
                        "type": "string",
                        "isRequired": true,
                        "allowsRelative": false,
                        "supportedKeywords": ["Amber", "Green", "Red"],
                    ],
                    [
                        "name": "Recording Color",
                        "type": "string",
                        "isRequired": true,
                        "allowsRelative": false,
                        "supportedKeywords": ["Amber", "Green", "Red"],
                    ],
                    [
                        "name": "Stopped Color",
                        "type": "string",
                        "isRequired": true,
                        "allowsRelative": false,
                        "supportedKeywords": ["Amber", "Green", "Red"],
                    ],
                ],
                "standalone": false,
                "control_surface": true,
                "variations": [
                    [
                        "mapping": "cs COLORS",
                        "parameters": [
                            "Control Surface Name", "Playing Color",
                            "Recording Color", "Stopped Color",
                        ],
                    ]
                ],
            ],
            "/clyphx/control_surface_device_bank": [
                "description": "Control Device parameter banks on a script.",
                "parameters": [
                    [
                        "name": "Control Surface Name",
                        "type": "controlSurfaceName",
                        "isRequired": true,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ],
                    [
                        "name": "Device Bank",
                        "type": "deviceBank",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ],
                ],
                "standalone": false,
                "control_surface": true,
                "variations": [
                    [
                        "mapping": "cs DEV BANK",
                        "parameters": ["Control Surface Name", "Device Bank"],
                    ],
                    [
                        "mapping": "cs DEV BANK <",
                        "parameters": ["Control Surface Name"],
                    ],
                    [
                        "mapping": "cs DEV BANK >",
                        "parameters": ["Control Surface Name"],
                    ],
                ],
            ],
            "/clyphx/control_surface_device_lock": [
                "description": "Toggle the script's lock on Devices.",
                "parameters": [
                    [
                        "name": "Control Surface Name",
                        "type": "controlSurfaceName",
                        "isRequired": true,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": false,
                "control_surface": true,
                "variations": [
                    [
                        "mapping": "cs DEV LOCK",
                        "parameters": ["Control Surface Name"],
                    ]
                ],
            ],
            "/clyphx/control_surface_full_velocity": [
                "description":
                    "Toggle Full Velocity for the script. When on, notes sent from the controller will have full velocity (127).",
                "parameters": [
                    [
                        "name": "Control Surface Name",
                        "type": "controlSurfaceName",
                        "isRequired": true,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ],
                    [
                        "name": "Full Velocity State",
                        "type": "boolean",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ],
                ],
                "standalone": false,
                "control_surface": true,
                "variations": [
                    [
                        "mapping": "cs FULLVELO",
                        "parameters": ["Control Surface Name"],
                    ],
                    [
                        "mapping": "cs FULLVELO ON",
                        "parameters": ["Control Surface Name"],
                    ],
                    [
                        "mapping": "cs FULLVELO OFF",
                        "parameters": ["Control Surface Name"],
                    ],
                ],
            ],
            "/clyphx/control_surface_ring": [
                "description": "Control the grid-selection-ring of a script.",
                "parameters": [
                    [
                        "name": "Control Surface Name",
                        "type": "controlSurfaceName",
                        "isRequired": true,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ],
                    [
                        "name": "Track Offset",
                        "type": "trackIndex",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ],
                    [
                        "name": "Scene Offset",
                        "type": "sceneIndex",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ],
                    [
                        "name": "Track Increment",
                        "type": "number",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ],
                    [
                        "name": "Scene Increment",
                        "type": "number",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ],
                ],
                "standalone": false,
                "control_surface": true,
                "variations": [
                    [
                        "mapping": "cs RING T",
                        "parameters": ["Control Surface Name", "Track Offset"],
                    ],
                    [
                        "mapping": "cs RING S",
                        "parameters": ["Control Surface Name", "Scene Offset"],
                    ],
                    [
                        "mapping": "cs RING T S",
                        "parameters": [
                            "Control Surface Name", "Track Offset",
                            "Scene Offset",
                        ],
                    ],
                    [
                        "mapping": "cs RING T< S<",
                        "parameters": ["Control Surface Name"],
                    ],
                    [
                        "mapping": "cs RING T> S>",
                        "parameters": ["Control Surface Name"],
                    ],
                    [
                        "mapping": "cs RING T<x S<x",
                        "parameters": [
                            "Control Surface Name", "Track Increment",
                            "Scene Increment",
                        ],
                    ],
                    [
                        "mapping": "cs RING T>x S>x",
                        "parameters": [
                            "Control Surface Name", "Track Increment",
                            "Scene Increment",
                        ],
                    ],
                    [
                        "mapping": "cs RING LAST",
                        "parameters": ["Control Surface Name"],
                    ],
                ],
            ],
            "/clyphx/control_surface_ring_link": [
                "description":
                    "Control the linking of the grid-selection-ring to the current Track and/or Scene selection.",
                "parameters": [
                    [
                        "name": "Control Surface Name",
                        "type": "controlSurfaceName",
                        "isRequired": true,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": false,
                "control_surface": true,
                "variations": [
                    [
                        "mapping": "cs RINGLINK T S",
                        "parameters": ["Control Surface Name"],
                    ],
                    [
                        "mapping": "cs RINGLINK T CENTER",
                        "parameters": ["Control Surface Name"],
                    ],
                    [
                        "mapping": "cs RINGLINK S CENTER",
                        "parameters": ["Control Surface Name"],
                    ],
                    [
                        "mapping": "cs RINGLINK OFF",
                        "parameters": ["Control Surface Name"],
                    ],
                ],
            ],
            "/clyphx/control_surface_note_repeat": [
                "description": "Control Note Repeat for a Control Surface.",
                "parameters": [
                    [
                        "name": "Control Surface Name",
                        "type": "controlSurfaceName",
                        "isRequired": true,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ],
                    [
                        "name": "Note Repeat Rate",
                        "type": "noteRepeatRate",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": ["OFF"],
                    ],
                ],
                "standalone": false,
                "control_surface": true,
                "variations": [
                    [
                        "mapping": "cs RPT",
                        "parameters": ["Control Surface Name"],
                    ],
                    [
                        "mapping": "cs RPT",
                        "parameters": [
                            "Control Surface Name", "Note Repeat Rate",
                        ],
                    ],
                ],
            ],
        ],
        "Device": [
            "/clyphx/device_action": [
                "description": "Perform an action on a device.",
                "parameters": [
                    [
                        "name": "Parameter Name",
                        "type": "deviceParameter",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ],
                    [
                        "name": "Parameter Value",
                        "type": "number",
                        "isRequired": false,
                        "allowsRelative": true,
                        "supportedKeywords": [],
                    ],
                    [
                        "name": "Bank Number",
                        "type": "deviceBank",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ],
                    [
                        "name": "Parameter Number",
                        "type": "number",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ],
                    [
                        "name": "Chain Selector Value",
                        "type": "number",
                        "isRequired": false,
                        "allowsRelative": true,
                        "supportedKeywords": [],
                    ],
                    [
                        "name": "Chain Index",
                        "type": "deviceChainIndex",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ],
                    [
                        "name": "Selector Value",
                        "type": "number",
                        "isRequired": false,
                        "allowsRelative": true,
                        "supportedKeywords": ["<", ">"],
                    ],
                    [
                        "name": "Preset Name",
                        "type": "string",
                        "isRequired": false,
                        "allowsRelative": true,
                        "supportedKeywords": ["<", ">"],
                    ],
                    [
                        "name": "Macro Values",
                        "type": "string",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": ["CUR"],
                    ],
                    [
                        "name": "Variation Index",
                        "type": "number",
                        "isRequired": false,
                        "allowsRelative": true,
                        "supportedKeywords": ["<", ">"],
                    ],
                ],
                "standalone": false,
                "track_based": true,
                "variations": [
                    [
                        "mapping": "DEV",
                        "parameters": [],
                    ],
                    [
                        "mapping": "DEV",
                        "parameters": ["Parameter Name", "Parameter Value"],
                    ],
                    [
                        "mapping": "DEV ADDMACRO",
                        "parameters": [],
                    ],
                    [
                        "mapping": "DEV REMMACRO",
                        "parameters": [],
                    ],
                    [
                        "mapping": "DEV B",
                        "parameters": [
                            "Bank Number", "Parameter Number",
                            "Parameter Value",
                        ],
                    ],
                    [
                        "mapping": "DEV CS",
                        "parameters": ["Chain Selector Value"],
                    ],
                    [
                        "mapping": "DEV CSEL",
                        "parameters": ["Chain Index"],
                    ],
                    [
                        "mapping": "DEV CSEL <",
                        "parameters": [],
                    ],
                    [
                        "mapping": "DEV CSEL >",
                        "parameters": [],
                    ],
                    [
                        "mapping": "DEV DEL",
                        "parameters": [],
                    ],
                    [
                        "mapping": "DEV DR SCROLL",
                        "parameters": ["Selector Value"],
                    ],
                    [
                        "mapping": "DEV DR SCROLL <",
                        "parameters": [],
                    ],
                    [
                        "mapping": "DEV DR SCROLL >",
                        "parameters": [],
                    ],
                    [
                        "mapping": "DEV FOLD",
                        "parameters": [],
                    ],
                    [
                        "mapping": "DEV P",
                        "parameters": ["Parameter Number", "Parameter Value"],
                    ],
                    [
                        "mapping": "DEV PRESET",
                        "parameters": ["Preset Name"],
                    ],
                    [
                        "mapping": "DEV PRESET <",
                        "parameters": [],
                    ],
                    [
                        "mapping": "DEV PRESET >",
                        "parameters": [],
                    ],
                    [
                        "mapping": "DEV RESET",
                        "parameters": [],
                    ],
                    [
                        "mapping": "DEV RND",
                        "parameters": [],
                    ],
                    [
                        "mapping": "DEV SEL",
                        "parameters": [],
                    ],
                    [
                        "mapping": "DEV SET",
                        "parameters": [],
                    ],
                    [
                        "mapping": "DEV SET",
                        "parameters": ["Macro Values"],
                    ],
                    [
                        "mapping": "DEV SHOWCH",
                        "parameters": [],
                    ],
                    [
                        "mapping": "DEV VAR",
                        "parameters": ["Variation Index"],
                    ],
                    [
                        "mapping": "DEV VAR <",
                        "parameters": [],
                    ],
                    [
                        "mapping": "DEV VAR >",
                        "parameters": [],
                    ],
                    [
                        "mapping": "DEV VARDEL",
                        "parameters": [],
                    ],
                    [
                        "mapping": "DEV VARRECALL",
                        "parameters": [],
                    ],
                    [
                        "mapping": "DEV VARLRECALL",
                        "parameters": [],
                    ],
                    [
                        "mapping": "DEV VARSTORE",
                        "parameters": [],
                    ],
                ],
            ]
        ],
        "Drum Pad": [
            "/clyphx/drum_pad_choke": [
                "description": "Adjust Drum Rack Pad Choke Group.",
                "parameters": [
                    [
                        "name": "Choke Group",
                        "type": "chokeGroup",
                        "isRequired": true,
                        "allowsRelative": true,
                        "supportedKeywords": ["<", ">"],
                    ]
                ],
                "variations": [
                    [
                        "mapping": "DR PAD CHOKE",
                        "parameters": ["Choke Group"],
                    ],
                    [
                        "mapping": "DR PAD CHOKE <",
                        "parameters": [],
                    ],
                    [
                        "mapping": "DR PAD CHOKE >",
                        "parameters": [],
                    ],
                ],
            ],
            "/clyphx/drum_pad_color": [
                "description": "Set the color of the Drum Pad.",
                "parameters": [
                    [
                        "name": "Color Index",
                        "type": "number",
                        "isRequired": true,
                        "allowsRelative": true,
                        "supportedKeywords": ["<", ">"],
                    ]
                ],
                "variations": [
                    [
                        "mapping": "DR PAD COLOR",
                        "parameters": ["Color Index"],
                    ],
                    [
                        "mapping": "DR PAD COLOR <",
                        "parameters": [],
                    ],
                    [
                        "mapping": "DR PAD COLOR >",
                        "parameters": [],
                    ],
                ],
            ],
            "/clyphx/drum_pad_mute": [
                "description": "Toggle Drum Pad Mute.",
                "parameters": [],
                "variations": [
                    [
                        "mapping": "DR PAD MUTE",
                        "parameters": [],
                    ]
                ],
            ],
            "/clyphx/drum_pad_note": [
                "description":
                    "Adjust Drum Rack Pad Out Note (in the range of 0 - 127) allowing for transposition.",
                "parameters": [
                    [
                        "name": "Note Value",
                        "type": "number",
                        "isRequired": true,
                        "allowsRelative": true,
                        "supportedKeywords": [],
                    ]
                ],
                "variations": [
                    [
                        "mapping": "DR PAD NOTE",
                        "parameters": ["Note Value"],
                    ]
                ],
            ],
            "/clyphx/drum_pad_pan": [
                "description": "Adjust Drum Pad Pan.",
                "parameters": [
                    [
                        "name": "Pan Value",
                        "type": "number",
                        "isRequired": true,
                        "allowsRelative": true,
                        "supportedKeywords": [],
                    ]
                ],
                "variations": [
                    [
                        "mapping": "DR PAD PAN",
                        "parameters": ["Pan Value"],
                    ]
                ],
            ],
            "/clyphx/drum_pad_send": [
                "description": "Adjust Drum Pad Send.",
                "parameters": [
                    [
                        "name": "Send Letter",
                        "type": "trackSendLetter",
                        "isRequired": true,
                        "allowsRelative": false,
                        "supportedKeywords": ["ALL"],
                    ],
                    [
                        "name": "Send Value",
                        "type": "number",
                        "isRequired": true,
                        "allowsRelative": true,
                        "supportedKeywords": [],
                    ],
                ],
                "variations": [
                    [
                        "mapping": "DR PAD SEND",
                        "parameters": ["Send Letter", "Send Value"],
                    ]
                ],
            ],
            "/clyphx/drum_pad_solo": [
                "description": "Toggle Drum Pad Solo.",
                "parameters": [],
                "variations": [
                    [
                        "mapping": "DR PAD SOLO",
                        "parameters": [],
                    ]
                ],
            ],
            "/clyphx/drum_pad_volume": [
                "description": "Adjust Drum Pad Volume.",
                "parameters": [
                    [
                        "name": "Volume Value",
                        "type": "number",
                        "isRequired": true,
                        "allowsRelative": true,
                        "supportedKeywords": [],
                    ]
                ],
                "variations": [
                    [
                        "mapping": "DR PAD VOL",
                        "parameters": ["Volume Value"],
                    ]
                ],
            ],
        ],
        "Editing": [
            "/clyphx/hotswap": [
                "description": "Control hotswapping.",
                "parameters": [
                    [
                        "name": "Preset Name",
                        "type": "string",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "SWAP",
                        "parameters": [],
                    ],
                    [
                        "mapping": "SWAP",
                        "parameters": ["Preset Name"],
                    ],
                    [
                        "mapping": "SWAP <",
                        "parameters": [],
                    ],
                    [
                        "mapping": "SWAP >",
                        "parameters": [],
                    ],
                ],
            ]
        ],
        "Loading": [
            "/clyphx/load_clip": [
                "description": "Load the specified Clip onto a new Track.",
                "parameters": [
                    [
                        "name": "Clip Name",
                        "type": "clipName",
                        "isRequired": true,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "LOADCLIP",
                        "parameters": ["Clip Name"],
                    ]
                ],
            ],
            "/clyphx/load_device": [
                "description":
                    "Load the specified native Live Device onto the selected Track.",
                "parameters": [
                    [
                        "name": "Device Name",
                        "type": "deviceName",
                        "isRequired": true,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "LOADDEV",
                        "parameters": ["Device Name"],
                    ]
                ],
            ],
            "/clyphx/load_drums": [
                "description":
                    "Load the specified Drum Rack or Instrument onto the selected Track.",
                "parameters": [
                    [
                        "name": "Drum Rack/Instrument Name",
                        "type": "string",
                        "isRequired": true,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "LOADDRUMS",
                        "parameters": ["Drum Rack/Instrument Name"],
                    ]
                ],
            ],
            "/clyphx/load_m4l_device": [
                "description":
                    "Load the specified Max for Live Device onto the selected Track.",
                "parameters": [
                    [
                        "name": "M4L Device Name",
                        "type": "string",
                        "isRequired": true,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "LOADM4L",
                        "parameters": ["M4L Device Name"],
                    ]
                ],
            ],
            "/clyphx/load_pack": [
                "description":
                    "Load the specified item from the Packs category.",
                "parameters": [
                    [
                        "name": "Pack Item Name",
                        "type": "string",
                        "isRequired": true,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "LOADPACK",
                        "parameters": ["Pack Item Name"],
                    ]
                ],
            ],
            "/clyphx/load_plugin": [
                "description":
                    "Load the specified Plug-in onto the selected Track.",
                "parameters": [
                    [
                        "name": "Plugin Name",
                        "type": "string",
                        "isRequired": true,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "LOADPLUG",
                        "parameters": ["Plugin Name"],
                    ]
                ],
            ],
            "/clyphx/load_sample": [
                "description":
                    "Load the specified Sample into a Simpler Device on the selected Track.",
                "parameters": [
                    [
                        "name": "Sample Name",
                        "type": "string",
                        "isRequired": true,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "LOADSAMPLE",
                        "parameters": ["Sample Name"],
                    ]
                ],
            ],
            "/clyphx/load_sound": [
                "description":
                    "Load the specified Sound onto the selected Track.",
                "parameters": [
                    [
                        "name": "Sound Name",
                        "type": "string",
                        "isRequired": true,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "LOADSOUND",
                        "parameters": ["Sound Name"],
                    ]
                ],
            ],
            "/clyphx/load_user_library": [
                "description": "Load the specified item from the User Library.",
                "parameters": [
                    [
                        "name": "User Library Item Name",
                        "type": "string",
                        "isRequired": true,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "LOADUSER",
                        "parameters": ["User Library Item Name"],
                    ]
                ],
            ],
        ],
        "MIDI": [
            "/clyphx/send_midi": [
                "description": "Send a MIDI message.",
                "parameters": [
                    [
                        "name": "MIDI Message",
                        "type": "midiMessage",
                        "isRequired": true,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": true,
                "requires_output": true,
                "variations": [
                    [
                        "mapping": "MIDI",
                        "parameters": ["MIDI Message"],
                    ],
                    [
                        "mapping": "MIDI CC",
                        "parameters": ["MIDI Message"],
                    ],
                    [
                        "mapping": "MIDI NOTE",
                        "parameters": ["MIDI Message"],
                    ],
                    [
                        "mapping": "MIDI PC",
                        "parameters": ["MIDI Message"],
                    ],
                ],
            ],
            "/clyphx/send_midi_a": [
                "description": "Send a MIDI message to XT Script A.",
                "parameters": [
                    [
                        "name": "MIDI Message",
                        "type": "midiMessage",
                        "isRequired": true,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": true,
                "requires_output": true,
                "requires_script": "A",
                "variations": [
                    [
                        "mapping": "MIDIA",
                        "parameters": ["MIDI Message"],
                    ],
                    [
                        "mapping": "MIDIA CC",
                        "parameters": ["MIDI Message"],
                    ],
                    [
                        "mapping": "MIDIA NOTE",
                        "parameters": ["MIDI Message"],
                    ],
                    [
                        "mapping": "MIDIA PC",
                        "parameters": ["MIDI Message"],
                    ],
                ],
            ],
            "/clyphx/send_midi_b": [
                "description": "Send a MIDI message to XT Script B.",
                "parameters": [
                    [
                        "name": "MIDI Message",
                        "type": "midiMessage",
                        "isRequired": true,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": true,
                "requires_output": true,
                "requires_script": "B",
                "variations": [
                    [
                        "mapping": "MIDIB",
                        "parameters": ["MIDI Message"],
                    ],
                    [
                        "mapping": "MIDIB CC",
                        "parameters": ["MIDI Message"],
                    ],
                    [
                        "mapping": "MIDIB NOTE",
                        "parameters": ["MIDI Message"],
                    ],
                    [
                        "mapping": "MIDIB PC",
                        "parameters": ["MIDI Message"],
                    ],
                ],
            ],
            "/clyphx/send_midi_c": [
                "description": "Send a MIDI message to XT Script C.",
                "parameters": [
                    [
                        "name": "MIDI Message",
                        "type": "midiMessage",
                        "isRequired": true,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": true,
                "requires_output": true,
                "requires_script": "C",
                "variations": [
                    [
                        "mapping": "MIDIC",
                        "parameters": ["MIDI Message"],
                    ],
                    [
                        "mapping": "MIDIC CC",
                        "parameters": ["MIDI Message"],
                    ],
                    [
                        "mapping": "MIDIC NOTE",
                        "parameters": ["MIDI Message"],
                    ],
                    [
                        "mapping": "MIDIC PC",
                        "parameters": ["MIDI Message"],
                    ],
                ],
            ],
            "/clyphx/send_midi_d": [
                "description": "Send a MIDI message to XT Script D.",
                "parameters": [
                    [
                        "name": "MIDI Message",
                        "type": "midiMessage",
                        "isRequired": true,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": true,
                "requires_output": true,
                "requires_script": "D",
                "variations": [
                    [
                        "mapping": "MIDID",
                        "parameters": ["MIDI Message"],
                    ],
                    [
                        "mapping": "MIDID CC",
                        "parameters": ["MIDI Message"],
                    ],
                    [
                        "mapping": "MIDID NOTE",
                        "parameters": ["MIDI Message"],
                    ],
                    [
                        "mapping": "MIDID PC",
                        "parameters": ["MIDI Message"],
                    ],
                ],
            ],
            "/clyphx/send_midi_e": [
                "description": "Send a MIDI message to XT Script E.",
                "parameters": [
                    [
                        "name": "MIDI Message",
                        "type": "midiMessage",
                        "isRequired": true,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": true,
                "requires_output": true,
                "requires_script": "E",
                "variations": [
                    [
                        "mapping": "MIDIE",
                        "parameters": ["MIDI Message"],
                    ],
                    [
                        "mapping": "MIDIE CC",
                        "parameters": ["MIDI Message"],
                    ],
                    [
                        "mapping": "MIDIE NOTE",
                        "parameters": ["MIDI Message"],
                    ],
                    [
                        "mapping": "MIDIE PC",
                        "parameters": ["MIDI Message"],
                    ],
                ],
            ],
            "/clyphx/send_key": [
                "description": "Send the specified keystroke.",
                "parameters": [
                    [
                        "name": "Keystroke",
                        "type": "keystroke",
                        "isRequired": true,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "KEY",
                        "parameters": ["Keystroke"],
                    ]
                ],
            ],
        ],
        "Mixing": [
            "/clyphx/crossfader": [
                "description": "Adjust Master Crossfader (Master Track only).",
                "parameters": [
                    [
                        "name": "Crossfader Value",
                        "type": "number",
                        "isRequired": true,
                        "allowsRelative": true,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": false,
                "track_based": true,
                "variations": [
                    [
                        "mapping": "XFADER",
                        "parameters": ["Crossfader Value"],
                    ]
                ],
            ]
        ],
        "Navigation": [
            "/clyphx/device_first": [
                "description":
                    "Move to the First Device on the selected Track.",
                "parameters": [],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "DEVFIRST",
                        "parameters": [],
                    ]
                ],
            ],
            "/clyphx/device_last": [
                "description": "Move to the Last Device on the selected Track.",
                "parameters": [],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "DEVLAST",
                        "parameters": [],
                    ]
                ],
            ],
            "/clyphx/device_left": [
                "description":
                    "Move Left between Devices on the selected Track.",
                "parameters": [],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "DEVLEFT",
                        "parameters": [],
                    ]
                ],
            ],
            "/clyphx/device_right": [
                "description":
                    "Move Right between Devices on the selected Track.",
                "parameters": [],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "DEVRIGHT",
                        "parameters": [],
                    ]
                ],
            ],
            "/clyphx/focus_browser": [
                "description":
                    "Move the Focus to the Browser and show the Browser if it isn't visible.",
                "parameters": [],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "FOCBRWSR",
                        "parameters": [],
                    ]
                ],
            ],
            "/clyphx/focus_detail": [
                "description":
                    "Move the Focus to Detail View and show Detail View if it isn't visible.",
                "parameters": [],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "FOCDETAIL",
                        "parameters": [],
                    ]
                ],
            ],
            "/clyphx/focus_main": [
                "description": "Move the Focus to the Main Focus.",
                "parameters": [],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "FOCMAIN",
                        "parameters": [],
                    ]
                ],
            ],
            "/clyphx/zoom_horizontal": [
                "description":
                    "Horizontally zoom in or out in Arrangement View.",
                "parameters": [
                    [
                        "name": "Zoom Amount",
                        "type": "number",
                        "isRequired": true,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "HZOOM",
                        "parameters": ["Zoom Amount"],
                    ]
                ],
            ],
            "/clyphx/zoom_vertical": [
                "description": "Vertically zoom in or out in Arrangement View.",
                "parameters": [
                    [
                        "name": "Zoom Amount",
                        "type": "number",
                        "isRequired": true,
                        "allowsRelative": false,
                        "supportedKeywords": ["ALL"],
                    ]
                ],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "VZOOM",
                        "parameters": ["Zoom Amount"],
                    ],
                    [
                        "mapping": "VZOOM ALL",
                        "parameters": ["Zoom Amount"],
                    ],
                ],
            ],
            "/clyphx/move_left": [
                "description": "Move Left in Session or Arrangement View.",
                "parameters": [],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "LEFT",
                        "parameters": [],
                    ]
                ],
            ],
            "/clyphx/move_right": [
                "description": "Move Right in Session or Arrangement View.",
                "parameters": [],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "RIGHT",
                        "parameters": [],
                    ]
                ],
            ],
            "/clyphx/move_up": [
                "description": "Move Up in Session or Arrangement View.",
                "parameters": [],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "UP",
                        "parameters": [],
                    ]
                ],
            ],
            "/clyphx/move_down": [
                "description": "Move Down in Session or Arrangement View.",
                "parameters": [],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "DOWN",
                        "parameters": [],
                    ]
                ],
            ],
            "/clyphx/select_left": [
                "description":
                    "Move Left to create/modify the selection in Arrangement View.",
                "parameters": [],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "LEFTSEL",
                        "parameters": [],
                    ]
                ],
            ],
            "/clyphx/select_right": [
                "description":
                    "Move Right to create/modify the selection in Arrangement View.",
                "parameters": [],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "RIGHTSEL",
                        "parameters": [],
                    ]
                ],
            ],
            "/clyphx/show_clip_view": [
                "description": "Show Clip View.",
                "parameters": [],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "SHOWCLIP",
                        "parameters": [],
                    ]
                ],
            ],
            "/clyphx/show_detail_view": [
                "description": "Toggle between showing and hiding Detail View.",
                "parameters": [],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "SHOWDETAIL",
                        "parameters": [],
                    ]
                ],
            ],
            "/clyphx/show_device_view": [
                "description": "Show Track View.",
                "parameters": [],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "SHOWDEV",
                        "parameters": [],
                    ]
                ],
            ],
            "/clyphx/toggle_browser": [
                "description":
                    "Toggle the Browser and move the Focus to it or the Main Focus.",
                "parameters": [],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "TGLBRWSR",
                        "parameters": [],
                    ]
                ],
            ],
            "/clyphx/toggle_detail_view": [
                "description": "Toggle between Clip and Track View.",
                "parameters": [],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "TGLDETAIL",
                        "parameters": [],
                    ]
                ],
            ],
            "/clyphx/toggle_main_view": [
                "description": "Toggle between Session and Arrangement View.",
                "parameters": [],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "TGLMAIN",
                        "parameters": [],
                    ]
                ],
            ],
        ],
        "Recording": [
            "/clyphx/arrangement_overdub": [
                "description": "Toggle Arrangement Overdub.",
                "parameters": [
                    [
                        "name": "Overdub State",
                        "type": "boolean",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "OVER",
                        "parameters": [],
                    ],
                    [
                        "mapping": "OVER ON",
                        "parameters": [],
                    ],
                    [
                        "mapping": "OVER OFF",
                        "parameters": [],
                    ],
                ],
            ],
            "/clyphx/punch_in": [
                "description": "Toggle Punch In.",
                "parameters": [
                    [
                        "name": "Punch In State",
                        "type": "boolean",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "PIN",
                        "parameters": [],
                    ],
                    [
                        "mapping": "PIN ON",
                        "parameters": [],
                    ],
                    [
                        "mapping": "PIN OFF",
                        "parameters": [],
                    ],
                ],
            ],
            "/clyphx/punch_out": [
                "description": "Toggle Punch Out.",
                "parameters": [
                    [
                        "name": "Punch Out State",
                        "type": "boolean",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "POUT",
                        "parameters": [],
                    ],
                    [
                        "mapping": "POUT ON",
                        "parameters": [],
                    ],
                    [
                        "mapping": "POUT OFF",
                        "parameters": [],
                    ],
                ],
            ],
            "/clyphx/record_mode": [
                "description": "Toggle Arrangement Record.",
                "parameters": [
                    [
                        "name": "Record Mode State",
                        "type": "boolean",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "REC",
                        "parameters": [],
                    ],
                    [
                        "mapping": "REC ON",
                        "parameters": [],
                    ],
                    [
                        "mapping": "REC OFF",
                        "parameters": [],
                    ],
                ],
            ],
            "/clyphx/session_automation_record": [
                "description": "Toggle Automation Arm.",
                "parameters": [
                    [
                        "name": "Automation Arm State",
                        "type": "boolean",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "SATM",
                        "parameters": [],
                    ],
                    [
                        "mapping": "SATM ON",
                        "parameters": [],
                    ],
                    [
                        "mapping": "SATM OFF",
                        "parameters": [],
                    ],
                ],
            ],
            "/clyphx/session_record": [
                "description": "Toggle Session Record.",
                "parameters": [
                    [
                        "name": "Session Record State",
                        "type": "boolean",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "SREC",
                        "parameters": [],
                    ],
                    [
                        "mapping": "SREC ON",
                        "parameters": [],
                    ],
                    [
                        "mapping": "SREC OFF",
                        "parameters": [],
                    ],
                ],
            ],
            "/clyphx/capture_midi": [
                "description": "Trigger Capture MIDI.",
                "parameters": [],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "CAP",
                        "parameters": [],
                    ]
                ],
            ],
            "/clyphx/trigger_session_record": [
                "description":
                    "Trigger fixed-length Session Record on all armed Tracks.",
                "parameters": [
                    [
                        "name": "Record Length",
                        "type": "number",
                        "isRequired": true,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "SRECFIX",
                        "parameters": ["Record Length"],
                    ]
                ],
            ],
        ],
        "Session": [
            "/clyphx/add_scene": [
                "description": "Create a Scene.",
                "parameters": [
                    [
                        "name": "Scene Index",
                        "type": "sceneIndex",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "ADDSCENE",
                        "parameters": [],
                    ],
                    [
                        "mapping": "ADDSCENE",
                        "parameters": ["Scene Index"],
                    ],
                ],
            ],
            "/clyphx/capture_scene": [
                "description":
                    "Trigger Live's Capture and Insert Scene function.",
                "parameters": [],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "CAPSCENE",
                        "parameters": [],
                    ]
                ],
            ],
            "/clyphx/scene_action": [
                "description": "Perform an action on a scene.",
                "parameters": [
                    [
                        "name": "Scene Index",
                        "type": "sceneIndex",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": ["SEL", "LAST"],
                    ],
                    [
                        "name": "Scene Offset",
                        "type": "number",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ],
                    [
                        "name": "Color Index",
                        "type": "number",
                        "isRequired": false,
                        "allowsRelative": true,
                        "supportedKeywords": ["<", ">"],
                    ],
                    [
                        "name": "Scene Name",
                        "type": "string",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ],
                    [
                        "name": "Append String",
                        "type": "string",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ],
                    [
                        "name": "Prepend String",
                        "type": "string",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ],
                    [
                        "name": "Identifier",
                        "type": "string",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ],
                    [
                        "name": "Scene Range",
                        "type": "string",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ],
                ],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "SCENE",
                        "parameters": ["Scene Index"],
                    ],
                    [
                        "mapping": "SCENE <",
                        "parameters": [],
                    ],
                    [
                        "mapping": "SCENE >",
                        "parameters": [],
                    ],
                    [
                        "mapping": "SCENE <x",
                        "parameters": ["Scene Offset"],
                    ],
                    [
                        "mapping": "SCENE >x",
                        "parameters": ["Scene Offset"],
                    ],
                    [
                        "mapping": "SCENE COLOR",
                        "parameters": ["Color Index"],
                    ],
                    [
                        "mapping": "SCENE COLOR <",
                        "parameters": [],
                    ],
                    [
                        "mapping": "SCENE COLOR >",
                        "parameters": [],
                    ],
                    [
                        "mapping": "SCENE DEL",
                        "parameters": [],
                    ],
                    [
                        "mapping": "SCENE DUPE",
                        "parameters": [],
                    ],
                    [
                        "mapping": "SCENE NAME",
                        "parameters": ["Scene Name"],
                    ],
                    [
                        "mapping": "SCENE NAMEA",
                        "parameters": ["Append String"],
                    ],
                    [
                        "mapping": "SCENE NAMEP",
                        "parameters": ["Prepend String"],
                    ],
                    [
                        "mapping": "SCENE NAMED",
                        "parameters": ["Identifier", "Scene Name"],
                    ],
                    [
                        "mapping": "SCENE RND",
                        "parameters": [],
                    ],
                    [
                        "mapping": "SCENE RND",
                        "parameters": ["Scene Range"],
                    ],
                    [
                        "mapping": "SCENE SEL",
                        "parameters": ["Scene Index"],
                    ],
                ],
            ],
        ],
        "Simpler": [
            "/clyphx/simpler_bpm": [
                "description": "Adjust the Tempo of the Sample in Simpler.",
                "parameters": [],
                "standalone": false,
                "track_based": true,
                "variations": [
                    [
                        "mapping": "BPM *0.5",
                        "parameters": [],
                    ],
                    [
                        "mapping": "BPM *2",
                        "parameters": [],
                    ],
                ],
            ],
            "/clyphx/simpler_clear_slices": [
                "description":
                    "Clear all Slices when in Transient or Manual Slicing Mode.",
                "parameters": [],
                "standalone": false,
                "track_based": true,
                "variations": [
                    [
                        "mapping": "CLR",
                        "parameters": [],
                    ]
                ],
            ],
            "/clyphx/simpler_crop": [
                "description": "Crop the loaded Sample.",
                "parameters": [],
                "standalone": false,
                "track_based": true,
                "variations": [
                    [
                        "mapping": "CROP",
                        "parameters": [],
                    ]
                ],
            ],
            "/clyphx/simpler_delete_slice": [
                "description":
                    "Delete the selected Slice when in Transient or Manual Slicing Mode.",
                "parameters": [],
                "standalone": false,
                "track_based": true,
                "variations": [
                    [
                        "mapping": "DEL",
                        "parameters": [],
                    ]
                ],
            ],
            "/clyphx/simpler_end_marker": [
                "description":
                    "Adjust the Sampler's End Marker (in the range of 0 - 127).",
                "parameters": [
                    [
                        "name": "End Marker",
                        "type": "number",
                        "isRequired": true,
                        "allowsRelative": true,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": false,
                "track_based": true,
                "variations": [
                    [
                        "mapping": "END",
                        "parameters": ["End Marker"],
                    ]
                ],
            ],
            "/clyphx/simpler_gain": [
                "description":
                    "Adjust the Sample's Gain value (in the range of 0 - 127).",
                "parameters": [
                    [
                        "name": "Gain Value",
                        "type": "number",
                        "isRequired": true,
                        "allowsRelative": true,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": false,
                "track_based": true,
                "variations": [
                    [
                        "mapping": "GAIN",
                        "parameters": ["Gain Value"],
                    ]
                ],
            ],
            "/clyphx/simpler_gate_trigger": [
                "description": "Toggle Gate Trigger Mode.",
                "parameters": [
                    [
                        "name": "Gate Trigger State",
                        "type": "boolean",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": false,
                "track_based": true,
                "variations": [
                    [
                        "mapping": "GATE",
                        "parameters": [],
                    ],
                    [
                        "mapping": "GATE ON",
                        "parameters": [],
                    ],
                    [
                        "mapping": "GATE OFF",
                        "parameters": [],
                    ],
                ],
            ],
            "/clyphx/simpler_multi_scroll": [
                "description":
                    "Adjust the primary property of the current Slicing Mode.",
                "parameters": [
                    [
                        "name": "Relative Direction",
                        "type": "string",
                        "isRequired": true,
                        "allowsRelative": false,
                        "supportedKeywords": ["<", ">"],
                    ]
                ],
                "standalone": false,
                "track_based": true,
                "variations": [
                    [
                        "mapping": "MULT <",
                        "parameters": [],
                    ],
                    [
                        "mapping": "MULT >",
                        "parameters": [],
                    ],
                ],
            ],
            "/clyphx/simpler_playback_mode": [
                "description": "Control Simpler's Playback Mode.",
                "parameters": [
                    [
                        "name": "Playback Mode",
                        "type": "playbackMode",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": false,
                "track_based": true,
                "variations": [
                    [
                        "mapping": "PLAYMODE",
                        "parameters": [],
                    ],
                    [
                        "mapping": "PLAYMODE CLASSIC",
                        "parameters": [],
                    ],
                    [
                        "mapping": "PLAYMODE 1-SHOT",
                        "parameters": [],
                    ],
                    [
                        "mapping": "PLAYMODE SLICE",
                        "parameters": [],
                    ],
                ],
            ],
            "/clyphx/simpler_pad_slicing": [
                "description":
                    "Toggle Pad Slicing. When on, Slices can be created by playing notes on a MIDI controller (starting at C1) while the Sample is playing back.",
                "parameters": [
                    [
                        "name": "Pad Slicing State",
                        "type": "boolean",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": false,
                "track_based": true,
                "variations": [
                    [
                        "mapping": "PSLICE",
                        "parameters": [],
                    ],
                    [
                        "mapping": "PSLICE ON",
                        "parameters": [],
                    ],
                    [
                        "mapping": "PSLICE OFF",
                        "parameters": [],
                    ],
                ],
            ],
            "/clyphx/simpler_nudge_slice": [
                "description":
                    "Nudge the selected slice Backwards or Forwards when in Transient or Manual Slicing Mode.",
                "parameters": [
                    [
                        "name": "Relative Direction",
                        "type": "string",
                        "isRequired": true,
                        "allowsRelative": false,
                        "supportedKeywords": ["<", ">"],
                    ]
                ],
                "standalone": false,
                "track_based": true,
                "variations": [
                    [
                        "mapping": "NUDGE <",
                        "parameters": [],
                    ],
                    [
                        "mapping": "NUDGE >",
                        "parameters": [],
                    ],
                ],
            ],
            "/clyphx/simpler_reset_slices": [
                "description":
                    "Reset all Slices back to their default positions when in Transient or Manual Slicing Mode.",
                "parameters": [],
                "standalone": false,
                "track_based": true,
                "variations": [
                    [
                        "mapping": "RESET",
                        "parameters": [],
                    ]
                ],
            ],
            "/clyphx/simpler_retrigger": [
                "description": "Toggle Retrigger.",
                "parameters": [
                    [
                        "name": "Retrigger State",
                        "type": "boolean",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": false,
                "track_based": true,
                "variations": [
                    [
                        "mapping": "RETRIG",
                        "parameters": [],
                    ],
                    [
                        "mapping": "RETRIG ON",
                        "parameters": [],
                    ],
                    [
                        "mapping": "RETRIG OFF",
                        "parameters": [],
                    ],
                ],
            ],
            "/clyphx/simpler_reverse": [
                "description": "Reverse the loaded Sample.",
                "parameters": [],
                "standalone": false,
                "track_based": true,
                "variations": [
                    [
                        "mapping": "REV",
                        "parameters": [],
                    ]
                ],
            ],
            "/clyphx/simpler_slicing_mode": [
                "description": "Control Simpler's Slicing Mode.",
                "parameters": [
                    [
                        "name": "Slicing Mode",
                        "type": "slicingMode",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": false,
                "track_based": true,
                "variations": [
                    [
                        "mapping": "SMODE",
                        "parameters": [],
                    ],
                    [
                        "mapping": "SMODE TRANSIENT",
                        "parameters": [],
                    ],
                    [
                        "mapping": "SMODE BEAT",
                        "parameters": [],
                    ],
                    [
                        "mapping": "SMODE REGION",
                        "parameters": [],
                    ],
                    [
                        "mapping": "SMODE MANUAL",
                        "parameters": [],
                    ],
                ],
            ],
            "/clyphx/simpler_slicing_playback_mode": [
                "description": "Control Simpler's Slice Playback Mode.",
                "parameters": [
                    [
                        "name": "Slice Playback Mode",
                        "type": "slicingPlaybackMode",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": false,
                "track_based": true,
                "variations": [
                    [
                        "mapping": "SPLAYMODE",
                        "parameters": [],
                    ],
                    [
                        "mapping": "SPLAYMODE MONO",
                        "parameters": [],
                    ],
                    [
                        "mapping": "SPLAYMODE POLY",
                        "parameters": [],
                    ],
                    [
                        "mapping": "SPLAYMODE THRU",
                        "parameters": [],
                    ],
                ],
            ],
            "/clyphx/simpler_start_marker": [
                "description":
                    "Adjust the Sample's Start Marker (in the range of 0 - 127).",
                "parameters": [
                    [
                        "name": "Start Marker",
                        "type": "number",
                        "isRequired": true,
                        "allowsRelative": true,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": false,
                "track_based": true,
                "variations": [
                    [
                        "mapping": "START",
                        "parameters": ["Start Marker"],
                    ]
                ],
            ],
            "/clyphx/simpler_to_drum_rack": [
                "description": "Convert Simpler slices to a Drum Rack.",
                "parameters": [],
                "standalone": false,
                "track_based": true,
                "variations": [
                    [
                        "mapping": "TODR",
                        "parameters": [],
                    ]
                ],
            ],
            "/clyphx/simpler_warp": [
                "description": "Toggle Warping.",
                "parameters": [
                    [
                        "name": "Warp State",
                        "type": "boolean",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": false,
                "track_based": true,
                "variations": [
                    [
                        "mapping": "WARP",
                        "parameters": [],
                    ],
                    [
                        "mapping": "WARP ON",
                        "parameters": [],
                    ],
                    [
                        "mapping": "WARP OFF",
                        "parameters": [],
                    ],
                ],
            ],
            "/clyphx/simpler_warp_as": [
                "description": "Trigger Warp As.",
                "parameters": [],
                "standalone": false,
                "track_based": true,
                "variations": [
                    [
                        "mapping": "WARP AS",
                        "parameters": [],
                    ]
                ],
            ],
            "/clyphx/simpler_warp_mode": [
                "description": "Adjust the Sample's Warp Mode.",
                "parameters": [
                    [
                        "name": "Warp Mode",
                        "type": "warpMode",
                        "isRequired": true,
                        "allowsRelative": true,
                        "supportedKeywords": ["<", ">"],
                    ]
                ],
                "standalone": false,
                "track_based": true,
                "variations": [
                    [
                        "mapping": "WARPMODE",
                        "parameters": ["Warp Mode"],
                    ],
                    [
                        "mapping": "WARPMODE <",
                        "parameters": [],
                    ],
                    [
                        "mapping": "WARPMODE >",
                        "parameters": [],
                    ],
                ],
            ],
        ],
        "Snapshot": [
            "/clyphx/recall_snapshot": [
                "description": "Recall a Snapshot.",
                "parameters": [
                    [
                        "name": "Ramp Duration",
                        "type": "number",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": true,
                "requires_identifier": true,
                "variations": [
                    [
                        "mapping": "RECALL",
                        "parameters": [],
                    ],
                    [
                        "mapping": "RECALL RAMP",
                        "parameters": ["Ramp Duration"],
                    ],
                    [
                        "mapping": "RECALL RAMPS",
                        "parameters": ["Ramp Duration"],
                    ],
                ],
            ],
            "/clyphx/store_snapshot": [
                "description": "Store a Snapshot.",
                "parameters": [
                    [
                        "name": "Device Index",
                        "type": "number",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": ["ALL", "RACKS"],
                    ],
                    [
                        "name": "Device Name",
                        "type": "deviceName",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ],
                ],
                "standalone": true,
                "requires_identifier": true,
                "variations": [
                    [
                        "mapping": "SNAP",
                        "parameters": [],
                    ],
                    [
                        "mapping": "SNAP DEV",
                        "parameters": ["Device Index"],
                    ],
                    [
                        "mapping": "SNAP DEV",
                        "parameters": ["Device Name"],
                    ],
                    [
                        "mapping": "SNAP MIX",
                        "parameters": [],
                    ],
                    [
                        "mapping": "SNAP MIX+",
                        "parameters": [],
                    ],
                    [
                        "mapping": "SNAP MIX-",
                        "parameters": [],
                    ],
                    [
                        "mapping": "SNAP MIXS",
                        "parameters": [],
                    ],
                    [
                        "mapping": "SNAP PLAY",
                        "parameters": [],
                    ],
                ],
            ],
            "/clyphx/delete_snapshot": [
                "description": "Delete the Snap with the specified name.",
                "parameters": [
                    [
                        "name": "Snapshot Name",
                        "type": "string",
                        "isRequired": true,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "SNAPDEL",
                        "parameters": ["Snapshot Name"],
                    ]
                ],
            ],
            "/clyphx/delete_all_snapshots": [
                "description": "Delete all Snaps stored within the Set.",
                "parameters": [],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "SNAPDELALL",
                        "parameters": [],
                    ]
                ],
            ],
            "/clyphx/show_snapshots": [
                "description":
                    "Create a MIDI Track at the end of the Track list that contains an X-Clip for each Snap stored within the Set.",
                "parameters": [],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "SNAPSHOW",
                        "parameters": [],
                    ]
                ],
            ],
            "/clyphx/store_legacy_snapshot": [
                "description": "Store a legacy Snap.",
                "parameters": [],
                "standalone": true,
                "requires_identifier": true,
                "requires_xclip": true,
                "legacy": true,
                "variations": [
                    [
                        "mapping": "SNAPLEG",
                        "parameters": [],
                    ]
                ],
            ],
            "/clyphx/recall_legacy_snapshot": [
                "description":
                    "Recall the legacy Snap with the specified Identifier.",
                "parameters": [],
                "standalone": true,
                "requires_identifier": true,
                "requires_xclip": true,
                "legacy": true,
                "variations": [
                    [
                        "mapping": "RECLEG",
                        "parameters": [],
                    ]
                ],
            ],
        ],
        "Track": [
            "/clyphx/add_clip": [
                "description": "Create a MIDI Clip.",
                "parameters": [
                    [
                        "name": "Scene Index",
                        "type": "sceneIndex",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": ["SEL", "LAST", "EMPTY"],
                    ],
                    [
                        "name": "Clip Length",
                        "type": "number",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ],
                ],
                "standalone": false,
                "track_based": true,
                "variations": [
                    [
                        "mapping": "ADDCLIP",
                        "parameters": [],
                    ],
                    [
                        "mapping": "ADDCLIP",
                        "parameters": ["Scene Index"],
                    ],
                    [
                        "mapping": "ADDCLIP",
                        "parameters": ["Scene Index", "Clip Length"],
                    ],
                ],
            ],
            "/clyphx/add_stop_button": [
                "description": "Add a Stop Button to a Clip Slot.",
                "parameters": [
                    [
                        "name": "Scene Index",
                        "type": "sceneIndex",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": ["SEL", "LAST", "ALL"],
                    ]
                ],
                "standalone": false,
                "track_based": true,
                "variations": [
                    [
                        "mapping": "ADDSTOP",
                        "parameters": [],
                    ],
                    [
                        "mapping": "ADDSTOP",
                        "parameters": ["Scene Index"],
                    ],
                ],
            ],
            "/clyphx/arm": [
                "description": "Toggle Track Arm.",
                "parameters": [
                    [
                        "name": "Arm State",
                        "type": "boolean",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": false,
                "track_based": true,
                "variations": [
                    [
                        "mapping": "ARM",
                        "parameters": [],
                    ],
                    [
                        "mapping": "ARM ON",
                        "parameters": [],
                    ],
                    [
                        "mapping": "ARM OFF",
                        "parameters": [],
                    ],
                ],
            ],
            "/clyphx/track_color": [
                "description": "Set the color of the Track.",
                "parameters": [
                    [
                        "name": "Color Index",
                        "type": "number",
                        "isRequired": true,
                        "allowsRelative": true,
                        "supportedKeywords": ["<", ">"],
                    ]
                ],
                "standalone": false,
                "track_based": true,
                "variations": [
                    [
                        "mapping": "COLOR",
                        "parameters": ["Color Index"],
                    ],
                    [
                        "mapping": "COLOR <",
                        "parameters": [],
                    ],
                    [
                        "mapping": "COLOR >",
                        "parameters": [],
                    ],
                ],
            ],
            "/clyphx/copy_clip": [
                "description":
                    "Copy the Clip playing on the Track for use with the PASTECLIP Action.",
                "parameters": [
                    [
                        "name": "Scene Index",
                        "type": "sceneIndex",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": ["SEL", "LAST"],
                    ]
                ],
                "standalone": false,
                "track_based": true,
                "variations": [
                    [
                        "mapping": "COPYCLIP",
                        "parameters": [],
                    ],
                    [
                        "mapping": "COPYCLIP",
                        "parameters": ["Scene Index"],
                    ],
                ],
            ],
            "/clyphx/delete_track": [
                "description":
                    "Delete the Track. It is not possible to Delete a Track if it's the only Track in the Set or if it's the Master Track.",
                "parameters": [],
                "standalone": false,
                "track_based": true,
                "variations": [
                    [
                        "mapping": "DEL",
                        "parameters": [],
                    ]
                ],
            ],
            "/clyphx/duplicate_track": [
                "description":
                    "Duplicate the Track. Returns and the Master Track cannot be Duplicated.",
                "parameters": [],
                "standalone": false,
                "track_based": true,
                "variations": [
                    [
                        "mapping": "DUPE",
                        "parameters": [],
                    ]
                ],
            ],
            "/clyphx/fold_track": [
                "description": "Toggle Track Fold.",
                "parameters": [
                    [
                        "name": "Fold State",
                        "type": "boolean",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": false,
                "track_based": true,
                "variations": [
                    [
                        "mapping": "FOLD",
                        "parameters": [],
                    ],
                    [
                        "mapping": "FOLD ON",
                        "parameters": [],
                    ],
                    [
                        "mapping": "FOLD OFF",
                        "parameters": [],
                    ],
                ],
            ],
            "/clyphx/input_routing_type": [
                "description": "Adjust Input Routing.",
                "parameters": [
                    [
                        "name": "Input Routing",
                        "type": "string",
                        "isRequired": true,
                        "allowsRelative": true,
                        "supportedKeywords": ["<", ">"],
                    ]
                ],
                "standalone": false,
                "track_based": true,
                "variations": [
                    [
                        "mapping": "IN",
                        "parameters": ["Input Routing"],
                    ],
                    [
                        "mapping": "IN >",
                        "parameters": [],
                    ],
                ],
            ],
            "/clyphx/input_routing_channel": [
                "description": "Adjust Input Sub-Routing.",
                "parameters": [
                    [
                        "name": "Input Sub-Routing",
                        "type": "string",
                        "isRequired": true,
                        "allowsRelative": true,
                        "supportedKeywords": ["<", ">"],
                    ]
                ],
                "standalone": false,
                "track_based": true,
                "variations": [
                    [
                        "mapping": "INSUB",
                        "parameters": ["Input Sub-Routing"],
                    ],
                    [
                        "mapping": "INSUB >",
                        "parameters": [],
                    ],
                ],
            ],
            "/clyphx/track_song_position": [
                "description":
                    "Jump the Playback Position of the playing Clip on the Track.",
                "parameters": [
                    [
                        "name": "Relative Jump Value",
                        "type": "relativeJumpValue",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": false,
                "track_based": true,
                "variations": [
                    [
                        "mapping": "JUMP <",
                        "parameters": [],
                    ],
                    [
                        "mapping": "JUMP >",
                        "parameters": [],
                    ],
                    [
                        "mapping": "JUMP <x",
                        "parameters": ["Relative Jump Value"],
                    ],
                    [
                        "mapping": "JUMP >x",
                        "parameters": ["Relative Jump Value"],
                    ],
                ],
            ],
            "/clyphx/monitoring_state": [
                "description": "Control Track Monitoring state.",
                "parameters": [
                    [
                        "name": "Monitoring State",
                        "type": "monitoringState",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": false,
                "track_based": true,
                "variations": [
                    [
                        "mapping": "MON",
                        "parameters": [],
                    ],
                    [
                        "mapping": "MON IN",
                        "parameters": [],
                    ],
                    [
                        "mapping": "MON AUTO",
                        "parameters": [],
                    ],
                    [
                        "mapping": "MON OFF",
                        "parameters": [],
                    ],
                ],
            ],
            "/clyphx/mute": [
                "description": "Toggle Track Mute.",
                "parameters": [
                    [
                        "name": "Mute State",
                        "type": "boolean",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": false,
                "track_based": true,
                "variations": [
                    [
                        "mapping": "MUTE",
                        "parameters": [],
                    ],
                    [
                        "mapping": "MUTE ON",
                        "parameters": [],
                    ],
                    [
                        "mapping": "MUTE OFF",
                        "parameters": [],
                    ],
                ],
            ],
            "/clyphx/track_name": [
                "description": "Set a new name for the Track.",
                "parameters": [
                    [
                        "name": "Track Name",
                        "type": "string",
                        "isRequired": true,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": false,
                "track_based": true,
                "variations": [
                    [
                        "mapping": "NAME",
                        "parameters": ["Track Name"],
                    ]
                ],
            ],
            "/clyphx/append_to_name": [
                "description": "Append to the Track's name.",
                "parameters": [
                    [
                        "name": "Append String",
                        "type": "string",
                        "isRequired": true,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": false,
                "track_based": true,
                "variations": [
                    [
                        "mapping": "NAMEA",
                        "parameters": ["Append String"],
                    ]
                ],
            ],
            "/clyphx/prepend_to_name": [
                "description": "Prepend to the Track's name.",
                "parameters": [
                    [
                        "name": "Prepend String",
                        "type": "string",
                        "isRequired": true,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": false,
                "track_based": true,
                "variations": [
                    [
                        "mapping": "NAMEP",
                        "parameters": ["Prepend String"],
                    ]
                ],
            ],
            "/clyphx/output_routing_type": [
                "description": "Adjust Output Routing.",
                "parameters": [
                    [
                        "name": "Output Routing",
                        "type": "string",
                        "isRequired": true,
                        "allowsRelative": true,
                        "supportedKeywords": ["<", ">"],
                    ]
                ],
                "standalone": false,
                "track_based": true,
                "variations": [
                    [
                        "mapping": "OUT",
                        "parameters": ["Output Routing"],
                    ],
                    [
                        "mapping": "OUT >",
                        "parameters": [],
                    ],
                ],
            ],
            "/clyphx/output_routing_channel": [
                "description": "Adjust Output Sub-Routing.",
                "parameters": [
                    [
                        "name": "Output Sub-Routing",
                        "type": "string",
                        "isRequired": true,
                        "allowsRelative": true,
                        "supportedKeywords": ["<", ">"],
                    ]
                ],
                "standalone": false,
                "track_based": true,
                "variations": [
                    [
                        "mapping": "OUTSUB",
                        "parameters": ["Output Sub-Routing"],
                    ],
                    [
                        "mapping": "OUTSUB >",
                        "parameters": [],
                    ],
                ],
            ],
            "/clyphx/pan": [
                "description": "Adjust Track Pan.",
                "parameters": [
                    [
                        "name": "Pan Value",
                        "type": "number",
                        "isRequired": true,
                        "allowsRelative": true,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": false,
                "track_based": true,
                "variations": [
                    [
                        "mapping": "PAN",
                        "parameters": ["Pan Value"],
                    ]
                ],
            ],
            "/clyphx/pan_left": [
                "description": "Adjust Track Left Split Stereo Panning.",
                "parameters": [
                    [
                        "name": "Pan Value",
                        "type": "number",
                        "isRequired": true,
                        "allowsRelative": true,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": false,
                "track_based": true,
                "variations": [
                    [
                        "mapping": "PANL",
                        "parameters": ["Pan Value"],
                    ]
                ],
            ],
            "/clyphx/pan_right": [
                "description": "Adjust Track Right Split Stereo Panning.",
                "parameters": [
                    [
                        "name": "Pan Value",
                        "type": "number",
                        "isRequired": true,
                        "allowsRelative": true,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": false,
                "track_based": true,
                "variations": [
                    [
                        "mapping": "PANR",
                        "parameters": ["Pan Value"],
                    ]
                ],
            ],
            "/clyphx/paste_clip": [
                "description":
                    "Paste the copied Clip into the specified Clip Slot on the Track.",
                "parameters": [
                    [
                        "name": "Scene Index",
                        "type": "sceneIndex",
                        "isRequired": true,
                        "allowsRelative": false,
                        "supportedKeywords": ["SEL", "LAST", "EMPTY"],
                    ]
                ],
                "standalone": false,
                "track_based": true,
                "variations": [
                    [
                        "mapping": "PASTECLIP",
                        "parameters": ["Scene Index"],
                    ]
                ],
            ],
            "/clyphx/paste_clip_empty": [
                "description":
                    "Paste the copied Clip into the first empty Clip Slot on the Track.",
                "parameters": [
                    [
                        "name": "Scene Index",
                        "type": "sceneIndex",
                        "isRequired": true,
                        "allowsRelative": false,
                        "supportedKeywords": ["LAST"],
                    ]
                ],
                "standalone": false,
                "track_based": true,
                "variations": [
                    [
                        "mapping": "PASTECLIPE",
                        "parameters": ["Scene Index"],
                    ]
                ],
            ],
            "/clyphx/play_clip": [
                "description": "Launch a Clip Slot.",
                "parameters": [
                    [
                        "name": "Scene Index",
                        "type": "sceneIndex",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": ["SEL", "LAST", "EMPTY"],
                    ],
                    [
                        "name": "Scene Range",
                        "type": "string",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ],
                    [
                        "name": "Scene Offset",
                        "type": "number",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ],
                ],
                "standalone": false,
                "track_based": true,
                "variations": [
                    [
                        "mapping": "PLAY",
                        "parameters": [],
                    ],
                    [
                        "mapping": "PLAY",
                        "parameters": ["Scene Index"],
                    ],
                    [
                        "mapping": "PLAY RND",
                        "parameters": [],
                    ],
                    [
                        "mapping": "PLAY RND",
                        "parameters": ["Scene Range"],
                    ],
                    [
                        "mapping": "PLAY <",
                        "parameters": [],
                    ],
                    [
                        "mapping": "PLAY >",
                        "parameters": [],
                    ],
                    [
                        "mapping": "PLAY <x",
                        "parameters": ["Scene Offset"],
                    ],
                    [
                        "mapping": "PLAY >x",
                        "parameters": ["Scene Offset"],
                    ],
                ],
            ],
            "/clyphx/play_clip_conditional": [
                "description":
                    "Launch the specified Clip Slot. Will not Launch empty Clip Slots and does not apply to Group Tracks.",
                "parameters": [
                    [
                        "name": "Scene Index",
                        "type": "sceneIndex",
                        "isRequired": true,
                        "allowsRelative": false,
                        "supportedKeywords": ["RND", "<", ">", "<x", ">x"],
                    ]
                ],
                "standalone": false,
                "track_based": true,
                "variations": [
                    [
                        "mapping": "PLAYC",
                        "parameters": ["Scene Index"],
                    ]
                ],
            ],
            "/clyphx/play_clip_legato": [
                "description":
                    "Launch the specified Clip Slot with Legato using the current Global Quantization value. Will not Launch empty Clip Slots and does not apply to Group Tracks.",
                "parameters": [
                    [
                        "name": "Scene Index",
                        "type": "sceneIndex",
                        "isRequired": true,
                        "allowsRelative": false,
                        "supportedKeywords": ["RND", "<", ">", "<x", ">x"],
                    ]
                ],
                "standalone": false,
                "track_based": true,
                "variations": [
                    [
                        "mapping": "PLAYL",
                        "parameters": ["Scene Index"],
                    ]
                ],
            ],
            "/clyphx/play_clip_quantized": [
                "description":
                    "Launch the specified Clip Slot using a specific quantization value (regardless of the current Global Quantization value or the Launch Quantization value of the Clip). Will not Launch empty Clip Slots and does not apply to Group Tracks.",
                "parameters": [
                    [
                        "name": "Quantize Value",
                        "type": "quantizeValue",
                        "isRequired": true,
                        "allowsRelative": false,
                        "supportedKeywords": ["NONE"],
                    ],
                    [
                        "name": "Scene Index",
                        "type": "sceneIndex",
                        "isRequired": true,
                        "allowsRelative": false,
                        "supportedKeywords": ["RND", "<", ">", "<x", ">x"],
                    ],
                ],
                "standalone": false,
                "track_based": true,
                "variations": [
                    [
                        "mapping": "PLAYQ NONE",
                        "parameters": ["Scene Index"],
                    ]
                ],
            ],
            "/clyphx/play_clip_legato_quantized": [
                "description":
                    "Launch the specified Clip Slot with Legato using a specific quantization value (regardless of the current Global Quantization value or the Launch Quantization value of the Clip). Will not Launch empty Clip Slots and does not apply to Group Tracks.",
                "parameters": [
                    [
                        "name": "Quantize Value",
                        "type": "quantizeValue",
                        "isRequired": true,
                        "allowsRelative": false,
                        "supportedKeywords": ["NONE"],
                    ],
                    [
                        "name": "Scene Index",
                        "type": "sceneIndex",
                        "isRequired": true,
                        "allowsRelative": false,
                        "supportedKeywords": ["RND", "<", ">", "<x", ">x"],
                    ],
                ],
                "standalone": false,
                "track_based": true,
                "variations": [
                    [
                        "mapping": "PLAYLQ NONE",
                        "parameters": ["Scene Index"],
                    ]
                ],
            ],
            "/clyphx/record_clip": [
                "description":
                    "Trigger fixed-length Session Record into a Clip Slot.",
                "parameters": [
                    [
                        "name": "Record Length",
                        "type": "number",
                        "isRequired": true,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ],
                    [
                        "name": "Scene Index",
                        "type": "sceneIndex",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": ["SEL", "LAST", "EMPTY"],
                    ],
                ],
                "standalone": false,
                "track_based": true,
                "variations": [
                    [
                        "mapping": "RECFIX",
                        "parameters": ["Record Length"],
                    ],
                    [
                        "mapping": "RECFIX",
                        "parameters": ["Record Length", "Scene Index"],
                    ],
                ],
            ],
            "/clyphx/remove_stop_button": [
                "description": "Remove a Stop Button from a Clip Slot.",
                "parameters": [
                    [
                        "name": "Scene Index",
                        "type": "sceneIndex",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": ["SEL", "LAST", "ALL"],
                    ]
                ],
                "standalone": false,
                "track_based": true,
                "variations": [
                    [
                        "mapping": "REMSTOP",
                        "parameters": [],
                    ],
                    [
                        "mapping": "REMSTOP",
                        "parameters": ["Scene Index"],
                    ],
                ],
            ],
            "/clyphx/rename_clips": [
                "description": "Rename all Clips on a Track.",
                "parameters": [
                    [
                        "name": "Base Name",
                        "type": "string",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": false,
                "track_based": true,
                "variations": [
                    [
                        "mapping": "RENAMEALL",
                        "parameters": [],
                    ],
                    [
                        "mapping": "RENAMEALL",
                        "parameters": ["Base Name"],
                    ],
                ],
            ],
            "/clyphx/select_track": [
                "description": "Select a Track and highlight a Clip.",
                "parameters": [
                    [
                        "name": "Scene Index",
                        "type": "sceneIndex",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": ["SEL", "LAST", "EMPTY"],
                    ]
                ],
                "standalone": false,
                "track_based": true,
                "variations": [
                    [
                        "mapping": "SEL",
                        "parameters": [],
                    ],
                    [
                        "mapping": "SEL",
                        "parameters": ["Scene Index"],
                    ],
                ],
            ],
            "/clyphx/send": [
                "description": "Adjust a Track Send.",
                "parameters": [
                    [
                        "name": "Send Letter",
                        "type": "trackSendLetter",
                        "isRequired": true,
                        "allowsRelative": false,
                        "supportedKeywords": ["ALL"],
                    ],
                    [
                        "name": "Send Value",
                        "type": "number",
                        "isRequired": true,
                        "allowsRelative": true,
                        "supportedKeywords": [],
                    ],
                ],
                "standalone": false,
                "track_based": true,
                "variations": [
                    [
                        "mapping": "SEND",
                        "parameters": ["Send Letter", "Send Value"],
                    ]
                ],
            ],
            "/clyphx/solo": [
                "description": "Toggle Track Solo.",
                "parameters": [
                    [
                        "name": "Solo State",
                        "type": "boolean",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": false,
                "track_based": true,
                "variations": [
                    [
                        "mapping": "SOLO",
                        "parameters": [],
                    ],
                    [
                        "mapping": "SOLO ON",
                        "parameters": [],
                    ],
                    [
                        "mapping": "SOLO OFF",
                        "parameters": [],
                    ],
                ],
            ],
            "/clyphx/toggle_panning_mode": [
                "description": "Toggle Track Split Stereo Panning.",
                "parameters": [
                    [
                        "name": "Split Pan State",
                        "type": "boolean",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": false,
                "track_based": true,
                "variations": [
                    [
                        "mapping": "SPLITPAN",
                        "parameters": [],
                    ],
                    [
                        "mapping": "SPLITPAN ON",
                        "parameters": [],
                    ],
                    [
                        "mapping": "SPLITPAN OFF",
                        "parameters": [],
                    ],
                ],
            ],
            "/clyphx/stop_track": [
                "description": "Stop the playing Clip on the Track.",
                "parameters": [],
                "standalone": false,
                "track_based": true,
                "variations": [
                    [
                        "mapping": "STOP",
                        "parameters": [],
                    ],
                    [
                        "mapping": "STOP NQ",
                        "parameters": [],
                    ],
                ],
            ],
            "/clyphx/volume": [
                "description": "Adjust Track Volume.",
                "parameters": [
                    [
                        "name": "Volume Value",
                        "type": "number",
                        "isRequired": true,
                        "allowsRelative": true,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": false,
                "track_based": true,
                "variations": [
                    [
                        "mapping": "VOL",
                        "parameters": ["Volume Value"],
                    ]
                ],
            ],
            "/clyphx/crossfade_assign": [
                "description": "Control Track Crossfade assignment.",
                "parameters": [
                    [
                        "name": "Crossfade Assign",
                        "type": "crossfadeAssign",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": false,
                "track_based": true,
                "variations": [
                    [
                        "mapping": "XFADE",
                        "parameters": [],
                    ],
                    [
                        "mapping": "XFADE A",
                        "parameters": [],
                    ],
                    [
                        "mapping": "XFADE B",
                        "parameters": [],
                    ],
                    [
                        "mapping": "XFADE OFF",
                        "parameters": [],
                    ],
                ],
            ],
        ],
        "Transport": [
            "/clyphx/metronome": [
                "description": "Toggle Metronome.",
                "parameters": [
                    [
                        "name": "Metronome State",
                        "type": "boolean",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "METRO",
                        "parameters": [],
                    ],
                    [
                        "mapping": "METRO ON",
                        "parameters": [],
                    ],
                    [
                        "mapping": "METRO OFF",
                        "parameters": [],
                    ],
                ],
            ],
            "/clyphx/start_playing": [
                "description": "Toggle Playback.",
                "parameters": [
                    [
                        "name": "Playback State",
                        "type": "boolean",
                        "isRequired": false,
                        "allowsRelative": false,
                        "supportedKeywords": [],
                    ]
                ],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "SETPLAY",
                        "parameters": [],
                    ],
                    [
                        "mapping": "SETPLAY ON",
                        "parameters": [],
                    ],
                    [
                        "mapping": "SETPLAY OFF",
                        "parameters": [],
                    ],
                ],
            ],
            "/clyphx/stop_playing": [
                "description": "Stop Playback.",
                "parameters": [],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "SETSTOP",
                        "parameters": [],
                    ]
                ],
            ],
            "/clyphx/continue_playing": [
                "description":
                    "Continue playback from the last stop point. This is only useful when triggered from an X-Control or X-OSC.",
                "parameters": [],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "SETCONT",
                        "parameters": [],
                    ]
                ],
            ],
            "/clyphx/tap_tempo": [
                "description": "Tap Tempo.",
                "parameters": [],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "TAPBPM",
                        "parameters": [],
                    ]
                ],
            ],
            "/clyphx/stop_all_clips": [
                "description": "Stop all Clips.",
                "parameters": [],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "STOPALL",
                        "parameters": [],
                    ],
                    [
                        "mapping": "STOPALL NQ",
                        "parameters": [],
                    ],
                ],
            ],
            "/clyphx/play_selection": [
                "description":
                    "Play the selection in Arrangement View if there is one.",
                "parameters": [],
                "standalone": true,
                "variations": [
                    [
                        "mapping": "SETPLAYSEL",
                        "parameters": [],
                    ]
                ],
            ],
        ],
    ]
}
