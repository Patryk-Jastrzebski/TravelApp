//
//  DashboardResponse.swift
//  TravelApp
//
//  Created by Patryk Jastrzębski on 18/06/2023.
//

import Foundation

struct DashboardModel: Codable {
    let storyDashboard: [Place]
    let hotTrips: [Trip]
}
