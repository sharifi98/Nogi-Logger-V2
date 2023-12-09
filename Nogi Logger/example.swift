import SwiftUI

struct WorkoutCard: View {
    var date: String
    var month: String
    var workoutTitle: String
    var exercises: [String]
    var duration: String
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(date)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Text(month.uppercased())
                        .font(.caption)
                        .fontWeight(.semibold)
                }
                Spacer()
            }
            .padding([.top, .leading])
            
            Divider()
            
            VStack(alignment: .leading) {
                Text(workoutTitle)
                    .font(.headline)
                    .padding(.vertical, 2)
                
                ForEach(exercises, id: \.self) { exercise in
                    Text(exercise)
                        .font(.subheadline)
                }
            }
            .padding([.leading, .bottom, .trailing])
            
            HStack {
                Spacer()
                Text(duration)
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
}

struct WorkoutCard_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutCard(
            date: "26",
            month: "NOV",
            workoutTitle: "M - Legs",
            exercises: ["3x Leg Press", "5x Hip Thrust"],
            duration: "40 min"
        )
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
