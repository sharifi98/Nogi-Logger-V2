//
//  Workout.swift
//  Nogi Logger
//
//  Created by Hossein Sharifi on 27/11/2023.
//


import Foundation


// Struct for a grappling workout
struct WorkoutWithDate: Identifiable, Codable {
    var id = UUID()
    var name: String
    var notes: String
    var startTime: Date
    var endTime: Date
    var submissions: Int
    var taps: Int
    var sweeps: Int
    var takedowns: Int
    var rounds: Int
    var roundLength: Int
    var bodyWeight: Double
    var injured: Bool
    
    var duration: TimeInterval {
        return endTime.timeIntervalSince(startTime)
    }
    
    static var sample: WorkoutWithDate {
        return WorkoutWithDate(name: "NoGi",
                       notes: "",
                       startTime: Date(),
                       endTime: Date()+1,
                       submissions: 5,
                       taps: 2,
                       sweeps: 3,
                       takedowns: 2,
                       rounds: 4,
                       roundLength: 6,
                       bodyWeight: 0.0,
                       injured: false
        )
    }
}

extension WorkoutWithDate {
    static func generateSampleWorkouts(count: Int) -> [WorkoutWithDate] {
        return (1...count).map { _ in
            let randomName = ["Gi", "NoGi"].randomElement() ?? "NoGi"
            
            return WorkoutWithDate(name: randomName,
                           notes: "Today i got my blue belt",
                           startTime: Date(),
                           endTime: Date().addingTimeInterval(3600),
                           submissions: Int.random(in: 0...5),
                           taps: Int.random(in: 0...2),
                           sweeps: Int.random(in: 0...4),
                           takedowns: Int.random(in: 0...4),
                           rounds: Int.random(in: 3...6),
                           roundLength: 6,
                           bodyWeight: 80.0,
                           injured: false)
        }
    }
}

