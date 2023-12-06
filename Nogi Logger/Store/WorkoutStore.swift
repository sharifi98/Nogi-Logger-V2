//
//  WorkoutStore.swift
//  Nogi Logger
//
//  Created by Hossein Sharifi on 27/11/2023.
//

import SwiftUI

@Observable
class WorkoutStore {

    var workouts = [Workout]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(workouts) {
                UserDefaults.standard.setValue(encoded, forKey: "Workouts")
            }
        }
    }
    
    init() {
        if let savedWorkouts = UserDefaults.standard.data(forKey: "Workouts") {
            if let decodedWorkouts = try? JSONDecoder().decode([Workout].self, from: savedWorkouts) {
                workouts = decodedWorkouts
            }
        }
    }
    
    
    var sample = Workout.sample
    
    
    
}

