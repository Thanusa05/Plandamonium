import SwiftUI

struct AiView: View {
    @State private var userQuestion: String = ""
    @State private var aiResponse: String = "Ask me a question about your studies!"

    var body: some View {
        NavigationView {
            ZStack {
                // Background color
                Color("Green") // Ensure this color is defined in your Assets.xcassets
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
                    
                    // Title and Image
                    VStack {
                        Text("AI Tutoring")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(Color("offWhite"))
                        
                        // Adjust the size of the robot image here
                        Image("robot")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300, height: 300) // Set the desired width and height
                    }
                    
                    ScrollView {
                        VStack(alignment: .leading, spacing: 20) {
                            Text("**How It Works:**")
                                .font(.headline)
                                .foregroundColor(Color("DarkBlue"))
                            
                            Text("1. **Ask Questions:** Type your question or describe the problem you're facing. The AI will analyze your input and provide relevant answers or explanations.")
                                .font(.body)
                                .foregroundColor(Color("DarkBlue"))
                            
                            Text("2. **Interactive Learning:** Engage in interactive lessons and quizzes designed to help reinforce your understanding of the material.")
                                .font(.body)
                                .foregroundColor(Color("DarkBlue"))
                            
                            Text("3. **Personalized Feedback:** Receive tailored feedback based on your progress and performance to help you improve and succeed in your studies.")
                                .font(.body)
                                .foregroundColor(Color("DarkBlue"))
                            
                            Text("4. **Additional Resources:** Access a variety of additional learning materials, such as practice exercises, study guides, and more.")
                                .font(.body)
                                .foregroundColor(Color("DarkBlue"))
                            
                            Text("Our AI Tutoring feature aims to make learning more accessible and effective by providing support whenever you need it.")
                                .font(.body)
                                .foregroundColor(Color("DarkBlue"))
                                .padding(.bottom, 20)
                        }
                        .padding()
                        .background(Color("offWhite")) // Background color for content
                        .cornerRadius(15)
                        .shadow(radius: 10)
                        .padding(.bottom, 20)
                        
                        // AI Interaction
                        VStack {
                            Text("Ask AI Tutor")
                                .font(.headline)
                                .foregroundColor(Color("DarkBlue"))
                                .padding(.bottom, 10)

                            TextField("Type your question here...", text: $userQuestion)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding()
                            
                            Button(action: {
                                // Simulate AI response
                                aiResponse = "This is a simulated response to your question: 2"
                            }) {
                                Text("Get Response")
                                    .font(.headline)
                                    .foregroundColor(Color("Turquoise"))
                                    .padding()
                                    .background(Color("DarkBlue"))
                                    .cornerRadius(10)
                            }
                            
                            Text(aiResponse)
                                .font(.body)
                                .foregroundColor(Color("DarkBlue"))
                                .padding()
                                .background(Color("offWhite"))
                                .cornerRadius(10)
                        }
                        .padding()
                        .background(Color("offWhite"))
                        .cornerRadius(15)
                        .shadow(radius: 10)
                    }
                }
                .padding()
            }
            .navigationBarTitle("", displayMode: .inline) // Hide the navigation bar title
            .navigationBarHidden(true) // Hide the navigation bar
        }
    }
}

#Preview {
    AiView()
}
