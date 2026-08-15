//
//  WelComePage.swift
//  ios_fastApi
//
//  Created by GBS on 22/07/26.
//

import SwiftUI

struct WelComePage: View {
    var body: some View {
        VStack{
            ZStack{
                RoundedRectangle(cornerRadius:50).frame(width: 200, height: 200).foregroundStyle(Color.blue)
                Image(systemName:"figure.2.and.child.holdinghands" ).font(.system(size: 80)).foregroundColor(.white)
            }
           
            Text("Welcome to my app").font(Font.title).fontWeight(.semibold).foregroundStyle(.white)
            Text("Description Test").font(Font.title2).fontWeight(.medium).foregroundStyle(.white)
        }.padding()
        
        
    }
}

#Preview {
    WelComePage()
}
