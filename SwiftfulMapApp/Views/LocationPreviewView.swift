//
//  LocationPreviewView.swift
//  SwiftfulMapApp
//
//  Created by Charlie Wong on 27-04-2025.
//

import SwiftUI

struct LocationPreviewView: View {
    
    @EnvironmentObject var viewModel: LocationsViewModel
    let location: Location
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 0.0) {
            VStack(alignment: .leading, spacing: 16.0) {
                imageSection
                titleSection
            }
            
            VStack(spacing: 8.0) {
                learnMoreButton
                nextButton
            }
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.ultraThinMaterial)
                .offset(y: 65)
        )
        .cornerRadius(10)
//        .padding()
    }
}

#Preview {
    ZStack {
        Color.green.ignoresSafeArea(edges: .all)
        LocationPreviewView(location: LocationsDataService.locations.first!)
            .padding()
    }
    .environmentObject(LocationsViewModel())
    
}

extension LocationPreviewView {
    
    private var imageSection: some View {
        ZStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10.0)
                    
            }
        }
        .padding(6)
        .background(Color.white)
        .cornerRadius(10.0)
    }
    
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(location.name)
                .font(.title2)
                .fontWeight(.bold)
            Text(location.cityName)
                .font(.subheadline)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        
    }
    
    private var learnMoreButton: some View {
        Button {
            viewModel.sheetLocation = location
        } label: {
            Text("Learn More")
                .font(.headline)
                .frame(width: 125, height: 35)
        }
        .buttonStyle(.borderedProminent)

    }
    
    private var nextButton: some View {
        Button {
            viewModel.nextButtonPressed()
        } label: {
            Text("Next")
                .font(.headline)
                .frame(width: 125, height: 35)
        }
        .buttonStyle(.bordered)
    }
}
