import SwiftUI

// Define a custom Identifiable struct for messages
struct ChatMessage: Identifiable {
    let id = UUID() // Unique identifier for each message
    let text: String
    let sender: String
}

struct ChatView: View {
    @State private var messages: [ChatMessage] = [
        ChatMessage(text: "Hello Mr. Gru, I was looking at the assignments due today and had a question", sender: "teacher"),
        ChatMessage(text: "Of course! What’s the issue?", sender: "student"),
        ChatMessage(text: "I’m having trouble understanding the assignment.", sender: "teacher"),
        ChatMessage(text: "Let’s go over it together. Can you send me the details?", sender: "student"),
        ChatMessage(text: "Thank you! I'll send them over now.", sender: "teacher"),
        ChatMessage(text: "Sounds good!", sender: "student")
    ]
    
    @State private var newMessage = ""
    
    var body: some View {
        VStack {
            HStack {
                Text("Mr. Gru")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color("offWhite"))
                    .multilineTextAlignment(.leading)
                    .bold()
                    .padding(.top, 50.0)
                
                Spacer()
                NavigationLink(destination: sidebarView()) {
                    Image(systemName: "sidebar.right")
                        .font(.largeTitle)
                        .padding()
                        .foregroundColor(Color("offWhite")) // Button color matching the theme
                }
            }
            ScrollViewReader { proxy in
                ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(messages) { message in
                            HStack {
                                if message.sender == "student" {
                                    Image("teacherpfp") // Replace with actual student profile image name
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 40, height: 40)
                                        .clipShape(Circle())
                                        .padding(.leading, 10)
                                }
                                
                                VStack(alignment: .leading, spacing: 5) {
                                    Text(message.text)
                                        .padding()
                                        .background(message.sender == "teacher" ? Color.blue : Color("offWhite"))
                                        .cornerRadius(15)
                                        .foregroundColor(Color("DarkBlue"))
                                        .frame(maxWidth: 300, alignment: message.sender == "teacher" ? .trailing : .leading)
                                }
                                .padding(message.sender == "teacher" ? .trailing : .leading, 10)
                                .padding(.horizontal, 10)
                                
                                if message.sender == "teacher" {
                                    Image("studentpfp") // Replace with actual teacher profile image name
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 40, height: 40)
                                        .clipShape(Circle())
                                        .padding(.trailing, 10)
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
                        messages.append(ChatMessage(text: newMessage, sender: "student"))
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
        .padding(.top, 200.0)
        .background(Color("DarkBlue"))
        .ignoresSafeArea()
        .navigationTitle("Chat")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ChatView()
}
