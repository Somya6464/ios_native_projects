import SwiftUI

struct ContentView: View {
    // 1. Track if the splash screen is still showing
    @State private var isSplashVisible = true
    
    // 2. Track if the user is logged in (syncs with UserDefaults)
    @AppStorage("isLoggedIn") private var isLoggedIn = false

    var body: some View {
        ZStack {
            // Apply your background gradient to the whole app
            LinearGradient(
                colors: [Color.gradientTop, Color.gradientBottom],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            // 3. Route to the correct view
            if isSplashVisible {
                WelComePage()
                    .transition(.opacity)
            } else {
                if isLoggedIn {
                    DiceView() // Shown if the user is logged in
                        .transition(.opacity)
                } else {
                    LoginScreen() // Shown if the user is NOT logged in
                        .transition(.opacity)
                }
            }
        }
        .onAppear {
            // 4. Wait 3 seconds, then hide the splash screen
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation(.easeInOut(duration: 0.5)) {
                    self.isSplashVisible = false
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
