//
//  DetailsPublisher.swift
//  TravelApp
//
//  Created by Patryk Jastrzębski on 18/06/2023.
//

import Foundation

struct DetailsPublisher {
    var show: Bool
    var id: String
}

extension DetailsPublisher {
    static let idle = DetailsPublisher(show: false, id: "")
}
