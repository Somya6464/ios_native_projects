//
//  FeaturesPage.swift
//  ios_fastApi
//
//  Created by GBS on 22/07/26.
//

import SwiftUI


struct FeatureCard: View {
    let iconName : String
    let description : String
    var body: some View {
        HStack{
            Image(systemName: iconName).font(.largeTitle)
            Text(description)
            Spacer()
        }.padding()
            .background{
                RoundedRectangle(cornerRadius: 12)
                               .foregroundStyle(.tint)
                               .opacity(0.25)
            }.foregroundStyle(.white)
    }
}

struct FeaturesPage: View {
    var body: some View {
        NavigationStack{
        VStack{
            Text("Features").font(.title).fontWeight(.semibold).foregroundStyle(.white)
            FeatureCard(iconName: "person.2.crop.square.stack.fill", description: "A multiline description about a feature paired with the image on the left.")
            FeatureCard(iconName: "quote.bubble.fill", description: "Short summary")
            NavigationLink("Go to Dice →") {
                DiceView()
            }
            .buttonStyle(.borderedProminent)
        }.padding()
    }
        
    }
}

#Preview {
    FeaturesPage()
}
