//
//  SignupScreen.swift
//  ios_fastApi
//
//  Created by GBS on 26/07/26.
//

import SwiftUI

struct SignupScreen: View {

    @Environment(\.dismiss) var dismiss

    @State private var fullName = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""

    var body: some View {

        ZStack {

            LinearGradient(
                colors: [.purple.opacity(0.15), .white],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            ScrollView {

                VStack(spacing: 25) {

                    Image(systemName: "person.badge.plus.fill")
                        .font(.system(size: 85))
                        .foregroundStyle(.purple)

                    VStack(spacing: 8) {

                        Text("Create Account")
                            .font(.largeTitle.bold())

                        Text("Sign up to get started")
                            .foregroundColor(.gray)
                    }

                    VStack(spacing: 18) {

                        // Full Name
                        HStack {

                            Image(systemName: "person")

                            TextField("Full Name", text: $fullName)
                        }
                        .padding()
                        .background(.white)
                        .cornerRadius(15)
                        .shadow(radius: 4)

                        // Email
                        HStack {

                            Image(systemName: "envelope")

                            TextField("Email", text: $email)
                                .keyboardType(.emailAddress)
                                .textInputAutocapitalization(.never)
                        }
                        .padding()
                        .background(.white)
                        .cornerRadius(15)
                        .shadow(radius: 4)

                        // Password
                        HStack {

                            Image(systemName: "lock")

                            SecureField("Password", text: $password)
                        }
                        .padding()
                        .background(.white)
                        .cornerRadius(15)
                        .shadow(radius: 4)

                        // Confirm Password
                        HStack {

                            Image(systemName: "lock.rotation")

                            SecureField("Confirm Password", text: $confirmPassword)
                        }
                        .padding()
                        .background(.white)
                        .cornerRadius(15)
                        .shadow(radius: 4)

                        Button {
                            if fullName.isEmpty || email.isEmpty || confirmPassword.isEmpty || password.isEmpty {
                                
                            }else{
                                
                                print("Register")
                                UserDefaults.standard.set(true, forKey: "isLoggedIn")
                            }
                            

                        } label: {

                            Text("Create Account")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(.purple)
                                .cornerRadius(15)
                        }
                    }
                    .padding()
                    .background(.ultraThinMaterial)
                    .cornerRadius(25)

                    HStack {

                        Text("Already have an account?")
                            .foregroundColor(.gray)

                        Button("Login") {
                            dismiss()
                        }
                        .fontWeight(.bold)
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    SignupScreen()
}
