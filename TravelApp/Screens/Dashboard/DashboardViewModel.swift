//
//  DashboardScreen.swift
//  TravelApp
//
//  Created by Patryk Jastrzębski on 11/06/2023.
//

import Foundation
import Combine

final class DashboardViewModelImpl: ObservableObject,
                                    ComplexViewModel,
                                    Userable {
    
    enum DashboardDataType {
        case user
        case data
    }
    
    // MARK: - complexViewModel
    typealias DataType = DashboardDataType
    @Published var complexViewModelData: [DataType: ComplexViewModelData] = [.data: .init(""),
                                                                             .user: .init("")]
    @Published var storyOffSet = CGFloat()
    @Published var tripOffSet = CGFloat()
    @Published var dashboardData: DashboardModel?
    @Published var user: User?
    @Published var tripDetailsPublisher: DetailsPublisher = .idle
    
    private let service: DashboardService
    var cancellables = Set<AnyCancellable>()
    
    init(service: DashboardService = DashboardServiceImpl()) {
        self.service = service
        setupUserableBindings()
        setupInitData()
    }
    
    // MARK: - fileprivate methods
    fileprivate func setupInitData() {
        Task {
            await getUser()
        }
    }
    
    @MainActor func getUser() async {
        setLoadingState(true, for: .data, animated: false)
        do {
            async let user: () = reloadUser()
            async let places: () = getPlaces()
            
            _ = try await (user, places)
        } catch AppErrors.apiError(_, let data) {
            handleError(data?.getErrorMessage(), type: .data)
        } catch {
            handleError(nil, type: .data)
        }
        setLoadingState(false, for: .data)
    }
    
    @MainActor
    fileprivate func getPlaces() async throws {
        try await dashboardData = service.getPlaces()
    }
    
    func itemOpacity(item: Int, offset: CGFloat) -> Double {
        let neededOffset = DashboardConstants.PlacesList.minimalOffSetForOpacity(item: item)
        
        if offset > neededOffset {
            let maxOffSet = neededOffset + DashboardConstants.PlacesList.fadeOutOffset
            let currentValue =  offset - neededOffset
            let max = maxOffSet - neededOffset
            let result = 1 - (currentValue / max)
            if result > 0 && result < 1 {
                return result
            }
            return 0
        }
        return 1
        
    }
    
    func itemBlur(item: Int, offset: CGFloat) -> Double {
        let neededOffset = DashboardConstants.PlacesList.minimalOffSetForOpacity(item: item)
        if offset > neededOffset {
            let maxOffSet = neededOffset + DashboardConstants.PlacesList.fadeOutOffset
            let currentValue =  offset - neededOffset
            let max = maxOffSet - neededOffset
            let result = abs(currentValue / max) * 2
            if result > 0 && result < 1 {
                return result
            }
            return 2
        }
        return 0
    }
}
