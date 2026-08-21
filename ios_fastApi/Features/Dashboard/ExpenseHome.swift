//
//  ExpenseHome.swift
//  ios_fastApi
//
//  Created by GBS on 21/08/26.
//

import SwiftUI

struct ExpenseHome: View {
    var body: some View {
        VStack{
            ZStack{

                ContainerRelativeShape(


                ).size(CGSize(width: 200, height: 200))
                Image(.homeelipses).font(.system(size : 100))

            }

        }.ignoresSafeArea(edges: .top)

    }
}

#Preview {
    ExpenseHome()
}
