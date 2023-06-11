//
//  DashboardScreen.swift
//  TravelApp
//
//  Created by Patryk Jastrzębski on 11/06/2023.
//

import SwiftUI

struct DashboardScreen: View {
    @StateObject var viewModel = DashboardViewModelImpl()
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//        Text(viewModel.user?.name ?? "")
            .task {
                viewModel.getUser()
            }
    }
}

struct DashboardScreen_Previews: PreviewProvider {
    static var previews: some View {
        DashboardScreen()
    }
}
