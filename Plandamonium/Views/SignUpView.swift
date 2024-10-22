import SwiftUI

struct SignUpView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var showingAlert = false
    @State private var alertMessage = ""
    @State private var isAuthenticated = false

    var body: some View {
        NavigationStack {
            ZStack {
                // Full-screen green background
                Color("Green")
                    .ignoresSafeArea() // Ensures the background covers the entire screen
                
                VStack(spacing: 20) { // Added spacing for better layout
                    Text("Sign Up")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.bottom, 20)

                    // Username TextField
                    TextField("Username", text: $username)
                        .padding()
                        .background(Color("offWhite").opacity(1))
                        .cornerRadius(10)
                        .autocapitalization(.none)
                        .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.blue, lineWidth: 1))

                    // Password SecureField
                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color("offWhite").opacity(1))
                        .cornerRadius(10)
                        .autocapitalization(.none)
                        .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.blue, lineWidth: 1))

                    // Confirm Password SecureField
                    SecureField("Confirm Password", text: $confirmPassword)
                        .padding()
                        .background(Color("offWhite").opacity(1))
                        .cornerRadius(10)
                        .autocapitalization(.none)
                        .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.blue, lineWidth: 1))

                    // Sign Up Button
                    Button(action: {
                        loginButtonTapped()
                    }) {
                        Text("Sign Up")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color("DarkBlue"))
                            .cornerRadius(5)
                            .shadow(radius: 5)
                    }
                }
                .padding()
            }
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Login"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
            .navigationDestination(isPresented: $isAuthenticated) {
                studentHomepageView()
            }
        }
    }

    func loginButtonTapped() {
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

    func isValidLogin(username: String, password: String) -> Bool {
        if !isValidEmail(username) {
            alertMessage = "Invalid email format"
            return false
        }

        if !isValidPassword(password) {
            alertMessage = "Password must be at least 8 characters long"
            return false
        }

        // Simulated server-side validation
        let storedUsername = "gcode@gmail.com"
        let storedPassword = "password123"

        return username == storedUsername && password == storedPassword
    }

    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }

    func isValidPassword(_ password: String) -> Bool {
        return password.count >= 8
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
