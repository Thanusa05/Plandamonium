import SwiftUI

struct addEventView: View {
    @Environment(\.presentationMode) var presentationMode // To dismiss the view
    @State private var title: String = "" // Allows to input the title
    @State private var description: String = "" // Allows you to describe the reminder
    @State private var date: Date // Toggle the time
    @State private var repeatEvent: Bool = false // State for repeat option
    @State private var showRepeatEventView = false
    
    init(selectedDate: Date?) {
        _date = State(initialValue: selectedDate ?? Date())
    }

    var body: some View {
        NavigationView {
            ZStack {
                // Full-screen green background
                Color("Turquoise")
                    .ignoresSafeArea()

                VStack {
                    VStack {
                        NavigationLink(destination: sidebarView()) {
                            Image(systemName: "sidebar.right")
                                .padding(.leading, 340.0)
                                .font(.largeTitle)
                                .foregroundColor(.white)
                        }
                    }
                    Text("Event")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.trailing, 300.0)
                        .foregroundColor(Color("offWhite"))
                        .navigationBarItems(trailing: Button("Cancel") {
                            presentationMode.wrappedValue.dismiss() // Dismisses the current view, returns to the calendar, connects the Calendar and events view
                                
                        }
                            .foregroundColor(Color("offWhite")))

                    Form {
                        Section(header: Text("Event Details")) {
                            TextField("Title", text: $title)
                                .foregroundColor(Color("offWhite"))
                            TextField("Description", text: $description)
                                .foregroundColor(Color("offWhite"))
                            DatePicker("Time", selection: $date, displayedComponents: [.hourAndMinute])
                                .foregroundColor(Color("offWhite"))
                        }
                        .listRowBackground(Color("Turquoise")) // Adds green background to the section

                        NavigationLink(destination: repeatEventView()) {
                            Text("Repeat")
                                .foregroundColor(Color("Turquoise"))
                        }
                        .disabled(title.isEmpty) // Must type something in the title to use this button

                        NavigationLink(destination: sidebarView()) {
                            Text("Add To Calendar")
                            .foregroundColor(Color("Turquoise"))                        }

                        .disabled(title.isEmpty) // Must type something in the title to use this button

                        NavigationLink(destination: workloadView()) {
                            Text("See Workload")
                                .fontWeight(.bold)
                            .foregroundColor(Color("Turquoise"))                        }
                    }
                    .background(Color("Turquoise")) // Applies green background to the form
                }
            }
        }
    }
}

#Preview {
    addEventView(selectedDate: Date())
}
