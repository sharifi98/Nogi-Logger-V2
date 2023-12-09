//
//  AddTrainingView.swift
//  Nogi Logger
//
//  Created by Hossein Sharifi on 27/11/2023.
//

import SwiftUI

struct AddTrainingView: View {
    
    var workoutType = ["Gi", "NoGi"]
    var roundLengthRange = 1...8
    @State var selectedWorkoutName = "Gi"
    
    @State private var selectedStartTime: Date = Date()
    @State private var selectedEndTime: Date = Date() + 3600
    @State private var showingEditStartTimeSheet = false
    @State private var showingEditEndTimeSheet = false
    
    @State private var showingEditBodyweight = false
    @FocusState private var isBodyWeightFieldFocused: Bool
    
    @State private var name = ""
    
    @State private var notes = "Notes..."
    @State private var showEditNotesView = false
    
    
    @State private var submissions = 0
    @State private var taps = 0
    @State private var sweeps = 0
    @State private var takedowns = 0
    @State private var rounds = 0.0
    @State private var roundLength = 5
    @State private var injured = false
    
    
    @State private var showBodyWeightWheel = false
    @State private var bodyWeight = String("0")
    @State private var selectedWeight = 60.0
    
    var body: some View {
        NavigationStack {
            List {
                
                Section {
                    nameSection
                    startTimeSection
                    endTimeSection
                    bodyweightSection
                    notesSection
                }
                
                Section {
                    statisticsSection
                }
                
                Section {
                    roundsRolledSection
                }
                
                Section {
                    roundLengthSection
                }
            }
            .navigationBarTitle(Text(formattedCurrentDate()))
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private var notesSection: some View {
        
            VStack {
                Button {
                    showEditNotesView.toggle()
                }label: {
                    TextField("\(notes)", text: $notes)
                }
                
                NavigationLink(destination: EditNotesView(notes: $notes), isActive: $showEditNotesView) {
                    EmptyView()
                }
            }
    }
    
    private var roundLengthSection: some View {
        Section {
            Text("Round length (Minutes)")
            Picker("Round length", selection: $roundLength) {
                ForEach(roundLengthRange, id: \.self) { number in
                    Text("\(number)").tag(number)
                }
            }
            .pickerStyle(.palette)
        }
        .padding(.bottom)
    }
    
    private var roundsRolledSection: some View {
        VStack {
            Text("Rounds Rolled: \(rounds, specifier: "%.0f")")
            HStack{
                Text("0")
                Slider(value: $rounds, in: 0...20, step: 1.0)
                Text("20")
            }
        }
    }
    
    private var statisticsSection: some View {
        Section {
            HStack {
                Stepper("Submissions", value: $submissions)
                Text("\(submissions)")
            }
            
            HStack {
                Stepper("Taps", value: $taps)
                Text("\(taps)")
            }
            
            HStack {
                Stepper("Sweeps", value: $sweeps)
                Text("\(sweeps)")
            }
            
            HStack {
                Stepper("Takedowns", value: $takedowns)
                Text("\(takedowns)")
            }
        }

    }
    
    
    
    private var bodyweightSection: some View {
        Button {
            showBodyWeightWheel.toggle()
        } label: {
            HStack {
                Text("Bodyweight")
                Spacer()
                Text(String(format: "%.1f kg", selectedWeight))
            }
        }
        .sheet(isPresented: $showBodyWeightWheel) {
            VStack {
                Picker("Bodyweight", selection: $selectedWeight) {
                    // Create an array of weights with one decimal place
                    ForEach((300...2000).map { Double($0) / 10 }, id: \.self) { weight in
                        Text(String(format: "%.1f kg", weight))
                    }
                }
                .pickerStyle(.wheel)
                .frame(height: 150)
                // Optionally, add a button to confirm the selection
                Button("Confirm") {
                    showBodyWeightWheel = false
                }
                .padding()
            }
            .presentationDetents([.height(250)])
        }
    }
    
    private var startTimeSection: some View {
        VStack {
            Button {
                showingEditStartTimeSheet.toggle()
            } label: {
                HStack {
                    Text("Start Time")
                    Spacer()
                    Text(formattedDate(selectedStartTime))
                }
            }
            .sheet(isPresented: $showingEditStartTimeSheet) {
                DatePicker("Start Time",
                           selection: $selectedStartTime,
                           displayedComponents: [.date, .hourAndMinute]
                )
                .datePickerStyle(.wheel)
                .presentationDetents([.height(250)])
            }
        }
        
    }
    
    private var endTimeSection: some View {
        VStack {
            Button {
                showingEditEndTimeSheet.toggle()
            } label: {
                HStack {
                    Text("End Time")
                    Spacer()
                    Text(formattedDate(selectedEndTime))
                }
            }
            .sheet(isPresented: $showingEditEndTimeSheet) {
                DatePicker("End Time",
                           selection: $selectedEndTime,
                           displayedComponents: [.date, .hourAndMinute]
                )
                .datePickerStyle(.wheel)
                .presentationDetents([.height(250)])
            }
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
    
    // showing the current MONTH and DAY date of today and not the specified workoutout date
    func formattedCurrentDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd"
        formatter.locale = Locale(identifier: "en_GB")
        formatter.timeZone = TimeZone(abbreviation: "CET")
        return formatter.string(from: Date())
    }
    
    
    func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "E, MMM dd 'at' HH:mm"
        formatter.locale = Locale(identifier: "en_GB")
        formatter.timeZone = TimeZone(abbreviation: "CET")
        return formatter.string(from: date)
    }
}



#Preview {
    AddTrainingView()
}
