import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var showingAlert = false
    @State private var alertMessage = ""
    @State private var isAuthenticated = false
    @State private var userType: UserType? = nil

    enum UserType {
        case student
        case teacher
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Log In")
                    .font(.title)
                
                // Username TextField
                TextField("Username", text: $username)
                    .padding()
                    .background(Color("Green").opacity(0.2))
                    .cornerRadius(10)
                    .autocapitalization(.none)
                    .textFieldStyle(PlainTextFieldStyle())
                    .overlay(RoundedRectangle(cornerRadius:10)
                        .stroke(Color.blue, lineWidth: 1))
                
                // Password SecureField
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color("Green").opacity(0.2))
                    .cornerRadius(10)
                    .autocapitalization(.none)
                    .textFieldStyle(PlainTextFieldStyle())
                    .overlay(RoundedRectangle(cornerRadius:10)
                        .stroke(Color.blue, lineWidth: 1))

                // Login Button
                Button(action: loginButtonTapped) {
                    Text("Login")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("DarkBlue"))
                        .cornerRadius(5)
                        .shadow(radius: 5)
                }
                
                // Sign Up NavigationLink
                NavigationLink(destination: SignUpView()) {
                    Text("Sign Up")
                        .font(.headline)
                        .shadow(radius: 5)
                }
            }
            
            .padding()
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Login"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
            .navigationDestination(isPresented: $isAuthenticated) {
                switch userType {
                case .student:
                    studentHomepageView()
                        .navigationBarBackButtonHidden(true)
                case .teacher:
                    teacherHomepageView()
                        .navigationBarBackButtonHidden(true)
                case .none:
                    EmptyView()
                }
            }
        }
    }
    
    // Function to handle login button tap
    private func loginButtonTapped() {
        guard !username.isEmpty && !password.isEmpty else {
            alertMessage = "Please enter both username and password"
            showingAlert = true
            return
        }

        if isValidLogin(username: username, password: password) {
            isAuthenticated = true
        } else {
            alertMessage = "Invalid username or password"
            showingAlert = true
        }
    }
    
    private func isValidLogin(username: String, password: String) -> Bool {
        // Example credentials for different users
        let studentCredentials = ("gcode@gmail.com", "password123")
        let teacherCredentials = ("gcodeteacher@gmail.com", "password123")

        if username == "gcode@gmail.com" && password == "password123" {
            userType = .student
            return true
        } else if username == "gcodeteacher@gmail.com" && password == "password123" {
            userType = .teacher
            return true
        } else {
            alertMessage = "Invalid username or password"
            return false
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

#Preview {
    LoginView()
}
