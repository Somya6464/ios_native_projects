//
//  WelComePage.swift
//  ios_fastApi
//
//  Created by GBS on 22/07/26.
//

import SwiftUI

struct SplashScreen: View {
    var body: some View {
        ZStack {
            Color(.primary)

            Image(.splash)
                .scaledToFill()        // 2. Stretches image to cover the full screen
        }
        .ignoresSafeArea()             // 3. Forces the ZStack container to go full screen
        .overlay {                     // 4. Places text on top without layout shifts
            Text(Constants.monoString)
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
        }

    }
}

#Preview {
    SplashScreen()
}
