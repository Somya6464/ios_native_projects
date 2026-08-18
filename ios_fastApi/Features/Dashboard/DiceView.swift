//
//  DiceView.swift
//  ios_fastApi
//
//  Created by GBS on 23/07/26.
//

import SwiftUI

struct DiceView: View {
    @State private var numberOfPips: Int = 1

    var body: some View {
//        Image(systemName: "die.face.\(numberOfPips)").font(.system(size: 100))
//        Button("Roll"){
//            withAnimation{
//                numberOfPips = Int.random(in: 1...6)
//            }
//        }.buttonStyle(.bordered)
        
        TabView{
            Tab(Constants.homeString, systemImage: "house"){
                HomeView()
            }
            Tab(Constants.upcomingString, systemImage: "play.circle"){
                UpcomingView()
            }
            Tab(Constants.searchString, systemImage: "magnifyingglass"){
                Text(Constants.searchString)
            }
            Tab(Constants.downloadString, systemImage: "arrow.down.to.line"){
                PostListScreen()
            }
            
        }
    }
}

#Preview {
    DiceView()
}
