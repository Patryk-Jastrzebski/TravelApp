//
//  TripDetailsScreen.swift
//  TravelApp
//
//  Created by Patryk Jastrzębski on 18/06/2023.
//

import SwiftUI
import MapKit

struct TripDetailsScreen: View {
    @SwiftUI.Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            map
            closeButton
        }
    }
    
    private var closeButton: some View {
        VStack {
            CloseButton { dismiss() }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding()
            Spacer()
        }
    }
    
    private var map: some View {
        VStack {
            Map(coordinateRegion: .constant(MKCoordinateRegion(center: .init(latitude: 51.501, longitude: -0.141),
                                                               latitudinalMeters: 2,
                                                               longitudinalMeters: 300)))
            .ignoresSafeArea()
            .frame(height: 300)
            Spacer()
        }
    }
}

struct TripDetailsScreen_Previews: PreviewProvider {
    static var previews: some View {
        TripDetailsScreen()
    }
}
