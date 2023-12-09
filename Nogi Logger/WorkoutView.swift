//
//  WorkoutView.swift
//  Nogi Logger
//
//  Created by Hossein Sharifi on 09/12/2023.
//

import SwiftUI

struct WorkoutView: View {
    
    let workout: Workout
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                .fill(.gray)
                .shadow(radius: 10)
                .frame(width: 360,height: 200)
            
            
            VStack {
                HStack(alignment: .top) {
                    Text("\(formattedDate(workout.startTime))")
                    VStack {
                        Text(workout.name)
                        Text("\(workout.submissions)")
                    }
                    Spacer()
                }
                .padding(25)
            }
        }
        
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    HStack {
                        VStack {
                            Text("date")
                                .font(.title)
                                .fontWeight(.bold)
                            Text("month".uppercased())
                                .font(.caption)
                                .fontWeight(.semibold)
                        }
                        Text(workout.name)
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding()
                    }
                }
                Spacer()
            }
            .padding([.top, .leading])
            
            Divider()
            
            VStack(alignment: .leading) {
                
                Text("\(workout.submissions) x Submissions")
                        .font(.subheadline)
                Text("\(workout.taps) x Taps")
                        .font(.subheadline)
                Text("\(workout.sweeps) x Sweeps")
                        .font(.subheadline)
                Text("\(workout.takedowns) x Takedowns")
                        .font(.subheadline)
                
            }
            .padding([.leading, .bottom, .trailing])
            
            HStack {
                Spacer()
                Text("duration")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .padding([.trailing, .bottom])
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 2)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray, lineWidth: 1)
        )
        
        
        
        
    }
    
    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter.string(from: date)
    }
}

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutView(workout: Workout.sample)
            .previewLayout(.sizeThatFits)
    }
}

