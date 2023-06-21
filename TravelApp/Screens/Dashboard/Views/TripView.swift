//
//  TripView.swift
//  TravelApp
//
//  Created by Patryk Jastrzębski on 18/06/2023.
//

import SwiftUI

struct TripView: View {
    let trip: Trip
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            CustomWebImage(url: trip.imageUrl, contentMode: .fill, size: 130)
                .cornerRadius(10)
            HStack {
                Text(trip.name)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(trip.rating)
                    .font(.footnote)
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                    .font(.caption2)
            }
            HStack(spacing: 2) {
                Image(Asset.Icons.locationPin.name)
                    .resizable()
                    .frame(width: 14, height: 14)
                Text(trip.country)
                    .font(.caption)
                    .fontWeight(.semibold)
            }
            .foregroundColor(.blue)
        }
    }
}

struct TripView_Previews: PreviewProvider {
    static var previews: some View {
        TripView(trip: .mock)
    }
}
