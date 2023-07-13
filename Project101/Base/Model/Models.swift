//
//  Models.swift
//  Project101
//
//  Created by Muhideen Mujeeb Adeoye on 14/07/2023.
//

struct User: Codable {
    let id: Int
    let email, firstName, lastName: String
    let avatar: String
}

struct Support: Codable {
    let url: String
    let text: String
}

