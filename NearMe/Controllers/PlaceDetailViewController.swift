//
//  PlaceDetailViewController.swift
//  NearMe
//
//  Created by Asadullah Behlim on 03/04/23.
//

import Foundation
import UIKit

class PlaceDetailViewController: UIViewController {
    
    let place : PlaceAnnotation
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var addressLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = .bitWidth
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .body)
        return label
    }()
    
    lazy var directionsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Directions", for: .normal)
        button.configuration = UIButton.Configuration.bordered()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var callButton: UIButton = {
        let button = UIButton()
        button.setTitle("Call", for: .normal)
        button.configuration = UIButton.Configuration.bordered()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    init(place: PlaceAnnotation) {
        self.place = place
        super.init(nibName: nil, bundle: nil)
        setupUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    }
   
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func directionsButtonTapped(_ sender : UIButton) {
        let coordinate = place.location.coordinate
       guard let url = URL(string: "http://maps.apple.com/?daddr=\(coordinate.latitude),\(coordinate.longitude)")
        else { return}
        UIApplication.shared.open(url)
        
    }
    
    
    private func setupUI() {
        let stackView = UIStackView()
        
        stackView.alignment = .leading
        stackView.axis = .vertical
        stackView.spacing = UIStackView.spacingUseSystem
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
        
        nameLabel.text = place.name
        nameLabel.widthAnchor.constraint(equalToConstant: view.bounds.height - 20).isActive = true
        
        addressLabel.text = place.address
        addressLabel.widthAnchor.constraint(equalToConstant: view.bounds.height - 5).isActive = true
        
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(addressLabel)
        view.addSubview(stackView)
        
        let contactStackView = UIStackView()

        contactStackView.translatesAutoresizingMaskIntoConstraints = false
        contactStackView.axis = .horizontal
        contactStackView.spacing = UIStackView.spacingUseSystem
        
        directionsButton.addTarget(self, action: #selector(directionsButtonTapped), for: .touchUpInside)
        
        contactStackView.addArrangedSubview(directionsButton)
        contactStackView.addArrangedSubview(callButton)
        stackView.addArrangedSubview(contactStackView)

    }

    
}

