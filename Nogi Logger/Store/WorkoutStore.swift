import SwiftUI
import Combine

class WorkoutStore: ObservableObject {
    @Published var workouts = [Workout]() {
        didSet {
            saveWorkouts()
        }
    }

    init() {
        loadWorkouts()
    }

    func addWorkout(_ workout: Workout) {
        workouts.append(workout)
    }

    private func saveWorkouts() {
        if let encoded = try? JSONEncoder().encode(workouts) {
            UserDefaults.standard.setValue(encoded, forKey: "Workouts")
        }
    }

    private func loadWorkouts() {
        if let savedWorkouts = UserDefaults.standard.data(forKey: "Workouts") {
            if let decodedWorkouts = try? JSONDecoder().decode([Workout].self, from: savedWorkouts) {
                workouts = decodedWorkouts
            }
        }
    }

    static var sample = Workout.sample
}
