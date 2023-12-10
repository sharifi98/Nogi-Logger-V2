//
//  WorkoutView.swift
//  Nogi Logger
//
//  Created by Hossein Sharifi on 09/12/2023.
//

import SwiftUI

struct WorkoutCardView: View {
    
    let workout: Workout

    var body: some View {
        VStack {
            // Top section for date and workout name
            HStack {
                //dateView
                VStack{
                    Text("Month")
                        .font(.caption)
                    Text("Date")
                        .fontWeight(.bold)
                }
                .padding()
                .background(Color.gray.opacity(0.3))
                .cornerRadius(10)
                .shadow(radius: 2)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1)
                )
                
                Spacer()
                Text(workout.name)
                    .font(.title2)
                    .fontWeight(.bold)
            }
            .padding(.all)

            Divider()

            HStack {
                // Middle section for workout statistics
                VStack(alignment: .leading) {
                    statText("Submissions", count: workout.submissions)
                    statText("Taps", count: workout.taps)
                    statText("Sweeps", count: workout.sweeps)
                    statText("Takedowns", count: workout.takedowns)
                }
                .padding(.all)
                
                Spacer()

                // Bottom section for duration
                HStack {
                    Spacer()
                    Text("Duration: \(workoutDuration)")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .padding(.all)
            }
            .padding(1)
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 2)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray, lineWidth: 1)
        )
        .padding()
    }

    private var dateView: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text(formattedDate(workout.startTime, style: .long))
                    .font(.title)
                    .fontWeight(.bold)
                Text(formattedDate(workout.startTime, style: .short))
                    .font(.caption)
                    .fontWeight(.semibold)
            }
        }
    }

    private func statText(_ title: String, count: Int) -> some View {
        Text("\(count) x \(title)")
            .font(.caption)
    }

    private var workoutDuration: String {
        let duration = workout.endTime.timeIntervalSince(workout.startTime)
        let minutes = Int(duration) / 60 % 60
        let hours = Int(duration) / 3600
        return "\(hours)h \(minutes)m"
    }

    private func formattedDate(_ date: Date, style: DateFormatter.Style) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = style
        return formatter.string(from: date)
    }
}

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutCardView(workout: Workout.sample)
            .previewLayout(.sizeThatFits)
    }
}
