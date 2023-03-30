//
//  ViewController.swift
//  NearMe
//
//  Created by Asadullah Behlim on 27/03/23.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    var locationManager: CLLocationManager?
    
    lazy var mapView: MKMapView = {
        let map = MKMapView()
       map.showsUserLocation = true
        map.translatesAutoresizingMaskIntoConstraints = false
        return map
    }()
    
    lazy var searchTextField: UITextField = {
        let searchTextField = UITextField()
        searchTextField.backgroundColor = UIColor.white
        searchTextField.placeholder = "Search"
        searchTextField.clipsToBounds = true
        searchTextField.layer.cornerRadius = 10
        searchTextField.leftView = UIView(frame: CGRect(x: 10, y: 10, width: 10, height: 10))  // For spacing In Text Typing
        searchTextField.leftViewMode = .always
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        return searchTextField
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Initialize Location Manager
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestWhenInUseAuthorization()
        locationManager?.requestAlwaysAuthorization()
        locationManager?.requestLocation()

    }
   private func setupUI() {
       view.addSubview(mapView)
       view.addSubview(searchTextField)
      // view.bringSubviewToFront(searchTextField)
       
       //add Constraints mapView
       mapView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
       mapView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
       mapView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
       mapView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
       
       // add constraints to searchfield
       searchTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
       searchTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
       searchTextField.widthAnchor.constraint(equalToConstant: view.bounds.size.width/1.2).isActive = true
       searchTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
       searchTextField.returnKeyType = .go
       
    }
    
    private func checkLocationAuthorization() {
        guard let locationManager = locationManager,
              let location = locationManager.location
        else { return }
        switch locationManager.authorizationStatus {
        case .authorizedAlways, .authorizedWhenInUse:
            let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
            mapView.setRegion(region, animated: true)
        case .denied:
            print("Location services has been denied")
        case .notDetermined, .restricted:
            print("Location cannot be determined or may be restricted")
        @unknown default:
            print("Unknown error. Unable to get location")
        }
        
    }


}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}

