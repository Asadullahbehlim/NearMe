//
//  String+Extensions.swift
//  NearMe
//
//  Created by Asadullah Behlim on 03/04/23.
//

import Foundation
import UIKit

extension String {
    
    var formatPhoneCall: String {
        self.replacingOccurrences(of: " ", with: "")
        self.replacingOccurrences(of: "+", with: "")
        self.replacingOccurrences(of: "(", with: "")
        self.replacingOccurrences(of: ")", with: "")
        self.replacingOccurrences(of: "-", with: "")

    }
}
