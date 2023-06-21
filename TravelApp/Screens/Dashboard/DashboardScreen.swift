//
//  DashboardScreen.swift
//  TravelApp
//
//  Created by Patryk Jastrzębski on 11/06/2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct DashboardScreen: View {
    @StateObject var viewModel = DashboardViewModelImpl()
    var body: some View {
        VStack(spacing: 46) {
            if viewModel.isLoading(.data) {
                LoadingRing(isLoading: .constant(true))
            } else {
                NavigationView()
                DashboardScrollView()
                TripsScrollView()
                Spacer()
            }
        }
        .fullScreenCover(isPresented: $viewModel.tripDetailsPublisher.show) {
            TripDetailsScreen()
        }
        .environmentObject(viewModel)
    }
}

struct DashboardScreen_Previews: PreviewProvider {
    static var previews: some View {
        DashboardScreen()
    }
}
