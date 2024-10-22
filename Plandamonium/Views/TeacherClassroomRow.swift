//
//  TeacherClassroomRow.swift
//  Plandamonium
//
//  Created by Gcode on 8/13/24.
//

import SwiftUI

struct TeacherClassroomRow: View {
    var TeacherClassroomData : TeacherClassroomData
  
    var body: some View {
        HStack{
            Text(TeacherClassroomData.ClassName)
            }
        }
    }
#Preview {
    Group {
        TeacherClassroomRow(TeacherClassroomData: TeacherClassData[0])
        TeacherClassroomRow(TeacherClassroomData: TeacherClassData[1])
        TeacherClassroomRow(TeacherClassroomData: TeacherClassData[2])
        TeacherClassroomRow(TeacherClassroomData: TeacherClassData[3])
        TeacherClassroomRow(TeacherClassroomData: TeacherClassData[4])
        TeacherClassroomRow(TeacherClassroomData: TeacherClassData[5])
        }
}



