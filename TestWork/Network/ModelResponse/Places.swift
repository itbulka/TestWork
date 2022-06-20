//
//  Places.swift
//  TestWork
//
//  Created by Владимир Повальский on 17.06.2022.
//

import Foundation

struct Places: Codable, Identifiable {
    var id = UUID()
    
    let image: String
    let name: String
    let idPlaces: String
    let latitide: Float
    let desc: String
    let longitude: Float
    
    enum CodingKeys: String, CodingKey {
        case image = "image"
        case name = "name"
        case idPlaces = "id"
        case latitide = "latitide"
        case desc = "desc"
        case longitude = "longitude"
    }
}
