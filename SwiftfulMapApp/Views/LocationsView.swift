//
//  LocationsView.swift
//  SwiftfulMapApp
//
//  Created by Charlie Wong on 26-04-2025.
//

import SwiftUI
import MapKit



struct LocationsView: View {
    
//    @StateObject private var viewModel = LocationsViewModel()
    @EnvironmentObject private var viewModel: LocationsViewModel

    
    var body: some View {
        ZStack {
            
            mapLayer
            .mapStyle(.hybrid)
             
            VStack(spacing: 0) {
                header
                    .padding(.horizontal)
                Spacer()
                locationsPreviewStack
            }
        }
        .sheet(item: $viewModel.sheetLocation, onDismiss: nil) { location in
            LocationDetailView(location: location)
        }
    }
}

#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}

extension LocationsView {
    
    
    private var header: some View {
        VStack {
            Button(action: viewModel.toggleLocationList){
                Text(viewModel.mapLocation.name + ", " + viewModel.mapLocation.cityName)
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundStyle(.black)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .animation(.none, value: viewModel.locations)
                    .overlay(alignment: .leading) {
                        Image(systemName: "chevron.compact.down")
                            .font(.headline)
                            .foregroundColor(.primary)
                            .padding()
                            .rotationEffect(Angle(degrees: viewModel.showLocationList ? 180 : 0))
            }
                }
            if viewModel.showLocationList {
                LocationListView()
            }
            
        }
        .background(.thickMaterial)
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.25), radius: 5, x: 0, y: 5)
    }
    
    private var mapLayer: some View {
        Map(position: $viewModel.camera) {
//                Annotation(
//                    "\(viewModel.mapLocation.name)",
//                    coordinate: viewModel.mapLocation.coordinates) { LocationMapAnnotationView()
//                    }
            
//                Marker(
//                    viewModel.mapLocation.name,
//                    coordinate: viewModel.mapLocation.coordinates
//                )
//                .tint(.red)
            
            
            ForEach(viewModel.locations) { location in
                Annotation(
                    location.name,
                    coordinate: location.coordinates
                ) {
                    LocationMapAnnotationView()
                        .scaleEffect(viewModel.mapLocation == location ? 1 : 0.7)
                        .shadow(radius: 10)
                        .onTapGesture {
                            viewModel.showNextLocation(location: location)
                        }
                }
            }
        }
     }
    
    private var locationsPreviewStack: some View {
        ZStack {
            ForEach(viewModel.locations) { location in
                if viewModel.mapLocation == location {
                    LocationPreviewView(location: location)
                        .shadow(color: .black.opacity(0.25), radius: 5, x: 0, y: 10)
                        .padding()
                        .transition(
                            .asymmetric(
                                insertion: .move(edge: .trailing),
                                removal: .move(edge: .leading))
                        )
                }
               
            }
        }
    }
}
