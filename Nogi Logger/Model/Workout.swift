//
//  Workout.swift
//  Nogi Logger
//
//  Created by Hossein Sharifi on 27/11/2023.
//




import Foundation


// Struct for a grappling workout
struct Workout: Identifiable, Codable, Hashable {
    var id = UUID()
    var name: String
    var startTime: Date
    var endTime: Date
    var notes: String
    var submissions: Int
    var taps: Int
    var sweeps: Int
    var takedowns: Int
    var rounds: Int
    var roundLength: Int
    var bodyWeight: Double
    var injured: Bool
    
    
    static var sample: Workout {
        return Workout(name: "NoGi",
                       startTime: Date.now,
                       endTime: Date.now + 3600,
                       notes: "",
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

extension Workout {
    static func generateSampleWorkouts(count: Int) -> [Workout] {
        return (1...count).map { _ in
            let randomName = ["Gi", "NoGi"].randomElement() ?? "NoGi"
            
            return Workout(name: randomName,
                           startTime: Date.now,
                           endTime: Date.now + 3600,
                           notes: "Today i got my blue belt",
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


