import SwiftUI

struct studentListView: View {
    @State private var searchText = ""

    // Sample data for messages
    private let messages = [
        ("Jimmy Jr. Mack", "studentpfp"),
        ("Max Samuels", "studentpfp2"),
        ("Isabel Ross", "studentpfp3"),
        ("Axel May", "studentpfp4"),
        ("Sabrina Stevens", "studentpfp5")
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
                            .padding(10)
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                            .padding(.horizontal, 10)
                            .font(.title) // Larger font for search bar text

                        // Sidebar Navigation Link
                        NavigationLink(destination: TeacherSidebarView()) {
                            Image(systemName: "sidebar.right")
                                .font(.largeTitle) // Larger icon size
                                .padding()
                                .fontWeight(.bold)
                                .foregroundColor(Color("DarkBlue")) // DarkBlue for the sidebar icon
                        }

                        Spacer() // Pushes the search bar to the right
                    }
                    .padding(.horizontal) // Add horizontal padding

                    // Main Content
                    ScrollView(.vertical, showsIndicators: true) {
                        VStack(alignment: .leading) {
                            ForEach(filteredMessages.indices, id: \.self) { index in
                                HStack {
                                    if index == 0 {
                                        // Make the first image a navigation link to workloadView
                                        NavigationLink(destination: workloadView()) {
                                            Image(filteredMessages[index].1)
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 120, height: 120) // Larger image size
                                                .cornerRadius(60)
                                        }
                                    } else {
                                        Image(filteredMessages[index].1)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 120, height: 120) // Larger image size
                                            .cornerRadius(60)
                                    }

                                    // Message text
                                    Text(filteredMessages[index].0)
                                        .font(.title) // Larger text size
                                        .fontWeight(.bold)
                                        .padding(.leading, 20)
                                        .foregroundColor(Color("DarkBlue")) // DarkBlue for the text
                                }
                                .padding(.bottom, 15) // Increased space between messages
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
    studentListView()
}
