//
//  Userable.swift
//  TravelApp
//
//  Created by Patryk Jastrzębski on 11/06/2023.
//

import Foundation

protocol Userable {
    var user: User? { get set }
    @MainActor func getUser()
    @MainActor func reloadUser()
}

extension Userable {
    @MainActor func getUser() {
        Task {
            await UserCache.shared.fetchUser()
        }
    }
    
    func reloadUser() {
        
    }
}
