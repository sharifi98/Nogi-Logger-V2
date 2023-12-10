//
//  Nogi_LoggerApp.swift
//  Nogi Logger
//
//  Created by Hossein Sharifi on 27/11/2023.
//

import SwiftUI

@main
struct Nogi_LoggerApp: App {
    @StateObject private var workoutStore = WorkoutStore()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(workoutStore) // Pass WorkoutStore as environment object
        }
    }
}
