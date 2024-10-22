//
//  studentHomepageView.swift
//  Plandamonium
//
//  Created by admin on 8/10/24.
//

import SwiftUI

struct studentHomepageView: View {
    var body: some View {
        NavigationView {
            ZStack {
                // Full-screen green background
                Color("DarkBlue")
                    .ignoresSafeArea()
                VStack {
                    VStack{
                        Text("Plandamonium")
                            .font(.largeTitle)
                        .foregroundColor(Color("offWhite"))
                        
                            Text("Plan through the chaos")
                            .foregroundColor(Color("offWhite"))
                            
                        
                        NavigationLink(destination: sidebarView()) {
                            Image(systemName: "sidebar.right")
                                .font(.title)
                                .padding(.leading, 330.0)
                                .padding(.bottom, 5.0)
                                .foregroundColor(Color("offWhite"))

                        }
                        
                        StudentClassList()
                        StudentCalendarListView(StudentCalData: [
                            StudCalendarData(Event: "Math Exam", Time: 1300, Date: 20240819),
                            StudCalendarData(Event: "Science Project Due", Time: 900, Date: 20240820),
                            StudCalendarData(Event: "History Lecture", Time: 1400, Date: 20240821)
                        ])
                    }
                    
                    Spacer()
                    
                    Spacer()
                    HStack {
                        Spacer()
                        VStack {
                            NavigationLink(destination: CalendarView()) {
                                Image(systemName: "calendar")
                                    .font(.system(size: 30))
                                    .foregroundColor(Color("DarkBlue"))

                            }
                            Text("Calendar")
                                .font(.footnote)
                                .padding(.top, 1.0)
                        }
                        Spacer()
                        VStack {
                            NavigationLink(destination: ProfileView()) {
                                Image(systemName: "person.2")
                                    .font(.system(size: 30))
                                    .foregroundColor(Color("DarkBlue"))
                            }
                            Text("Profile")
                                .font(.footnote)
                                .padding(.top, 1.0)
                        }
                        Spacer()
                        VStack {
                            NavigationLink(destination: StudentDirectMessegeView()) {
                                Image(systemName: "bubble.right")
                                    .font(.system(size: 30))
                                    .foregroundColor(Color("DarkBlue"))

                            }
                            Text("Chat")
                                .font(.footnote)
                                .padding(.top, 1.0)
                        }
                        Spacer()
                            .background(Color(.blue))

                    }
                    .padding()
                    .background(Color("offWhite").opacity(0.9))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .shadow(radius: 5)
                }
            }
        }
            }
        }

    
    #Preview {
        studentHomepageView()
    }
