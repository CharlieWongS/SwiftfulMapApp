//
//  LocationListView.swift
//  SwiftfulMapApp
//
//  Created by Charlie Wong on 27-04-2025.
//

import SwiftUI

struct LocationListView: View {
    @EnvironmentObject private var viewModel: LocationsViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.locations) { location in
                Button {
                    viewModel.showNextLocation(location: location)
                } label: {
                    listRowView(location: location)
                }
                .padding(.vertical, 4)
                .listRowBackground(Color.clear)
            }
        }
        .listStyle(PlainListStyle())
    }
}

#Preview {
    LocationListView()
        .environmentObject(LocationsViewModel())
}


extension LocationListView {
    
    private func listRowView(location: Location) -> some View {
        HStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .cornerRadius(10)
                    
            }
            VStack(alignment: .leading) {
                Text(location.name)
                    .font(.headline)
                Text(location.cityName)
                    .font(.caption)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
        }
    }
}
