import SwiftUI

// Define a custom Identifiable struct for messages with profile image name
struct Message: Identifiable {
    let id = UUID() // Unique identifier for each message
    let text: String
    let sender: String
    let profileImage: String // Add profile image name
}

struct TeacherChatView: View {
    @State private var messages: [Message] = [
        Message(text: "Hello Mr. Gru, I was looking at the assignments due today and had a question", sender: "student", profileImage: "studentProfile"),
        Message(text: "Of course! What’s the issue?", sender: "teacher", profileImage: "teacherProfile"),
        Message(text: "I’m having trouble understanding the assignment.", sender: "student", profileImage: "studentProfile"),
        Message(text: "Let’s go over it together. Can you send me the details?", sender: "teacher", profileImage: "teacherProfile"),
        Message(text: "Thank you! I'll send them over now.", sender: "student", profileImage: "studentProfile"),
        Message(text: "Sounds good!", sender: "teacher", profileImage: "teacherProfile")
    ]
    
    @State private var newMessage = ""
    
    var body: some View {
        VStack {
            HStack {
                Text("Jimmy Jr. Mac")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color("DarkBlue"))
                    .bold()
                    .padding(.top, 100.0)
                
                Spacer()
                NavigationLink(destination: TeacherSidebarView()) {
                    Image(systemName: "sidebar.right")
                        .font(.largeTitle)
                        .padding()
                        .foregroundColor(Color("DarkBlue")) // Button color matching the theme
                }

            }
            ScrollViewReader { proxy in
                ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(messages) { message in
                            HStack {
                                if message.sender == "student" {
                                    // Student's profile image and message bubble
                                    Image("studentpfp")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 40, height: 40)
                                        .clipShape(Circle())
                                        .padding(.trailing, 10)
                                    
                                    Text(message.text)
                                        .padding()
                                        .background(Color("offWhite"))
                                        .cornerRadius(15)
                                        .foregroundColor(Color("DarkBlue"))
                                        .frame(maxWidth: 300, alignment: .leading)
                                    
                                    Spacer()
                                } else {
                                    Spacer()
                                    
                                    Text(message.text)
                                        .padding()
                                        .background(Color("DarkBlue"))
                                        .cornerRadius(15)
                                        .foregroundColor(Color("offWhite"))
                                        .frame(maxWidth: 300, alignment: .trailing)
                                    
                                    // Teacher's profile image and message bubble
                                    Image("teacherpfp")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 40, height: 40)
                                        .clipShape(Circle())
                                        .padding(.leading, 10)
                                }
                            }
                            .id(message.id) // Assign an ID to each message
                        }
                    }
                    .padding(.top, 10)
                    .background(GeometryReader { geo in
                        Color.clear
                            .onAppear {
                                // Scroll to bottom when view appears
                                withAnimation {
                                    proxy.scrollTo(messages.last?.id, anchor: .bottom)
                                }
                            }
                    })
                }
            }
            
            HStack {
                TextField("Type a message...", text: $newMessage)
                    .padding(10)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.leading, 10)
                
                Button(action: {
                    if !newMessage.isEmpty {
                        messages.append(Message(text: newMessage, sender: "teacher", profileImage: "teacherProfile"))
                        newMessage = ""
                    }
                }) {
                    Text("Send")
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                        .foregroundColor(.white)
                        .padding(.trailing, 10)
                }
            }
            .padding(.bottom, 10)
        }
        .padding()
        .background(Color("Tan"))
        .ignoresSafeArea()
        .navigationTitle("Chat")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    TeacherChatView()
}
