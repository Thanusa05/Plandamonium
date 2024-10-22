//
//  repeatEventView.swift
//  Plandamonium
//
//  Created by Gcode on 8/14/24.
//

import SwiftUI

struct repeatEventView: View {

    @State private var showtext = true
    @State private var repeatMonday: Bool = false
    @State private var repeatTuesday: Bool = false
    @State private var repeatWednesday: Bool = false
    @State private var repeatThursday: Bool = false
    @State private var repeatFriday: Bool = false
    @State private var repeatSaturday: Bool = false
    @State private var repeatSunday: Bool = false
    @Environment(\.presentationMode) var presentationMode
    @State private var showCalenderView = false
    @State private var showAddEventView = false



   
    var body: some View {
            NavigationView {
                VStack{
                    VStack{
                        NavigationLink(destination: sidebarView()) {
                            Image(systemName: "sidebar.right")
                                .foregroundColor(Color("Turquoise"))
                                .padding(.leading, 340.0)
                                            .font(.largeTitle)
                                           
                        }
                    }
                    Text("Repeat Event")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color("Turquoise"))
                        .padding(.trailing, 110.0)
                        .navigationBarItems(trailing: Button("Cancel") {
                            presentationMode.wrappedValue.dismiss() // Dismisses the current view, returns to the addEventView, connects the repeatEvent and createEvent view
                        }
                            .foregroundColor(Color("Turquoise"))
)

                    //Text ("Monday")
                    Form{
                        Section (header: Text("")
                            .foregroundColor(Color("Turquoise"))){
                            Toggle ("Monday", isOn: $repeatMonday)
                        }
                        Section {
                            Toggle ("Tuedsay", isOn: $repeatTuesday)
                                                    }
                        Section {
                            Toggle ("Wednesday", isOn: $repeatWednesday)
                                                    }
                        Section {
                            Toggle ("Thursday", isOn: $repeatThursday)
                            
                        }
                        Section {
                            Toggle ("Friday", isOn: $repeatFriday)
                        }
                        Section {
                            Toggle ("Saturday", isOn: $repeatSaturday)
                        }
                        Section {
                            Toggle ("Sunday", isOn: $repeatSunday)
                        }
                        Button(action: {
                            // Handle saving the event here
                            // Example: saveEvent()
                            presentationMode.wrappedValue.dismiss() //Dismisses the current view, returns to the CalendarView

                        }) {
                            Text("Add To Calendar")
                                .fontWeight(.semibold)
                                .foregroundColor(Color("Turquoise"))
                            
                        }
                            

                        }
                        
                    }
                }
                
                }
        }
        // ("Repeat Event View")
    

#Preview {
    repeatEventView()
}
