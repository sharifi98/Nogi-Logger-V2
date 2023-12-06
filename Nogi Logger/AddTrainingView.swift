//
//  AddTrainingView.swift
//  Nogi Logger
//
//  Created by Hossein Sharifi on 27/11/2023.
//

import SwiftUI

struct AddTrainingView: View {
    
    var workoutType = ["Gi", "NoGi"]
    @State var selectedWorkoutName = "Gi"
    
    @State private var name = ""
    @State private var notes = ""
    @State private var submissions = 0
    @State private var taps = 0
    @State private var sweeps = 0
    @State private var takedowns = 0
    @State private var rounds = 0
    @State private var roundLength = 0
    @State private var bodyWeight = 0
    @State private var injured = false
    
    
    var body: some View {
        NavigationStack {
            List {
                nameSection
                
            }
            .navigationBarTitle(Text(formattedCurrentDate()))
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private var nameSection: some View {
        Picker("Select workout type", selection: $selectedWorkoutName) {
            ForEach(workoutType, id: \.self) {
                Text($0)
            }
        }
        .pickerStyle(.segmented)
    }
    
    // showing the current date of today and not the specified workoutout date
    func formattedCurrentDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd"
        return formatter.string(from: Date())
    }
}



#Preview {
    AddTrainingView()
}
