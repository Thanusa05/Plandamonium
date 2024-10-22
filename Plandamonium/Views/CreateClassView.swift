//
//  CreateClassView.swift
//  Plandamonium
//
//  Created by Gcode on 8/13/24.
//

import SwiftUI

struct CreateClassView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                // Header with title and sidebar button
                HStack {
                    Text("Create Class")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.top)
                        .padding(.leading)
                    
                    Spacer()
                    
                    NavigationLink(destination: sidebarView()) {
                        Image(systemName: "sidebar.right")
                            .font(.title)
                            .padding()
                    }
                }
                
                // List of classes
                List {
                    // Add Class Button
                    NavigationLink(destination: teacherClassroomDetailView()) {
                        Text("Add Class")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                            .listRowInsets(EdgeInsets())
                    }
                    
                    // Existing Classes Section
                    Text("Existing Classes")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.vertical, 10)
                    
                    // Class List Items
                    ForEach(["English P4", "English P1", "English P6"], id: \.self) { className in
                        NavigationLink(destination: TeacherClassList()) {
                            Text(className)
                                .font(.headline)
                                .padding()
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(8)
                                .foregroundColor(.primary)
                                .listRowInsets(EdgeInsets())
                        }
                    }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("") // Hide the default title
            .navigationBarHidden(true) // Hide the default navigation bar
        }
    }
}

#Preview {
    CreateClassView()
}
