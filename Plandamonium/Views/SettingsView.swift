import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            ZStack {
                // Set the background color to off-white
                Color("offWhite")
                    .ignoresSafeArea()
                
                List {
                    NavigationLink(destination: RestView()) {
                        SettingsRow(icon: "arrow.clockwise", title: "Restart")
                    }
                    .padding()
                    
                    NavigationLink(destination: workloadView()) {
                        SettingsRow(icon: "bell", title: "Notifications")
                    }
                    .padding()

                    NavigationLink(destination: CalendarView()) {
                        SettingsRow(icon: "calendar", title: "Calendar")
                    }
                    .padding()

                    NavigationLink(destination: FeedBackView()) {
                        SettingsRow(icon: "bubble.left.and.bubble.right", title: "FeedBack")
                    }
                    .padding()

                    NavigationLink(destination: userPasswordView()) {
                        SettingsRow(icon: "person.crop.circle", title: "Password/User")
                    }
                    .padding()
                }
                .listStyle(InsetGroupedListStyle())
                .navigationTitle("Settings")
            }
        }
    }
}

struct SettingsRow: View {
    let icon: String
    let title: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(Color("Green"))
            Text(title)
                .font(.headline)
                .foregroundColor(.primary)
            Spacer()
        }
        .padding()
        .background(Color("offWhite")) // Background color for each row
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

#Preview {
    SettingsView()
}
