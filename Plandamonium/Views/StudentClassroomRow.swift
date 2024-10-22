//
//  StudentClassroomRow.swift
//  Plandamonium
//
//  Created by Gcode on 8/19/24.
//

import SwiftUI


struct StudentClassroomRow: View {
    var StudentClassroomData : StudentClassroomData
  
    var body: some View {
        HStack{
            Text(StudentClassroomData.ClassName)
            }
        }
    }
#Preview {
    Group {
        StudentClassroomRow(StudentClassroomData: StudentClassData[0])
        StudentClassroomRow(StudentClassroomData: StudentClassData[1])
        StudentClassroomRow(StudentClassroomData: StudentClassData[2])
        StudentClassroomRow(StudentClassroomData: StudentClassData[3])
        StudentClassroomRow(StudentClassroomData: StudentClassData[4])
        }
}


