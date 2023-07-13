//
//  UsersResponse.swift
//  Project101
//
//  Created by Muhideen Mujeeb Adeoye on 14/07/2023.
//

struct UsersResponse: Codable {
    let page, perPage, total, totalPage: Int
    let data: [User]
    let support: Support
}
