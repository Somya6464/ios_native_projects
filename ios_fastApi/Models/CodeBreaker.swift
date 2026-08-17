//
//  CodeBreaker.swift
//  ios_fastApi
//
//  Created by GBS on 16/08/26.
//

import SwiftUI

typealias Peg = Color


struct CodeBreaker{
    var masterCode: Code
    var guess: Code
    var attempts : [Code]
    var pegChoices: [Peg]
}

struct Code {
    var kind : Kind
    var pegs : [Peg]
    
    enum Kind {
        case master
        case guess
        case attempt
        case unknown
    }
}


