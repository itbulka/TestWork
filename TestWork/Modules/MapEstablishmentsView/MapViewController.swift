//
//  MapViewController.swift
//  TestWork
//
//  Created by Владимир Повальский on 15.06.2022.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    private var presenter: MapViewPresenterProtocol!
    
    private var mapView: MKMapView = {
        var map = MKMapView()
        map.layer.cornerRadius = 25
        map.translatesAutoresizingMaskIntoConstraints = false
        return map
    }()
    
    
        //MARK: Life cycle
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationController?.navigationBar.prefersLargeTitles = true
        title = "Карта заведений"
        
        view.addSubview(mapView)
        
        mapView.delegate = self
        
        presenter = MapViewPresenter(self)
        presenter.getPlacesForAnnotation()
                
    }
    
    override func viewWillLayoutSubviews() {
        layoutMapView()
    }
    
    private func layoutMapView() {
        NSLayoutConstraint.activate([
            mapView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            mapView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            mapView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200)
        ])
    }
    
        //MARK: Methods for worked
    
    
    func addAnnotationPlaces(_ placesAnnotation: PlacesAnnotation) {
        mapView.addAnnotation(placesAnnotation)
    }
    
}

extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        guard annotation is PlacesAnnotation else { return nil }

        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: PlacesAnnotation.identifier)

        if annotationView == nil {
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: PlacesAnnotation.identifier)
            annotationView?.canShowCallout = true

            let btn = UIButton(type: .detailDisclosure)
            annotationView?.rightCalloutAccessoryView = btn
        } else {
            annotationView?.annotation = annotation
        }

        return annotationView
    }

    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let placesAnnotation = view.annotation as? PlacesAnnotation else { return }
        
        presenter.getMenuPlace(placesAnnotation.id) { [weak self] menuList in
            guard let self = self else { return }
            DispatchQueue.main.async {
                let menuVC = MenuPlaceViewController()
                menuVC.menuList = menuList
                self.present(menuVC, animated: true)
            }        
        }
    }
}
