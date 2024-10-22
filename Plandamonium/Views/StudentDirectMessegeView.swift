import SwiftUI

struct StudentDirectMessegeView: View {
    @State private var searchText = ""
    
    // Sample data for messages
    private let messages = [
        ("Hello Mr. Gru, I was looking...", "teacherpfp"),
        ("Good afternoon, is there any...", "teacherpfp2"),
        ("Thank you for answering my qu...", "studentpfp5"),
        ("Good morning, can I try to...", "teacherpfp3"),
        ("Hello, I was wondering if th...", "teacherpfp4"),
        ("Good evening Mr. Williams...", "teacherpfp5"),
        ("Were you able to complete chap...", "studentpfp2")

    ]
    
    // Computed property to filter messages based on search text
    private var filteredMessages: [(String, String)] {
        if searchText.isEmpty {
            return messages
        } else {
            return messages.filter { $0.0.localizedCaseInsensitiveContains(searchText) }
        }
    }

    var body: some View {
        NavigationStack {
            ZStack {
                // Background color
                Color("DarkBlue")
                    .ignoresSafeArea()
                
                VStack {
                    HStack {
                        // Search Bar
                        TextField("Search...", text: $searchText)
                            .padding(7)
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                            .padding(.horizontal, 10)
                        
                        // Sidebar Navigation Link
                        NavigationLink(destination: TeacherSidebarView()) {
                            Image(systemName: "sidebar.right")
                                .font(.title)
                                .padding()
                                .foregroundColor(Color("Tan"))
                        }
                        
                        Spacer() // Pushes the search bar to the right
                    }
                    .padding(.horizontal) // Add horizontal padding

                    // Main Content
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(alignment: .leading, spacing: 20) {
                            ForEach(filteredMessages.indices, id: \.self) { index in
                                HStack {
                                    // User profile image with navigation link for the first image
                                    if index == 0 {
                                        NavigationLink(destination: ChatView()) {
                                            Image(filteredMessages[index].1)
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 80, height: 80)
                                                .cornerRadius(40)
                                        }
                                    } else {
                                        Image(filteredMessages[index].1)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 80, height: 80)
                                            .cornerRadius(40)
                                    }
                                    
                                    // Message text
                                    Text(filteredMessages[index].0)
                                        .foregroundColor(.white)
                                        .padding(.leading, 20)
                                }
                                .padding(.vertical, 5) // Space between messages
                            }
                        }
                        .padding(.leading, 20)
                    }
                }
            }
        }
    }
}

#Preview {
    StudentDirectMessegeView()
}
