//
//  DashboardConstants.swift
//  TravelApp
//
//  Created by Patryk Jastrzębski on 17/06/2023.
//

import Foundation

struct DashboardConstants {
    enum PlacesList {
        static let itemWidth: CGFloat = 70
        static let horizontalSpacing: CGFloat = 12
        static let itemsIntermittentSpacing: CGFloat = 18
        static let fadeOutOffset: CGFloat = (itemWidth / 2) + (itemsIntermittentSpacing / 2)
        
        static func minimalOffSetForOpacity(item: Int) -> CGFloat {
            return (itemWidth + itemsIntermittentSpacing) * CGFloat(item)
        }
    }
}
