//
//  DashboardScreen.swift
//  TravelApp
//
//  Created by Patryk Jastrzębski on 11/06/2023.
//

import Foundation

protocol DashboardViewModel: ObservableObject {
    
}

final class DashboardViewModelImpl: DashboardViewModel,
                                    ComplexViewModel,
                                    Userable {
    
    // MARK: - complexViewModel
    typealias DataType = DashboardDataType
    @Published var complexViewModelData: [DataType: ComplexViewModelData] = [.data : .init(""),
                                                                             .user : .init("")]
    
    enum DashboardDataType {
        case user
        case data
    }
    
    @Published var user: User?
}
