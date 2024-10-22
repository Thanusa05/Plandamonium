//
//  StudentCalenderList.swift
//  Plandamonium
//
//  Created by Gcode on 8/20/24.
//

import SwiftUI

struct StudCalendarData: Identifiable {
    let id = UUID()
    let Event: String
    let Time: Int
    let Date: Int
}

struct StudentCalendarListView: View {
    let StudentCalData: [StudCalendarData]
    
    var body: some View {
        NavigationView {
            ZStack {
                // Full-screen green background
                Color(Color("DarkBlue"))
                    .ignoresSafeArea()
                
                VStack {
                    Text("Student's Weekly Calendar")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding(.top)
                        .foregroundColor(Color("offWhite"))
                List(StudentCalData) { data in
                    VStack(alignment: .leading) {
                        Text(data.Event)
                            .font(.headline)
                            .foregroundColor(Color("DarkBlue"))
                        Text("Time: \(formatTime(data.Time))")
                            .font(.subheadline)
                            .foregroundColor(Color("DarkBlue"))
                        Text("Date: \(formatDate(data.Date))")
                            .font(.subheadline)
                            .foregroundColor(Color("DarkBlue"))
                    }
                    .padding()
                }
                .scrollContentBackground(.hidden) // Ensure the background color is visible behind the list content
              
                }
            }
        }
    }
    
    // Helper function to format time
    private func formatTime(_ time: Int) -> String {
        let hour = time / 100
        let minute = time % 100
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        let dateString = String(format: "%02d:%02d", hour, minute)
        let date = formatter.date(from: dateString) ?? Date()
        formatter.dateFormat = "h:mm a"
        return formatter.string(from: date)
    }
    
    // Helper function to format date
    private func formatDate(_ date: Int) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMdd"
        let dateString = String(format: "%04d", date)
        let date = formatter.date(from: dateString) ?? Date()
        formatter.dateFormat = "MMM d"
        return formatter.string(from: date)
    }
}

// Sample calendar data for preview
struct StudentCalendarListView_Previews: PreviewProvider {
    static var previews: some View {
        StudentCalendarListView(StudentCalData: [
            StudCalendarData(Event: "Math Exam", Time: 1300, Date: 20240819),
            StudCalendarData(Event: "Science Project Due", Time: 900, Date: 20240820),
            StudCalendarData(Event: "History Lecture", Time: 1400, Date: 20240821)
        ])
    }
}
