import SwiftUI

struct TeacherSidebarView: View {
    @State private var isSidebarVisible = true

    var body: some View {
        NavigationView {
            ZStack {
                // Full-screen background
                Color("Tan")
                    .ignoresSafeArea()

                HStack {
                    // Sidebar
                    if isSidebarVisible {
                        List {
                            NavigationLink(destination: teacherHomepageView()) {
                                Label("Home", systemImage: "house")
                                    .foregroundColor(Color("DarkBlue"))
                            }
                            NavigationLink(destination: TeacherProfileView()) {
                                Label("Profile", systemImage: "person.circle")
                                    .foregroundColor(Color("DarkBlue"))
                            }
                            NavigationLink(destination: SettingsView()) {
                                Label("Settings", systemImage: "gear")
                                    .foregroundColor(Color("DarkBlue"))
                            }
                            NavigationLink(destination: CalendarView()) {
                                Label("Calendar", systemImage: "calendar")
                                    .foregroundColor(Color("DarkBlue"))
                            }
                            NavigationLink(destination: TutoringView()) {
                                Label("Tutoring", systemImage: "info.circle")
                                    .foregroundColor(Color("DarkBlue"))
                            }
                            NavigationLink(destination: ScreenTimeView()) {
                                Label("Screen Time", systemImage: "clock")
                                    .foregroundColor(Color("DarkBlue"))
                            }
                            NavigationLink(destination: SleepView()) {
                                Label("Sleep", systemImage: "zzz")
                                    .foregroundColor(Color("DarkBlue"))
                            }
                            NavigationLink(destination: AiView()) {
                                Label("Ai", systemImage: "brain.head.profile")
                                    .foregroundColor(Color("DarkBlue"))
                            }
                            NavigationLink(destination: CreateClassView()) {
                                Label("Create a Class", systemImage: "plus.circle")
                                    .foregroundColor(Color("DarkBlue"))
                            }
                            NavigationLink(destination: AboutTheApp()) {
                                Label("About the App", systemImage: "info.circle")
                                    .foregroundColor(Color("DarkBlue"))
                            }
                            // Sign Out Link with navigation to LoginView and no back option
                            NavigationLink(destination: LoginView().navigationBarBackButtonHidden(true)) {
                                Label("Sign Out", systemImage: "rectangle.portrait.and.arrow.right")
                                    .foregroundColor(Color("DarkBlue"))
                            }
                        }
                        .listStyle(SidebarListStyle())
                        .frame(width: 250)
                        .background(Color("Tan"))
                        .transition(.move(edge: .trailing))
                        .offset(x: isSidebarVisible ? 0 : UIScreen.main.bounds.width)
                    }

                    Spacer()
                }
                .animation(.easeInOut, value: isSidebarVisible)

                // Toggle Button
                VStack {
                    HStack {
                        Spacer()
                        Button(action: {
                            withAnimation {
                                isSidebarVisible.toggle()
                            }
                        }) {
                            Image(systemName: isSidebarVisible ? "sidebar.right" : "sidebar.left")
                                .font(.largeTitle)
                                .foregroundColor(Color("DarkBlue"))
                                .padding()
                        }
                        .padding(.trailing, 10)
                    }
                    Spacer()
                }
            }
            .navigationBarTitle("", displayMode: .inline)
        }
    }
}

#Preview {
    TeacherSidebarView()
}
