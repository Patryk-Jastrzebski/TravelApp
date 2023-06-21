//
//  TripsScrollView.swift
//  TravelApp
//
//  Created by Patryk Jastrzębski on 18/06/2023.
//

import SwiftUI

struct TripsScrollView: View {
    @EnvironmentObject var viewModel: DashboardViewModelImpl
    var body: some View {
        VStack {
            HStack {
                Text("Najgorętsze tego sezonu")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.title3)
                    
                Text("wszystko")
                    .font(.footnote)
                    .foregroundColor(.blue)
            }
            .padding(.horizontal, 12)
            .padding(.bottom, 12)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 18) {
                    if let trips = viewModel.dashboardData?.hotTrips {
                        ForEach(trips, id: \.hashValue) { trip in
                            TripView(trip: trip)
                                .onTapGesture {
                                    viewModel.tripDetailsPublisher.id = trip.id
                                    viewModel.tripDetailsPublisher.show = true
                                }
                        }
                        
                    }
                }
                .padding(.leading, 12)
            }
        }
    }
}

struct TripsScrollView_Previews: PreviewProvider {
    static var previews: some View {
        TripsScrollView()
            .environmentObject(DashboardViewModelImpl())
    }
}
