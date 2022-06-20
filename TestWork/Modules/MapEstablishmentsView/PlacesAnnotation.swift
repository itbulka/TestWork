//
//  PlacesAnnotation.swift
//  TestWork
//
//  Created by Владимир Повальский on 18.06.2022.
//

import Foundation

import UIKit
import MapKit

class PlacesAnnotation: NSObject, MKAnnotation {
    static let identifier = "PlacesAnnotation"
    
    var title: String?
    var coordinate: CLLocationCoordinate2D
    var info: String
    var id: String

    init(title: String, coordinate: CLLocationCoordinate2D, info: String, id: String) {
        self.title = title
        self.coordinate = coordinate
        self.info = info
        self.id = id
    }
}
