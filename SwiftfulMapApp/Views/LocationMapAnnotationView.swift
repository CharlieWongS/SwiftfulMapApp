//
//  LocationMapAnnotationView.swift
//  SwiftfulMapApp
//
//  Created by Charlie Wong on 28-04-2025.
//

import SwiftUI

struct LocationMapAnnotationView: View {
    
    let accentColor = Color("AccentColor")
    
    var body: some View {
        VStack (spacing: 0.0){
            Image(systemName: "map.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                .padding(6)
                .background(accentColor)
                .cornerRadius(36)
            
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .foregroundStyle(accentColor)
                .frame(width: 10, height: 10)
                .rotationEffect(.degrees(180))
                .offset(y: -3)
                .padding(.bottom, 35)
        
        }
        
        
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea(edges: .all)
        LocationMapAnnotationView()
    }
}
