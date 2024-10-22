//
//  StudentClassroomDetailView.swift
//  Plandamonium
//
//  Created by Gcode on 8/19/24.
//

import SwiftUI

struct StudentClassroomDetailView: View {
    var body: some View {
        VStack (alignment: .leading) {

                      Text("Calculus")

                          .font(.title)

                      HStack {

                          Text("Mr. Aiden Gru")

                          Spacer()

                          Text("Period 4")

                      }

                      .font(.subheadline)

                      .foregroundStyle(.secondary)

                      Divider()

                      Text("Involves the study of concepts like limits, derivatives, integrals, and infinite series. Students learn to analyze functions and their rates of change, which are essential for understanding motion, growth, and areas under curves.")

                .font(.body)
                  }

                  .padding()
    }
}

#Preview {
    teacherClassroomDetailView()
}

#Preview {
    StudentClassroomDetailView()
}
