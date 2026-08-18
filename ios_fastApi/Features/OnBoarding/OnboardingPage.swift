//
//  OnboardingPage.swift
//  ios_fastApi
//
//  Created by GBS on 22/07/26.
//

import SwiftUI

struct OnboardingPage: View {

    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                VStack(spacing: 0) {

                    // MARK: - Illustration
                    ZStack {
                        Color(red: 0.91, green: 0.96, blue: 0.96)

                        Image(.onboardingRing)
                            .resizable()
                            .scaledToFit()
                            .frame(
                                width: geometry.size.width,
//                                height: geometry.size.height * 0.67
                            )
                        Image(.onboardingAvatar).padding(.top, 150)
                    }
                    .frame(height: geometry.size.height * 0.75)

                    // MARK: - Bottom Content
                    VStack(spacing: 0) {

                        Text("Spend Smarter\nSave More")
                            .font(.system(size: 36, weight: .bold))
                            .foregroundStyle(Color(.textGreen))
                            .multilineTextAlignment(.center)
                            .lineSpacing(-4)

                        Spacer()
                            .frame(height: 28)

                        NavigationLink {
                            LoginScreen().onAppear{
                                UserDefaults.standard.set(true, forKey: Constants.onboardingKey)
                            }

                        } label: {
                            Text("Get Started")
                        }.buttonStyle(AppButtonStyle())
                    }
                    .padding(.horizontal, 28)
                    .padding(.top, 40)
                    .padding(.bottom, 28)
                    .frame(maxWidth: .infinity)
                    .frame(maxHeight: .infinity)
                    .background(.white)
                }
                .ignoresSafeArea()
            }
        }
    }
}

#Preview {
    OnboardingPage()
}
