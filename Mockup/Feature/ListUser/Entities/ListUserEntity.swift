//
//  ListUserEntity.swift
//  Mockup
//
//  Created by arodriguez on 16-10-20.
//

import Foundation

struct ListUserResponse: Codable {
    let page: Int
    let per_page: Int
    let total: Int
    let total_pages: Int
    let data: [UserEntity]
}
struct UserEntity: Codable {
    let id: Int
    let email :String
    let first_name: String
    let last_name: String
    let avatar: String
}
