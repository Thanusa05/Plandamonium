import SwiftUI

struct ScreenTimeView: View {
    @State private var screenTimeUsage: Double = 0 // Example screen time usage in hours
    @State private var screenTimeLimit: Double = 2 // Example screen time limit in hours

    var body: some View {
        NavigationView {
            ZStack {
                // Background color
                Color("Green")
                    .ignoresSafeArea()
                
                VStack {
                    HStack {
                        Spacer()
                        // Sidebar NavigationLink
                        NavigationLink(destination: sidebarView()) {
                            Image(systemName: "sidebar.right")
                                .font(.largeTitle)
                                .padding()
                                .foregroundColor(Color("offWhite"))
                        }
                    }
                    .padding(.top, 20)

                    Text("Screen Time Management")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color("offWhite"))
                        .padding()

                    // Screen Time Management Section
                    VStack {
                        HStack {
                            Text("Usage: \(String(format: "%.1f", screenTimeUsage)) hrs")
                                .font(.subheadline)
                                .foregroundColor(Color("offWhite"))
                            
                            Spacer()
                            
                            Text("Limit: \(String(format: "%.1f", screenTimeLimit)) hrs")
                                .font(.subheadline)
                                .foregroundColor(Color("offWhite"))
                        }
                        .padding()

                        Slider(value: $screenTimeUsage, in: 0...12, step: 0.1) {
                            Text("Screen Time Usage")
                        }
                        .accentColor(.yellow)
                        .padding()

                        Slider(value: $screenTimeLimit, in: 1...12, step: 0.1) {
                            Text("Set Screen Time Limit")
                        }
                        .accentColor(.yellow)
                        .padding()
                        
                        // Optionally, add a button to save or apply the settings
                        Button(action: {
                            // Handle save or apply screen time limit here
                            print("Screen time limit set to \(screenTimeLimit) hours")
                        }) {
                            Text("Apply Settings")
                                .foregroundColor((Color("offWhite")))
                                .font(.headline)
                                .padding()
                        }
                    }
                    .background(Color("DarkBlue").opacity(0.8))
                    .cornerRadius(15)
                    .padding()
                    
                    Spacer()
                }
                .navigationBarTitle("", displayMode: .inline)
                .navigationBarHidden(true)
            }
        }
    }
}

#Preview {
    ScreenTimeView()
}
