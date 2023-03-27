//
//  ViewController.swift
//  NearMe
//
//  Created by Asadullah Behlim on 27/03/23.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    lazy var mapView: MKMapView = {
        let map = MKMapView()
      //  map.showsUserLocation = true
        map.translatesAutoresizingMaskIntoConstraints = false
        return map
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

    }
   private func setupUI() {
       view.addSubview(mapView)
       
       //add Constraints mapView
       mapView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
       mapView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
       mapView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
       mapView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
       
    }


}

