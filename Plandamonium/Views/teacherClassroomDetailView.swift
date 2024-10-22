//
//  teacherClassroomDetailView.swift
//  Plandamonium
//
//  Created by Gcode on 8/14/24.
//

import SwiftUI

struct teacherClassroomDetailView: View {
    var body: some View {
        VStack (alignment: .leading) {

                      Text("English")

                          .font(.title)

                      HStack {

                          Text("Mr. Aiden Gru")

                          Spacer()

                          Text("Period 1")

                      }

                      .font(.subheadline)

                      .foregroundStyle(.secondary)

                      Divider()

                      Text("Class Code: abcde")

                          .font(.title2)
                  }

                  .padding()
    }
}

#Preview {
    teacherClassroomDetailView()
}
