import SwiftUI

struct AboutTheApp: View {
    var body: some View {
        NavigationView {
            ZStack {
                // Turquoise background color
                Color("Turquoise") // Ensure this color is defined in your Assets.xcassets
                    .ignoresSafeArea()
                
                VStack(alignment: .leading, spacing: 20) {
                    // Sidebar NavigationLink
                    HStack {
                        NavigationLink(destination: sidebarView()) {
                            Image(systemName: "sidebar.right")
                                .padding(.leading, 320.0)
                                .font(.largeTitle)
                                .foregroundColor(Color("Tan")) // Button color matching the theme
                        }
                        Spacer()
                    }
                    .padding([.top, .horizontal])
                    
                    // Main content
                    ScrollView {
                        VStack(alignment: .leading, spacing: 16) {
                            Text("About This App")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(Color("DarkBlue"))
                                .padding(.bottom, 10)
                            
                            Text("An app to assist students and teachers through features that include: intuitive messaging, sleep assist, assignment scheduling, tutoring with AI, and many other useful functions.")
                                .font(.body)
                                .foregroundColor(Color("DarkBlue"))
                                .padding(.bottom, 10)
                            
                            Text("**Messaging** - Allows students and teachers to easily communicate through an intuitive messaging feature.")
                                .font(.headline)
                                .foregroundColor(Color("DarkBlue"))
                                .padding(.bottom, 5)
                            
                            Text("**Scheduling** - Allows users to plan their day and make changes with the click of a button, as well as give reminders and tips to maintain a healthy work-life balance. It includes a feature that calculates the weekly workload hours to help teachers understand their students' workload.")
                                .font(.body)
                                .foregroundColor(Color("DarkBlue"))
                                .padding(.bottom, 10)
                            
                            Text("**Assignments** - Users can log their assignments, due dates, and other important information, receiving reminders and notifications as due dates approach. For teachers, this function helps keep track of assignments and manage collection deadlines.")
                                .font(.body)
                                .foregroundColor(Color("DarkBlue"))
                                .padding(.bottom, 10)
                            
                            Text("**Tutoring** - Teachers can post videos or lessons covering topics for students to review and assist with homework. This feature allows students to learn at their own pace and helps teachers save time on repetitive lessons. AI Assist will also support students with homework and questions.")
                                .font(.body)
                                .foregroundColor(Color("DarkBlue"))
                                .padding(.bottom, 10)
                            
                            Text("**Sleep Assist** - Users receive tips on improving their sleep (e.g., types of tea to drink, activities to avoid before bed). The app also directs users to a third-party website to help determine the optimal bedtime.")
                                .font(.body)
                                .foregroundColor(Color("DarkBlue"))
                                .padding(.bottom, 20)
                        }
                        .padding()
                        .background(Color("offWhite")) // Background color for content
                        .cornerRadius(15)
                        .shadow(radius: 10)
                    }
                }
            }
            .navigationBarTitle("", displayMode: .inline) // Hide the navigation bar title
            .navigationBarHidden(true) // Hide the navigation bar
        }
    }
}

#Preview {
    AboutTheApp()
}
