//
//  MatchMarkers.swift
//  ios_fastApi
//
//  Created by GBS on 16/08/26.
//
import SwiftUI

public enum Match: Codable, Equatable {
    case nomatch
    case exact
    case inexact
}

struct MatchMarkers: View {
    var matches : [Match]
    var body: some View {
        
        HStack{
            VStack{
                matchmarkers(peg: 0)
                matchmarkers(peg: 1)
            }
            VStack{
                matchmarkers(peg: 3)
                matchmarkers(peg: 4)
            }
        }
    }
    func matchmarkers (peg : Int) -> some View{
//        let exactCount : Int = matches.count(where: {match in match == .exact})
        let exactCount = matches.count{ $0 == .exact}
        let foundCount = matches.count{$0 != .nomatch}
        return Circle()
            .fill(exactCount > peg ? Color.primary : Color.clear)
            .strokeBorder(foundCount > peg ? Color.primary : Color.clear, lineWidth: 2)
            .aspectRatio(1, contentMode: .fit)
    }
}

#Preview {
    MatchMarkers(matches: [.exact, .inexact, .nomatch])
}
