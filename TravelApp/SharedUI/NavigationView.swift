//
//  NavigationView.swift
//  TravelApp
//
//  Created by Patryk Jastrzębski on 11/06/2023.
//

import SwiftUI

struct NavigationView: View {
    @EnvironmentObject var viewModel: DashboardViewModelImpl
    var body: some View {
        HStack(spacing: 12) {
            profileButton
            userName
            searchButton
        }
        .padding(.horizontal)
        .padding(.top, 12)
        .animation(.defaultSpring, value: viewModel.user)
    }
    
    private var searchBox: some View {
        LoadingShape()
    }
    
    private var userName: some View {
        HStack(spacing: 6) {
            Text("Cześć,")
                .font(.title2)
                .fontWeight(.semibold)
            Group {
                if let name = viewModel.user?.name {
                    Text(name)
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                } else {
                    LoadingShape()
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var profileButton: some View {
        Button {
            
        } label: {
            if let avatar = viewModel.user?.avatar {
                CustomWebImage(url: avatar,
                               contentMode: .fill)
                .frame(width: 26, height: 26)
                .cornerRadius(20)
                .shadow(color: .black.opacity(0.25),
                        radius: 4,
                        x: 0,
                        y: 1)
            }
        }
    }
    
    private var searchButton: some View {
        Button {
            
        } label: {
            Image(systemName: "magnifyingglass")
                .font(.title2)
                .tint(.primary)
        }
    }
}

struct NavigationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView()
            .environmentObject(DashboardViewModelImpl())
    }
}
