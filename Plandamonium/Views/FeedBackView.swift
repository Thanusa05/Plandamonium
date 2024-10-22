//
//  FeedBackView.swift
//  Plandamonium
//
//  Created by Gcode on 8/13/24.
//

import SwiftUI

struct FeedBackView: View {
    @State private var username: String = ""

    var body: some View {
        NavigationView {
            ZStack {
                // Full-screen green background
                Color("Tan")
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    HStack {
                        Spacer()
                        // Sidebar NavigationLink
                        NavigationLink(destination: sidebarView()) {
                            Image(systemName: "sidebar.right")
                                .font(.title)
                                .padding()
                        }
                        .padding(.bottom, 200.0)
                    }
                    
                    NavigationLink(destination: sidebarView()) {
                        Text("Feedback")
                            .font(.largeTitle)
                            .foregroundColor(Color("DarkBlue"))
                            .padding()
                            .fontWeight(.bold)
                            .background(Color("Green"))
                            .cornerRadius(10)
                            .shadow(color: Color.black.opacity(0.2), radius: 8, x: 0, y: 4)
                    }
                    
                    
                    TextField("Enter your feedback", text: $username)
                        .padding()
                        .font(.title3)
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
                        .autocapitalization(.none)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                .padding(.bottom, 300.0)
                .cornerRadius(15)
                .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 10)
                .navigationBarTitle("", displayMode: .inline) // Optional: Hide navigation bar title
            }
        }
    }
}

#Preview {
    FeedBackView()
}
