//
//  SwiftfulMapAppApp.swift
//  SwiftfulMapApp
//
//  Created by Charlie Wong on 24-04-2025.
//

import SwiftUI

@main
struct SwiftfulMapAppApp: App {
    
    @StateObject private var viewModel = LocationsViewModel()

    
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(viewModel)
        }
    }
}
