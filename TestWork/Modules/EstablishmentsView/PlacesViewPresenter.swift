//
//  PlacesViewPresenter.swift
//  TestWork
//
//  Created by Владимир Повальский on 17.06.2022.
//

import Foundation

protocol PlacesViewPresenterProtocol {
    var places: [Places] { get set }
    func getPlaces()
}

class PlacesViewPresenter: PlacesViewPresenterProtocol {
    
    weak var placesViewConrtoller: PlacesViewController?
    
    var places: [Places] = [Places]()
    
    init(_ placesViewConrtoller: PlacesViewController? = nil) {
        self.placesViewConrtoller = placesViewConrtoller
    }
    
    func getPlaces() {
        NetworkManager.shared.request(method: "GET", endpoint: "getPlaces") { result in
            switch result {
            case .success(let data):
                if let data = data {
                    if let result = data.decode([Places].self) {
                        DispatchQueue.main.async {
                            self.places = result
                            self.placesViewConrtoller?.reloadData()
                        }
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
