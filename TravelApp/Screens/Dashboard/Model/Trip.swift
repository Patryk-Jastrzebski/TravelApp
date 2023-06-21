//
//  Trip.swift
//  TravelApp
//
//  Created by Patryk Jastrzębski on 18/06/2023.
//

import Foundation

struct Trip: Codable, Hashable {
    let id: String
    let imageUrl: String
    let name: String
    let country: String
    let rating: String
}

extension Trip {
    static let mock = Trip(id: "123",
                           imageUrl: "https://ocdn.eu/images/pulscms/MDM7MDA_/6c494462146b81d3db57c2c0710c9ec4.jpg",
                           name: "Madera",
                           country: "Portugalia",
                           rating: "1.4")
}
