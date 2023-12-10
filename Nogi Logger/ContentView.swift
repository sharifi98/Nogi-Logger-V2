//
//  ContentView.swift
//  Nogi Logger
//
//  Created by Hossein Sharifi on 27/11/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var workoutStore = WorkoutStore()
    //var workout: Workout
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("hello")
            }
            .toolbar {
                NavigationLink(destination: AddTrainingView()) {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
