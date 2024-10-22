import SwiftUI

struct CalendarView: View {
    let calendar = Calendar.current
    let dateFormatter = DateFormatter()
    @State private var selectedDate: Date? = nil // tracks the date
    @State private var currentMonth: Date = Date() // tracks the month
    @State private var showingAddEventView = false // State to control sheet presentation

    var body: some View {
        NavigationView {
            ZStack {
                // Full-screen tan background
                Color("Turquoise")
                    .edgesIgnoringSafeArea(.all) // Ensures the background covers all areas
                
                VStack {
                    // Navigation to SidebarView
                    HStack {
                        Spacer()
                        NavigationLink(destination: sidebarView()) {
                            Image(systemName: "sidebar.right")
                                .font(.title)
                                .padding()
                                .foregroundColor(Color("offWhite"))
                        }
                    }
                    
                    // Month and Year Navigation
                    HStack {
                        Button(action: {
                            self.currentMonth = self.calendar.date(byAdding: .month, value: -1, to: self.currentMonth)!
                        }) {
                            Image(systemName: "chevron.left")
                                .padding()
                                .foregroundColor(Color("offWhite"))
                        }
                        
                        Text(dateFormatter.string(from: currentMonth))
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.horizontal)
                        
                        Button(action: {
                            self.currentMonth = self.calendar.date(byAdding: .month, value: 1, to: self.currentMonth)!
                        }) {
                            Image(systemName: "chevron.right")
                                .padding()
                                .foregroundColor(Color("offWhite"))
                        }
                    }
                    .padding(.bottom, 10)
                    
                    // Days of the Week Header
                    let weekdaySymbols = calendar.weekdaySymbols
                    HStack {
                        ForEach(weekdaySymbols, id: \.self) { day in
                            Text(day.prefix(3)) // Display only the first 3 characters of the day of the week
                                .font(.subheadline)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 8)
                                .background(Color.green.opacity(0.2))
                                .foregroundColor(Color("offWhite"))
                                .multilineTextAlignment(.center)
                                .cornerRadius(5)
                        }
                    }
                    
                    // Calendar Grid
                    let days = getDaysInMonth(date: currentMonth)
                    let columns = Array(repeating: GridItem(.flexible(), spacing: 0), count: 7)
                    
                    LazyVGrid(columns: columns, spacing: 0) {
                        ForEach(days, id: \.self) { day in
                            Text("\(self.calendar.component(.day, from: day))")
                                .font(.body)
                                .padding(10) // Adjust padding as needed
                                .background(self.selectedDate == day ? Color.blue : Color.clear)
                                .foregroundColor(self.selectedDate == day ? Color.white : Color("DarkBlue"))
                                .clipShape(Circle())
                                .shadow(color: self.selectedDate == day ? Color.blue.opacity(0.5) : Color.clear, radius: 5)
                                .onTapGesture {
                                    self.selectedDate = day
                                    self.showingAddEventView = true // clicking a date will bring the user to add event/reminder view
                                }
                                .frame(maxWidth: .infinity, maxHeight: .infinity) // Ensure days fill their cells
                        }
                    }
                    .padding(1) // Adjust calendar grid spacing
                }
            }
            .onAppear {
                dateFormatter.dateFormat = "MMMM yyyy"
            }
            .sheet(isPresented: $showingAddEventView) {
                addEventView(selectedDate: selectedDate) // connects the Calendar and Event View, each day is a button
            }
        }
    }

    // Helper to get all days in the current month, including padding days from previous and next month
    private func getDaysInMonth(date: Date) -> [Date] {
        // Start of the month
        let startOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: date))!
        
        // Start of the week for the month
        let startOfWeek = calendar.date(byAdding: .day, value: -calendar.component(.weekday, from: startOfMonth) + 1, to: startOfMonth)!
        
        // End of the month
        let endOfMonth = calendar.date(byAdding: .month, value: 1, to: startOfMonth)!
        let endOfWeek = calendar.date(byAdding: .day, value: -1, to: endOfMonth)!
        
        // Calculate all days to display
        var days: [Date] = []
        var currentDate = startOfWeek
        
        while currentDate <= endOfWeek {
            days.append(currentDate)
            currentDate = calendar.date(byAdding: .day, value: 1, to: currentDate)!
        }
        
        return days
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
