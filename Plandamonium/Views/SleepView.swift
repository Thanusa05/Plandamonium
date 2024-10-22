import SwiftUI

struct SleepView: View {
    var body: some View {
        NavigationView {
            ZStack {
                // DarkBlue background color
                Color("DarkBlue") // Ensure this color is defined in your Assets.xcassets
                    .ignoresSafeArea()
                
                VStack {
                    HStack {
                        Spacer()
                        // Sidebar NavigationLink
                        NavigationLink(destination: sidebarView()) {
                            Image(systemName: "sidebar.right")
                                .font(.largeTitle)
                                .padding()
                                .foregroundColor(Color("offWhite")) // Button color matching the theme
                        }
                    }
                    .padding(.top, 20) // Adjusted padding for better positioning

                    Spacer()

                    Text("Sleep")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color("offWhite")) // Matching text color
                        .padding()
                    
                    // Add calming image or illustration
                    Image(systemName: "moon.stars")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .foregroundColor(.yellow) // Image color for contrast
                        .padding(.vertical, 50.0)

                    // Add a relaxing message or tip
                    Text("Relax and unwind. Focus on your breath and let go of the day's stress.")
                        .font(.headline)
                        .foregroundColor(Color("offWhite"))
                        .multilineTextAlignment(.center)
                        .padding()

                    // Add a soothing quote
                    Text("\"Sleep is the best meditation.\" — Dalai Lama")
                        .font(.title2)
                        .fontWeight(.medium)
                        .foregroundColor(Color("offWhite"))
                        .multilineTextAlignment(.center)
                        .padding()
                        .padding(.bottom, 50) // Extra padding at the bottom

                    Spacer()
                }
                .navigationBarTitle("", displayMode: .inline) // Hide the navigation bar title
                .navigationBarHidden(true) // Hide the navigation bar
            }
        }
    }
}

#Preview {
    SleepView()
}
