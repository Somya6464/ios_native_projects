//
//  diceLogin.swift
//  ios_fastApi
//
//  Created by GBS on 05/08/26.
//

import Foundation
import SwiftUI

struct Constants{
    // splash //
    static let monoString = "mono"

    
    static let homeString = "Home"
    static let upcomingString = "Upcoming"
    static let searchString = "Search"
    static let downloadString = "Downloads"
    static let playString = "Play"    
    static let trendingMovieString = "Trending Movies"
        static let trendingTVString = "Trending TV"
        static let topRatedMovieString = "Top Rated Movies"
        static let topRatedTVString = "Top Rated TV"
    
    
    static let testTitleURL = "https://image.tmdb.org/t/p/w500/nnl6OWkyPpuMm595hmAxNW3rZFn.jpg"
    static let testTitleURL2 = "https://image.tmdb.org/t/p/w500/d5iIlFn5s0ImszYzBPb8JPIfbXD.jpg"
    static let testTitleURL3 = "https://image.tmdb.org/t/p/w500/qJ2tW6WMUDux911r6m7haRef0WH.jpg"

    // Local storage key names  //

    static let onboardingKey = "isUserOnboarded"
    static let isLoginKey = "isLoggedIn"
}


extension Text {
    func ghostButton() -> some View {
        self
            .frame(width: 100, height: 50)
            .bold()
            .background {
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .stroke(lineWidth: 5)
            }
    }
}
