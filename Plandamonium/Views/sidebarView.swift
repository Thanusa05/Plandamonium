import SwiftUI

struct sidebarView: View {
    @State private var isSidebarVisible = true

    var body: some View {
        NavigationView {
            ZStack {
                // Full-screen background
                Color("DarkBlue")
                    .ignoresSafeArea()

                HStack {
                    // Sidebar
                    if isSidebarVisible {
                        List {
                            NavigationLink(destination: studentHomepageView()
                                .navigationBarBackButtonHidden(true) // Hide back button
                            ) {
                                Label("Home", systemImage: "house")
                                    .foregroundColor(Color("DarkBlue"))
                            }
                            
                            NavigationLink(destination: ProfileView()) {
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
                            NavigationLink(destination: AiView()) {
                                Label("AI Tutoring", systemImage: "brain.head.profile")
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
                           
                            NavigationLink(destination: JoinView()) {
                                Label("Join", systemImage: "person.crop.circle.badge.plus")
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
                        .background(Color("DarkBlue"))
                        .transition(.move(edge: .leading))
                        .offset(x: isSidebarVisible ? 0 : UIScreen.main.bounds.width)
                        .zIndex(1) // Ensure it appears above other content
                    }

                    Spacer()
                }

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
                                .foregroundColor(Color("Tan"))
                                .padding()
                        }
                        .padding(.trailing, 10)
                    }
                    Spacer()
                }
            }
            .navigationBarTitle("", displayMode: .inline) // Optional: Hide navigation bar title
        }
    }
}

#Preview {
    sidebarView()
}
