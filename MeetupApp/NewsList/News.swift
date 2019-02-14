//
//  News.swift
//  MeetupApp
//
//  Created by Nicolas Manograsso on 11/2/19.
//  Copyright © 2019 Wolox. All rights reserved.
//

import Foundation

class News: Codable {
    let id: Int
    let userId: Int
    let createdAt: String
    let title: String
    let picture: String
    let text: String
    let likes: [Int]
    
    init(id: Int, userId: Int, createdAt: String, title: String, picture: String, text: String, likes: [Int]) {
        self.id = id
        self.userId = userId
        self.createdAt = createdAt
        self.title = title
        self.picture = picture
        self.text = text
        self.likes = likes
    }
}
