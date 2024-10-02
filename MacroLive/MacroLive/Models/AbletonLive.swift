//
//  AbletonLive.swift
//  Syncopate
//
//  Created by Joshua Grzech on 8/28/24.
//


import SwiftUI
import Combine

// MARK: - Ableton Live Placeholder

class AbletonLive: ObservableObject {
    @Published var tracks: [Track] = []
    @Published var scenes: [Scene] = []
    @Published var clips: [Clip] = []
    @Published var devices: [Device] = []
    @Published var locators: [Locator] = []
    @Published var controlSurfaces: [ControlSurface] = []

}

struct Track: Identifiable {
    let id = UUID()
    let name: String
}

struct Scene: Identifiable {
    let id = UUID()
    let name: String
}

struct Clip: Identifiable {
    let id = UUID()
    let name: String
}

struct Device: Identifiable {
    let id = UUID()
    let name: String
    let trackID: UUID  // Add trackID to associate devices with tracks
    let parameters: [LiveParameter]?
    let chainCount: Int  // Add chainCount for devices with chains (e.g., InstrumentRack)
}
struct LiveParameter: Identifiable {
    let id = UUID()
    let name: String
}
struct Locator: Identifiable {
    let id = UUID()
    let name: String
}

struct ControlSurface: Identifiable {
    let id = UUID()
    let name: String
}
