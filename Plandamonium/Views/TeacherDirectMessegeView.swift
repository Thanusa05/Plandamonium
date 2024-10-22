import SwiftUI

struct TeacherDirectMessegeView: View {
    @State private var searchText = ""
    
    // Sample data for messages
    private let messages = [
        ("Hello Jimmy Jr, yes I would...", "studentpfp"),
        ("Yes, you can come after sch...", "studentpfp2"),
        ("I am glad you came to talk...", "studentpfp3"),
        ("I hope your having a good...", "studentpfp4"),
        ("Thank you for reaching out...", "studentpfp5")
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
                // Tan background color
                Color("Tan")
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
                        }
                        
                        Spacer() // Pushes the search bar to the right
                    }
                    .padding(.horizontal) // Add horizontal padding

                    // Main Content
                    ScrollView(.vertical, showsIndicators: true) {
                        VStack(alignment: .leading) {
                            ForEach(filteredMessages.indices, id: \.self) { index in
                                HStack {
                                    // User profile image with navigation link for the first image
                                    if index == 0 {
                                        NavigationLink(destination: TeacherChatView()) {
                                            Image(filteredMessages[index].1)
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 100, height: 100)
                                                .cornerRadius(50)
                                        }
                                    } else {
                                        Image(filteredMessages[index].1)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 100, height: 100)
                                            .cornerRadius(50)
                                    }
                                    
                                    // Message text
                                    Text(filteredMessages[index].0)
                                        .padding(.leading, 20)
                                }
                                .padding(.bottom, 10) // Space between messages
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
    TeacherDirectMessegeView()
}
