//
//  User.swift
//  TestWork
//
//  Created by Владимир Повальский on 17.06.2022.
//

import Foundation

struct User: Codable {
    let phone: String
    let identifierId: String
    
    enum CodingKeys: String, CodingKey {
        case phone = "phone"
        case identifierId = "id"
    }
}
