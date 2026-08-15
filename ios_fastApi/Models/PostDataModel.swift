//
//  PostDataModel.swift
//  ios_fastApi
//
//  Created by GBS on 11/08/26.
//

import Foundation

struct PostDataModel: Codable{
    let posts: [PostModel]
    let total: Int
    let skip: Int
    let limit: Int
}

struct PostModel: Codable {
    let id: Int
    let title: String
    let body: String
    let tags: [String]
    let reactions: ReactionModel
    let views: Int
    let userId: Int
}

struct ReactionModel: Codable {
    let likes: Int
    let dislikes: Int
}
