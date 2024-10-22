import SwiftUI

struct workloadView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedMonday = "Practice"
    @State private var selectedTuesday = "Content"
    @State private var selectedWednesday = "Content"
    @State private var selectedThursday = "Content"
    @State private var selectedFriday = "Content"
    @State private var selectedSaturday = "Content"
    @State private var selectedSunday = "Content"

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Workload")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color("offWhite")) // Text color
                        .padding(.trailing, 180.0)
                    
                    NavigationLink(destination: sidebarView()) {
                        Image(systemName: "sidebar.right")
                            .font(.title)
                            .foregroundColor(Color("offWhite")) // Icon color
                    }
                }
                
                Text("Total: 14 Hours 30 Minutes")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(Color("Turquoise")) // Text color
                    .padding(15)
                    .background(Color("offWhite")) // Background color
                    .cornerRadius(30)
                
                NavigationLink(destination: studentHomepageView()) {
                    Text("Save")
                        .foregroundColor(Color("offWhite")) // Text color
                }
                
                Form {
                    Section(header: Text("Monday")
                        .fontWeight(.semibold)
                        .foregroundColor(Color("Turquoise"))) // Header text color
                    {
                        Text("Homework: 5:30-8:30, Study for Chem: 9:00-9:30")
                            .fontWeight(.semibold)
                            .foregroundColor(Color("Turquoise")) // Text color
                    }
                    
                    Section(header: Text("Tuesday")
                        .fontWeight(.semibold)
                        .foregroundColor(Color("Turquoise"))) // Header text color
                    {
                        Text("Practice: 3:00-4:45, Homework: 5:30-8:30")
                            .fontWeight(.semibold)
                            .foregroundColor(Color("Turquoise")) // Text color
                    }
                    
                    Section(header: Text("Wednesday")
                        .fontWeight(.semibold)
                        .foregroundColor(Color("Turquoise"))) // Header text color
                    {
                        Text("Homework: 5:30-8:30")
                            .fontWeight(.semibold)
                            .foregroundColor(Color("Turquoise")) // Text color
                    }
                    
                    Section(header: Text("Thursday")
                        .fontWeight(.semibold)
                        .foregroundColor(Color("Turquoise"))) // Header text color
                    {
                        Text("Practice: 3:00-4:45, Homework: 5:30-8:30")
                            .fontWeight(.semibold)
                            .foregroundColor(Color("Turquoise")) // Text color
                    }
                    
                    Section(header: Text("Friday")
                        .fontWeight(.semibold)
                        .foregroundColor(Color("Turquoise"))) // Header text color
                    {
                        Text("Soccer Game: 3:00-4:30, Homework: 5:00-8:00, Email Teachers: 8:30-9:00")
                            .fontWeight(.semibold)
                            .foregroundColor(Color("Turquoise")) // Text color
                    }
                    
                    Section(header: Text("Saturday")
                        .fontWeight(.semibold)
                        .foregroundColor(Color("Turquoise"))) // Header text color
                    {
                        Text("Practice: 12:00-1:15")
                            .fontWeight(.semibold)
                            .foregroundColor(Color("Turquoise")) // Text color
                    }
                    
                    Section(header: Text("Sunday")
                        .fontWeight(.semibold)
                        .foregroundColor(Color("Turquoise"))) // Header text color
                    {
                        Text("None")
                            .fontWeight(.semibold)
                            .foregroundColor(Color("Turquoise")) // Text color
                    }
                }
                .background(Color("Turquoise")) // Form background color
            }
            .background(Color("Turquoise")) // Main background color
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    workloadView()
}
