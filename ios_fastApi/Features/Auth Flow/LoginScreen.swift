import SwiftUI

struct LoginScreen: View {
    @State private var username = ""
    @State private var password = ""
    @State private var showEmptyAlert = false

    var body: some View {
        NavigationStack {
            ZStack {
                // Background
                LinearGradient(
                    colors: [Color.blue.opacity(0.15), Color.white],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                VStack(spacing: 30) {
                    Spacer()
                    
                    // Logo
                    Image(systemName: "person.crop.circle.fill")
                        .font(.system(size: 90))
                        .foregroundStyle(.blue)
                    
                    VStack(spacing: 8) {
                        Text("Welcome Back").font(.largeTitle).fontWeight(.bold)
                        Text("Sign in to continue").foregroundColor(.gray)
                    }
                    
                    // Login Card
                    VStack(spacing: 20) {
                        HStack {
                            Image(systemName: "person").foregroundColor(.gray)
                            TextField("Username", text: $username)
                                .textInputAutocapitalization(.never)
                                .autocorrectionDisabled()
                        }
                        .padding().background(Color.white).cornerRadius(15)
                        .shadow(color: .black.opacity(0.08), radius: 5)
                        
                        HStack {
                            Image(systemName: "lock").foregroundColor(.gray)
                            SecureField("Password", text: $password)
                        }
                        .padding().background(Color.white).cornerRadius(15)
                        .shadow(color: .black.opacity(0.08), radius: 5)
                        
                        HStack {
                            Spacer()
                            Button("Forgot Password?") {}.font(.footnote)
                        }
                        
                        // Login Button
                        Button {
                            if username.isEmpty || password.isEmpty {
                                showEmptyAlert = true
                            } else {
                                print("Login Successful")
                                // 🌟 THE MAGIC LINE 🌟
                                // ContentView is watching this key. Setting it to true
                                // will instantly tell ContentView to swap this view for HomeView.
                                UserDefaults.standard.set(true, forKey: Constants.isLoginKey)
                            }
                        } label: {
                            Text("Login")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(15)
                        }
                    }
                    .padding(25)
                    .background(.ultraThinMaterial)
                    .cornerRadius(25)
                    .shadow(radius: 10)
                    
                    // Signup
                    HStack(spacing: 5) {
                        Text("Don't have an account?").foregroundColor(.gray)
                        NavigationLink("Sign Up") {
                            SignupScreen()
                        }
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                    }
                    
                    Spacer()
                }
                .padding(.horizontal, 25)
            }
            // Pro-Tip: Use the modern toolbar modifier instead of the deprecated navigationBarHidden
            .toolbar(.hidden, for: .navigationBar)
        }
        .alert("Missing Information", isPresented: $showEmptyAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text("Please enter both a username and a password.")
        }
    }
}
