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
    @State private var submissions = 0
    @State private var taps = 0
    @State private var sweeps = 0
    @State private var takedowns = 0
    @State private var rounds = 0.0
    @State private var roundLength = 5
    @State private var bodyWeight = String("0")
    @State private var injured = false
    
    
    
    var body: some View {
        NavigationStack {
            List {
                
                Section {
                    nameSection
                    startTimeSection
                    endTimeSection
                    bodyweightSection
                    TextField("\(notes)", text: $notes)
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
            showingEditBodyweight.toggle()
            isBodyWeightFieldFocused = true
        } label: {
            HStack {
                Text("Bodyweight")
                Spacer()
                Text(bodyWeight)
            }
        }
        .sheet(isPresented: $showingEditBodyweight) {
            VStack(alignment: .center) {
                Text("Enter your Bodyweight")
                HStack(alignment: .center) {
                    TextField("Bodyweight", text: $bodyWeight)
                        .keyboardType(.decimalPad)
                        .focused($isBodyWeightFieldFocused)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                }
                Button("Done") {
                    showingEditBodyweight = false
                }
                .padding()
            }
            .padding()
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
