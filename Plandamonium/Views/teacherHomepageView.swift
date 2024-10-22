//
//  teacherHomepageView.swift
//  Plandamonium
//
//  Created by Gcode on 8/12/24.
//

import SwiftUI

struct teacherHomepageView: View {
    @State private var showCalendar = true
    var body: some View {
        NavigationStack {
            ZStack {
                // Full-screen green background
                Color("Tan")
                    .ignoresSafeArea()
                VStack{
                    Section(header: Text("Plandamonium").font(.largeTitle).foregroundColor(Color("DarkBlue"))) {
                        Text("Plan through the chaos")
                            .fontWeight(.semibold)
                            .foregroundColor(Color("DarkBlue"))
                    }
                    
                    ScrollView(.vertical, showsIndicators: true) {
                        
                        NavigationLink(destination: TeacherSidebarView()) {
                            Image(systemName: "sidebar.right")
                                .font(.title)
                                .padding(.leading, 330.0)
                                .padding(.bottom, 5.0)
                                .foregroundColor(Color("DarkBlue"))

                        }
                        
                        TeacherClassList()
                        TeacherCalendarListView(calendarData: [
                            TeachCalendarData(Event: "Math Exam", Time: 1300, Date: 20240819),
                            TeachCalendarData(Event: "Science Project Due", Time: 900, Date: 20240820),
                            TeachCalendarData(Event: "History Lecture", Time: 1400, Date: 20240821)
                        ])
                    }
                    Spacer()
                    HStack {
                        Spacer()
                        VStack {
                            NavigationLink(destination: studentListView()){
                                Image(systemName: "calendar")
                                    .font(.system(size: 30))
                                    .foregroundColor(Color("Tan"))
                            }
                            Text ("Workload")
                                .font(.footnote)
                                .padding(.top, 1.0)
                                .foregroundColor(Color("Tan"))

                        }
                        Spacer()
                        VStack {
                            NavigationLink(destination: TeacherProfileView()){
                                Image(systemName: "person.2")
                                    .font(.system(size: 30))
                                    .foregroundColor(Color("Tan"))

                            }
                            Text ("Profile")
                                .font(.footnote)
                                .padding(.top, 1.0)
                                .foregroundColor(Color("Tan"))

                        }
                        
                        Spacer()
                        VStack {
                            NavigationLink(destination: TeacherDirectMessegeView()){
                                Image(systemName: "bubble.right")
                                    .font(.system(size: 30))
                                    .foregroundColor(Color("Tan"))

                            }
                            Text ("Chat")
                                .font(.footnote)
                                .padding(.top, 1.0)
                                .foregroundColor(Color("Tan"))

                        }
                        Spacer()
                    }
                    .padding()
                    .background(Color("DarkBlue").opacity(0.9))
                    .clipShape(RoundedRectangle(cornerRadius:12))
                    .shadow(radius: 5)
                    
                    
                }
            }
        }
    }
}
#Preview {
    teacherHomepageView()
}
