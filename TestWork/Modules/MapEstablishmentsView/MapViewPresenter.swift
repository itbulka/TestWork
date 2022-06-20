//
//  MapViewPresenter.swift
//  TestWork
//
//  Created by Владимир Повальский on 18.06.2022.
//

import Foundation
import MapKit

protocol MapViewPresenterProtocol {
    var menuList: [Dish] { get set }
    func getPlacesForAnnotation()
    func getMenuPlace(_ idPlace: String, completion: @escaping ([Dish]) -> Void)
}

class MapViewPresenter: MapViewPresenterProtocol {

    weak var viewConrtoller: MapViewController?
    
    var menuList: [Dish] = [Dish]()
    
    init(_ viewConrtoller: MapViewController? = nil) {
        self.viewConrtoller = viewConrtoller
        
    }
    
    private func addAnnotation(_ places: [Places]) {
        for item in places {
            let place = PlacesAnnotation(title: item.name, coordinate: CLLocationCoordinate2D(latitude: CLLocationDegrees(item.latitide), longitude: CLLocationDegrees(item.longitude)), info: item.desc, id: item.idPlaces)
                viewConrtoller?.addAnnotationPlaces(place)
        }
    }
    
    func getPlacesForAnnotation() {
        NetworkManager.shared.request(method: "GET", endpoint: "getPlaces") { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                if let data = data {
                    guard let places = data.decode([Places].self) else { return }
                    
                    self.addAnnotation(places)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getMenuPlace(_ idPlace: String, completion: @escaping ([Dish]) -> Void) {
        let parameters: NetworkManager.Parameters = [
            "place_id": idPlace
        ]
        
        NetworkManager.shared.request(parameters: parameters, method: "POST", endpoint: "getMenu") { result in
            switch result {
            case .success(let data):
                if let data = data {
                    guard let menu = data.decode([Dish].self) else { return }
                    completion(menu)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
}
