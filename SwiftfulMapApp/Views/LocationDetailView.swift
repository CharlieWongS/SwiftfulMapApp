//
//  LocationDetailView.swift
//  SwiftfulMapApp
//
//  Created by Charlie Wong on 29-04-2025.
//

import SwiftUI
import MapKit

struct LocationDetailView: View {

    @EnvironmentObject private var viewModel: LocationsViewModel
    
    let location: Location
    
    var body: some View {
        ScrollView {
            VStack {
                imageSection
                    .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 5)
                VStack(alignment: .leading, spacing: 16) {
                    titleCection
                    Divider()
                    descriptionSection
                    Divider()
                    mapLayer
                }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                
                
            }
        }
        .ignoresSafeArea(.all)
        .background(.ultraThinMaterial)
        .overlay( backButton,alignment: .topLeading)
        
    }
}

#Preview {
    LocationDetailView(location: LocationsDataService.locations.first!)
        .environmentObject(LocationsViewModel())

    
}

extension LocationDetailView {
    private var imageSection: some View {
        TabView {
            ForEach(location.imageNames, id: \.self) {
                Image($0)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width)
                    .clipped()
            }
        }
        .frame(height:500)
        .tabViewStyle(PageTabViewStyle())
    }
    
    private var titleCection: some View {
        VStack(alignment: .leading) {
            Text(location.name)
                .font(.largeTitle)
                .fontWeight(.semibold)
            Text(location.cityName)
                .font(.title3)
                .foregroundStyle(.secondary)
        }
    }
    
    private var descriptionSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(location.description)
                .font(.subheadline)
                .foregroundStyle(.secondary)
            
            if let url = URL(string: location.link){
                Link("Read more on Wikipidia", destination: url)
                    .font(.headline)
                    .tint(.blue)
                
            }
        }
    }
    
    private var mapLayer: some View {
        Map() {
            Annotation(
                "\(location.name)",
                coordinate: location.coordinates) {
                    LocationMapAnnotationView()
                        .shadow(radius: 10)
                }
           
        }
        
        .allowsTightening(false)
        .aspectRatio(1, contentMode: .fit)
        .cornerRadius(30)
        

     }
    
    private var backButton: some View {
        Button {
            viewModel.sheetLocation = nil
        } label: {
            Image(systemName: "xmark")
                .font(.headline)
                .padding(16)
                .foregroundColor(.primary)
                .background(.thickMaterial)
                .cornerRadius(10)
                .shadow(radius: 4)
                .padding()
        }
    }
    
}
