//
//  ProfileView.swift
//  Plandamonium
//
//  Created by admin on 8/12/24.
//

import SwiftUI

struct StudentProfileView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image("studentpfp")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .cornerRadius(100)
                    .padding()
                    .offset(x: -125, y: -225)
                    .navigationTitle("Profile")
                Text("*Name: Jimmy Jr. Mac")
                    .offset(x: -100, y: -225)
                Text("*School: Science Park")
                    .offset(x: -100, y: -180)
                Text("*Phone Number: 973-546-6796")
                    .offset(x: -60, y: -135)
                Text("*Email: gcodejj2024@gmail.com")
                    .offset(x: -60, y: -90)
                Text("*Grade: 10th Grade")
                    .offset(x: -108, y: -45)
                    
                
            }
        }
    }
}

#Preview {
    StudentProfileView()
}
