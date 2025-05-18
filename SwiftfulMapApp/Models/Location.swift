//
//  Location.swift
//  SwiftfulMapApp
//
//  Created by Charlie Wong on 26-04-2025.
//

import Foundation
import MapKit

struct Location: Identifiable , Equatable{
//    let id = UUID().uuidString
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
    
    //Identifiable
    var id: String{
//        name = "Colosseum"
//        cityName = "Rome"
//        id = "Colosseum"
        name + cityName
    }
    
    
    // Equatable
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
    
}

