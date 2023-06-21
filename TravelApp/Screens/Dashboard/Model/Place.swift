//
//  Place.swift
//  TravelApp
//
//  Created by Patryk Jastrzębski on 17/06/2023.
//

import Foundation

struct Place: Codable, Equatable {
    let id: String
    let emoji: String
    let name: String
}

extension Place {
    static let mock = Place(id: "123", emoji: "0x1F680", name: "Paryż")
}
