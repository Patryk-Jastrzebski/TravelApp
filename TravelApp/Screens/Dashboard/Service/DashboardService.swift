//
//  DashboardService.swift
//  TravelApp
//
//  Created by Patryk Jastrzębski on 17/06/2023.
//

import Foundation

protocol DashboardService {
    func getPlaces() async throws -> DashboardModel
}

final class DashboardServiceImpl: BaseNetworking, DashboardService {
    func getPlaces() async throws -> DashboardModel {
        let request = HttpRequest(url: getBaseUrlWithVersion(.blank, with: .place),
                                  method: .get)
        return try await perform(request)
    }
}
