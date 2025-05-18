//
//  LocationsViewModel.swift
//  SwiftfulMapApp
//
//  Created by Charlie Wong on 26-04-2025.
//

import Foundation
import MapKit
import SwiftUI

class LocationsViewModel: ObservableObject {
    
    // All loaded locations
    @Published var locations: [Location] = []
    
    // Current location on map
    @Published var mapLocation: Location {
        didSet {
            updateMapRegion(location: mapLocation)
            camera = .region(mapRegion)
        }
    }
    
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    
    // Show list of locations
    @Published var showLocationList: Bool = false
    
    @Published var camera: MapCameraPosition = .automatic
    
    // Show location detail via sheet
    @Published var sheetLocation: Location? = nil

    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
  
            
        
        self.updateMapRegion(location: locations.first!)
    }
    private func updateMapRegion(location: Location) {
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(
                center: location.coordinates,
                span: mapSpan
                )
        }
        
    }
    
    func toggleLocationList() {
        withAnimation (.easeInOut) {
            showLocationList.toggle()
        }
    }
    
    func showNextLocation(location: Location) {
        withAnimation(.easeInOut) {
            mapLocation = location
            showLocationList = false
        }
    }
    
    func nextButtonPressed() {
        
        // Get the current index
//        let currentIndex = locations.firstIndex {location in
//                return location == mapLocation
//        }
        
        guard let currentIndex = locations.firstIndex(where: { $0 == mapLocation }) else {
            print("Couldn't find current index in location array! Should never happen.")
            return
        }
        
        let nextIndex = (currentIndex + 1) % locations.count
        let nextLocation = locations[nextIndex]
        showNextLocation(location: nextLocation)
        // Check if the current index is vaild
//        let nextIndex = currentIndex + 1
//        guard locations.indices.contains(nextIndex) else {
            // Next index is NOT valid
            // restart from 0
//            guard let firstLocation = locations.first else {return}
//            showNextLocation(location: firstLocation)
//            return
//        }
        
        // Next index IS valid
//        let nextLocation = locations[nextIndex]
//        showNextLocation(location: nextLocation)
    }
}
