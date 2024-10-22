//
//  JoinView.swift
//  Plandamonium
//
//  Created by Gcode on 8/12/24.
//

import SwiftUI

struct JoinView: View {
    @State private var username: String = ""
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Join Class")
                        .font(.largeTitle)
                        .bold()
                        .padding(.trailing, 150.0)
                    
                    
                    NavigationLink(destination: sidebarView()) {
                        Image(systemName: "sidebar.right")
                            .foregroundColor(Color("Turquoise"))
                            .font(.largeTitle)
                        
                    }
                    
                }
                .padding(.bottom, 300.0)
                
                VStack {
                    Text("Enter the class code below to join")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .padding(.bottom, 20)
                    
                    TextField("Class code", text: $username)
                        .padding()
                        .font(.title3)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(8)
                        .autocapitalization(.none)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding(.horizontal, 20)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    
                    
                    NavigationLink(destination: ClassRoomView()) {
                        Text("Join")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .cornerRadius(10)
                            .background(Color("Turquoise"))

                    }
                    
                    
                }
                .padding(.bottom, 250.0)
            }
            
        }
    }
}

#Preview {
    JoinView()
}
