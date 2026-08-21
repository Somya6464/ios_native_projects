//
//  DiceView.swift
//  ios_fastApi
//
//  Created by GBS on 23/07/26.
//

import SwiftUI

struct DiceView: View {
//    @State private var numberOfPips: Int = 1
     @State private var selectedTab = 0

    var body: some View {
        //        Image(systemName: "die.face.\(numberOfPips)").font(.system(size: 100))
        //        Button("Roll"){
        //            withAnimation{
        //                numberOfPips = Int.random(in: 1...6)
        //            }
        //        }.buttonStyle(.bordered)

        /*    TabView{
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
         */

        ZStack(alignment: .bottom) {
            // Main content fills the screen
            Group {
                switch selectedTab {
                case 0:
                    HomeView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                case 1:
                    UpcomingView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                case 2:
                    // Example: ensure simple content still fills
                    VStack {
                        Spacer()
                        Text(Constants.searchString)
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                case 3:
                    PostListScreen()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                default:
                    HomeView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
            .background(Color(.systemBackground).ignoresSafeArea())

            BottonNavBar(selectedIndex: $selectedTab)
        }
        .ignoresSafeArea(edges: .bottom)



    }

}

#Preview {
    DiceView()
}

struct BottonNavBar : View {
    @Binding var selectedIndex: Int

    var body : some View{
        ZStack(alignment: .top, content: {
            HStack{
tabItem(icon: "house.fill", index: 0)
                tabItem(icon: "chart.bar.fill", index: 1)
                Spacer()
                                    .frame(width: 80)
                tabItem(icon: "wallet.bifold.fill", index: 2)
                tabItem(icon: "person.crop.circle.fill", index: 3)
            }.padding(.horizontal, 20)
                .frame(height: 80)
                .background(.gradiant)
                .shadow(
                    color: .white.opacity(0.08),
                    radius: 15,
                    x: 0,
                    y: -10
                )

            // MARK: - Center Button
                       Button {
                           // Center button action
                       } label: {

                           Image(systemName: "plus")
                               .font(.system(size: 30, weight: .light))
                               .foregroundStyle(.white)
                               .frame(width: 72, height: 72)
                               .background(
                                   Color(
                                       red: 0.22,
                                       green: 0.52,
                                       blue: 0.51
                                   )
                               )
                               .clipShape(Circle())
                               .overlay {

                               }
                               .shadow(
                                   color: Color(
                                    .black
                                   ).opacity(0.45),
                                   radius: 18,
                                   x: 0,
                                   y: 8
                               )
                       }
                       .offset(y: -35)
        })
    }
@ViewBuilder
    private func tabItem (
        icon: String,
//        title: String,
        index: Int
    ) -> some View{
        Button(action: {
            selectedIndex = index
        }, label: {
            VStack{
                Image(systemName: icon).font(.system(size: 24))
//                Text(title).font(.system(size: 11, weight: .medium))
            } .foregroundStyle(
                selectedIndex == index
                ? Color(
                    .primary
                )
                : .gray
            )
            .frame(maxWidth: .infinity)
        }
            )
    }
}
