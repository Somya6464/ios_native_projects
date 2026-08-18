//
//  AppButtonStyle.swift
//  ios_fastApi
//
//  Created by GBS on 18/08/26.
//

import SwiftUI

struct AppButtonStyle: ButtonStyle {

    let isFilled: Bool

    init(isFilled: Bool = true) {
        self.isFilled = isFilled
    }

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 17, weight: .semibold))
            .foregroundStyle(
                isFilled
                    ? .white
                    : Color(red: 0.35, green: 0.65, blue: 0.63)
            )
            .frame(maxWidth: .infinity)
            .frame(height: 60)
            .background(
                isFilled
                    ? Color(red: 0.35, green: 0.65, blue: 0.63)
                    : Color.clear
            )
            .clipShape(Capsule())
            .overlay {
                if !isFilled {
                    Capsule()
                        .stroke(
                            Color(red: 0.35, green: 0.65, blue: 0.63),
                            lineWidth: 1.5
                        )
                }
            }
            .opacity(configuration.isPressed ? 0.7 : 1)
    }
}
