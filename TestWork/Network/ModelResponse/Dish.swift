//
//  Menu.swift
//  TestWork
//
//  Created by Владимир Повальский on 19.06.2022.
//

import Foundation

struct Dish: Codable {
    let image: String
    let price: Float
    let name: String
    let weight: Float
    let idMenu: String
    let desc: String
    
    enum CodingKeys: String, CodingKey {
        case image = "image"
        case price = "price"
        case name = "name"
        case weight = "weight"
        case idMenu = "id"
        case desc = "desc"
    }
}
