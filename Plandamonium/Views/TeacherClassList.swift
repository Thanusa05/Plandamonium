//
//  TeacherClass.swift
//  Plandamonium
//
//  Created by Gcode on 8/14/24.
//

import SwiftUI

struct TeacherClassList: View {
    var body: some View {
        NavigationSplitView {
                VStack {
                    Text("Classrooms")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.top)
                        .foregroundColor(Color("DarkBlue"))
            List(TeacherClassData) { TeacherClassroomData in
                NavigationLink {
                    teacherClassroomDetailView()
                } label: {
                    TeacherClassroomRow(TeacherClassroomData: TeacherClassroomData)
                        .foregroundColor(Color("DarkBlue"))
                }
            }
            
        }
            .background(Color("Tan")) // Apply green background directly to the List
            .scrollContentBackground(.hidden) // Ensure the background color is visible behind the list content
        } detail: {
            Text("Select a Classroom")
        }
    }
}

#Preview {
    TeacherClassList()
}
