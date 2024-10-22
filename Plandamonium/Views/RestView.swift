////
////  RestView.swift
////  Plandamonium
////
////  Created by Gcode on 8/13/24.
////
//
import SwiftUI

struct RestView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""

    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: sidebarView()) {
                    Image(systemName: "sidebar.right")
                        .font(.title)
                        .padding(.leading, 330.0)
                        .padding(.bottom, 200.0)

                }
            VStack(spacing: 20) {
                Text("Restart")
                    .font(.largeTitle)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding()
                
                TextField("Enter your username", text: $username)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .autocapitalization(.none)
                    .textFieldStyle(PlainTextFieldStyle())
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.blue, lineWidth: 1))
                
                TextField("Enter your password", text: $password)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .autocapitalization(.none)
                    .textFieldStyle(PlainTextFieldStyle())
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.blue, lineWidth: 1))
                
                Button(action: {
                    
                    if username.isEmpty || password.isEmpty {
                        alertMessage = "Please fill in"
                        showAlert = true
                    } else {
                        
                        alertMessage = "Restart successful!"
                        showAlert = true
                    }
                }) {
                    Text("Restart")
                        .font(.headline)
                    
                        .foregroundColor(.white)
                        .padding()
                        .background(Color("DarkBlue"))
                        .cornerRadius(10)
                        .shadow(radius: 5)
                }
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Alert"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                }
                
                
            }
            .padding(.bottom, 250.0)
        }
            .padding()
        }
    }
}

struct RestView_Previews: PreviewProvider {
    static var previews: some View {
        RestView()
    }
}
