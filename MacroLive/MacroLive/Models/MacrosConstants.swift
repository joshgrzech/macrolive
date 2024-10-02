struct MacroConstants {
    static func getMacro(category: String, name: String) -> [[String: Any]]? {
        return allMacros[category]?[name]
    }
    static let allMacros: [String: [String: [[String: Any]]]] = [
        "Arrangement": [
            "Duplicate Selected Track": [
                [
                    "path": "/clyphx/duplicate_track",
                    "Track Index": "SEL"
                ]
            ],
            "Delete Selected Track": [
                [
                    "path": "/clyphx/delete_track",
                    "Track Index": "SEL"
                ]
            ],
            "Group Selected Tracks": [
                [
                    "path": "/clyphx/group_track",
                    "Track Index": "SEL"
                ]
            ],
            "Ungroup Selected Tracks": [
                [
                    "path": "/clyphx/ungroup_track",
                    "Track Index": "SEL"
                ]
            ],
            "Set Tempo to 120 BPM": [
                [
                    "path": "/clyphx/adjust_tempo",
                    "Tempo": "120"
                ]
            ],
            "Increase Tempo by 5 BPM": [
                [
                    "path": "/clyphx/adjust_tempo",
                    "Relative Adjust Value": ">5"
                ]
            ],
            "Decrease Tempo by 5 BPM": [
                [
                    "path": "/clyphx/adjust_tempo",
                    "Relative Adjust Value": "<5"
                ]
            ],
            "Jump to Next Locator": [
                [
                    "path": "/clyphx/jump_to_locator",
                    "Relative Direction": ">"
                ]
            ],
            "Jump to Previous Locator": [
                [
                    "path": "/clyphx/jump_to_locator",
                    "Relative Direction": "<"
                ]
            ],
            "Set Loop to 8 Bars": [
                [
                    "path": "/clyphx/loop_action",
                    "Loop Length": "8B"
                ]
            ],
            "Double Loop Length": [
                [
                    "path": "/clyphx/loop_action",
                    "Loop Multiplier": "2"
                ]
            ],
            "Halve Loop Length": [
                [
                    "path": "/clyphx/loop_action",
                    "Loop Multiplier": "0.5"
                ]
            ]
        ],
        "Clip": [
            "Duplicate Selected Clip": [
                [
                    "path": "/clyphx/clip_action",
                    "Clip Name": "SEL",
                    "variations": [
                        "DUPE"
                    ]
                ]
            ],
            "Quantize Clip to 1/16": [
                [
                    "path": "/clyphx/clip_action",
                    "Clip Name": "SEL",
                    "Quantize Value": "1/16",
                    "variations": [
                        "QNTZ x"
                    ]
                ]
            ],
            "Double Clip Loop Length": [
                [
                    "path": "/clyphx/clip_loop",
                    "Clip Name": "SEL",
                    "Loop Multiplier": "2",
                    "variations": [
                        "*x"
                    ]
                ]
            ],
            "Halve Clip Loop Length": [
                [
                    "path": "/clyphx/clip_loop",
                    "Clip Name": "SEL",
                    "Loop Multiplier": "0.5",
                    "variations": [
                        "*x"
                    ]
                ]
            ],
            "Reverse Clip": [
                [
                    "path": "/clyphx/clip_action",
                    "Clip Name": "SEL",
                    "variations": [
                        "REV"
                    ]
                ]
            ],
            "Transpose Clip Up One Octave": [
                [
                    "path": "/clyphx/clip_action",
                    "Clip Name": "SEL",
                    "Transpose Value": "12",
                    "variations": [
                        "SEMI x"
                    ]
                ]
            ],
            "Transpose Clip Down One Octave": [
                [
                    "path": "/clyphx/clip_action",
                    "Clip Name": "SEL",
                    "Transpose Value": "-12",
                    "variations": [
                        "SEMI x"
                    ]
                ]
            ]
        ],
        "Device": [
            "Toggle Device On/Off": [
                [
                    "path": "/clyphx/device_action",
                    "Device Name": "SEL",
                    "variations": [
                        ""
                    ]
                ]
            ],
            "Randomize Device Parameters": [
                [
                    "path": "/clyphx/device_action",
                    "Device Name": "SEL",
                    "variations": [
                        "RND"
                    ]
                ]
            ],
            "Reset Device Parameters": [
                [
                    "path": "/clyphx/device_action",
                    "Device Name": "SEL",
                    "variations": [
                        "RESET"
                    ]
                ]
            ],
            "Show Device Chains": [
                [
                    "path": "/clyphx/device_action",
                    "Device Name": "SEL",
                    "variations": [
                        "SHOWCH"
                    ]
                ]
            ],
            "Next Device Chain": [
                [
                    "path": "/clyphx/device_action",
                    "Device Name": "SEL",
                    "variations": [
                        "CSEL >"
                    ]
                ]
            ],
            "Previous Device Chain": [
                [
                    "path": "/clyphx/device_action",
                    "Device Name": "SEL",
                    "variations": [
                        "CSEL <"
                    ]
                ]
            ]
        ],
        "Global": [
            "Save Live Set": [
                [
                    "path": "/clyphx/send_key",
                    "Keystroke": "s"
                ]
            ],
            "Undo": [
                [
                    "path": "/clyphx/undo"
                ]
            ],
            "Redo": [
                [
                    "path": "/clyphx/redo"
                ]
            ],
            "Toggle Metronome": [
                [
                    "path": "/clyphx/metronome"
                ]
            ],
            "Start/Stop Playback": [
                [
                    "path": "/clyphx/start_playing"
                ]
            ],
            "Stop All Clips": [
                [
                    "path": "/clyphx/stop_all_clips"
                ]
            ],
            "Capture MIDI": [
                [
                    "path": "/clyphx/capture_midi"
                ]
            ],
            "Set Global Quantize to 1/16": [
                [
                    "path": "/clyphx/adjust_global_quantize",
                    "Quantize Value": "1/16"
                ]
            ],
            "Toggle Draw Mode": [
                [
                    "path": "/clyphx/draw_mode"
                ]
            ]
        ],
        "Music Theory": [
            "Transpose Notes Up One Semitone": [
                [
                    "path": "/clyphx/clip_notes",
                    "Clip Name": "SEL",
                    "Relative Adjust Value": ">1",
                    "variations": [
                        "SEMI <x",
                        "SEMI >x"
                    ]
                ]
            ],
            "Transpose Notes Down One Semitone": [
                [
                    "path": "/clyphx/clip_notes",
                    "Clip Name": "SEL",
                    "Relative Adjust Value": "<1",
                    "variations": [
                        "SEMI <x",
                        "SEMI >x"
                    ]
                ]
            ],
            "Invert Note Pitches": [
                [
                    "path": "/clyphx/clip_notes",
                    "Clip Name": "SEL",
                    "variations": [
                        "INV"
                    ]
                ]
            ]
        ],
        "Rhythm": [
            "Set Note Repeat to 1/8": [
                [
                    "path": "/clyphx/set_note_repeat",
                    "Note Repeat Rate": "1/8"
                ]
            ],
            "Double Note Repeat Rate": [
                [
                    "path": "/clyphx/set_note_repeat",
                    "Note Repeat Rate": "*2"
                ]
            ],
            "Halve Note Repeat Rate": [
                [
                    "path": "/clyphx/set_note_repeat",
                    "Note Repeat Rate": "*0.5"
                ]
            ],
            "Quantize Notes to 1/16": [
                [
                    "path": "/clyphx/clip_notes",
                    "Clip Name": "SEL",
                    "Quantize Value": "1/16",
                    "variations": [
                        "QNTZ x"
                    ]
                ]
            ],
            "Humanize Note Velocity": [
                [
                    "path": "/clyphx/clip_notes",
                    "Clip Name": "SEL",
                    "variations": [
                        "VELO RND"
                    ]
                ]
            ]
        ],
        "Session": [
            "Create New Scene": [
                [
                    "path": "/clyphx/add_scene"
                ]
            ],
            "Duplicate Selected Scene": [
                [
                    "path": "/clyphx/scene_action",
                    "Scene Index": "SEL",
                    "variations": [
                        "DUPE"
                    ]
                ]
            ],
            "Delete Selected Scene": [
                [
                    "path": "/clyphx/scene_action",
                    "Scene Index": "SEL",
                    "variations": [
                        "DEL"
                    ]
                ]
            ],
            "Launch Scene 5": [
                [
                    "path": "/clyphx/scene_action",
                    "Scene Index": "5",
                    "variations": [
                        "x"
                    ]
                ]
            ],
            "Launch Next Scene": [
                [
                    "path": "/clyphx/scene_action",
                    "Relative Direction": ">",
                    "variations": [
                        "<",
                        ">"
                    ]
                ]
            ],
            "Launch Previous Scene": [
                [
                    "path": "/clyphx/scene_action",
                    "Relative Direction": "<",
                    "variations": [
                        "<",
                        ">"
                    ]
                ]
            ]
        ],
        "Simpler": [
            "Slice to Transient Markers": [
                [
                    "path": "/clyphx/simpler_slicing_mode",
                    "Slicing Mode": "Transient",
                    "variations": [
                        "TRANSIENT",
                        "BEAT",
                        "REGION",
                        "MANUAL"
                    ]
                ]
            ],
            "Reverse Sample": [
                [
                    "path": "/clyphx/simpler_reverse"
                ]
            ],
            "Warp Sample to Beats": [
                [
                    "path": "/clyphx/simpler_warp_mode",
                    "Warp Mode": "Beats"
                ]
            ],
            "Crop Sample": [
                [
                    "path": "/clyphx/simpler_crop"
                ]
            ]
        ],
        "Track": [
            "Arm Selected Track": [
                [
                    "path": "/clyphx/arm",
                    "Track Index": "SEL"
                ]
            ],
            "Mute Selected Track": [
                [
                    "path": "/clyphx/mute",
                    "Track Index": "SEL"
                ]
            ],
            "Solo Selected Track": [
                [
                    "path": "/clyphx/solo",
                    "Track Index": "SEL"
                ]
            ],
            "Stop Track": [
                [
                    "path": "/clyphx/stop_track",
                    "Track Index": "SEL"
                ]
            ],
            "Set Volume to -12 dB": [
                [
                    "path": "/clyphx/volume",
                    "Track Index": "SEL",
                    "Volume Value": "-12"
                ]
            ],
            "Pan Hard Left": [
                [
                    "path": "/clyphx/pan",
                    "Track Index": "SEL",
                    "Pan Value": "0"
                ]
            ],
            "Pan Hard Right": [
                [
                    "path": "/clyphx/pan",
                    "Track Index": "SEL",
                    "Pan Value": "127"
                ]
            ],
            "Set Send A to -6 dB": [
                [
                    "path": "/clyphx/send",
                    "Track Index": "SEL",
                    "Send Letter": "A",
                    "Send Value": "-6"
                ]
            ]
        ]
    ]
}
