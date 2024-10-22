//
//  StudentClassList.swift
//  Plandamonium
//
//  Created by Gcode on 8/20/24.
//

import SwiftUI

struct StudentClassList: View {
    var body: some View {
        NavigationSplitView {
            VStack {
                Text("Classrooms")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top)
                    .foregroundColor(Color("offWhite"))
                List(StudentClassData) { StudentClassData in
                    NavigationLink {
                        StudentClassroomDetailView()
                    } label: {
                        StudentClassroomRow(StudentClassroomData: StudentClassData)
                            .foregroundColor(Color("DarkBlue"))
                    }
                }
                }
                
                .background(Color("DarkBlue")) // Apply green background directly to the List
                .scrollContentBackground(.hidden) // Ensure the background color is visible behind the list content
            } detail: {
                Text("Select a Classroom")
        }
    }
}

#Preview {
    StudentClassList()
}
