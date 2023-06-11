//
//  UserCache.swift
//  TravelApp
//
//  Created by Patryk Jastrzębski on 11/06/2023.
//

import Foundation

final class UserCache: ObservableObject {
    static let shared = UserCache()
    
    private let service = UserCacheServiceImpl()
    
    @Published var user: User?
    
    @MainActor func fetchUser() async {
        do {
            self.user = try await service.getUser()
        } catch {
            log(.error, .networkResponse, error)
        }
    }
}
