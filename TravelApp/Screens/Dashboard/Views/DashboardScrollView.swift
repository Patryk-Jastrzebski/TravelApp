//
//  DashboardScrollView.swift
//  TravelApp
//
//  Created by Patryk Jastrzębski on 17/06/2023.
//

import SwiftUI

struct DashboardScrollView: View {
    @EnvironmentObject var viewModel: DashboardViewModelImpl
    var body: some View {
        ZStack(alignment: .leading) {
            TrackableScrollView(.horizontal, showIndicators: false, contentOffset: $viewModel.storyOffSet) {
                HStack(alignment: .top, spacing: 18) {
                    if let story = viewModel.dashboardData?.storyDashboard {
                        ForEach(Array(story.enumerated()), id: \.0) { index, place in
                            IconCircleView(imageFrameSize: 70, place: place)
                                .opacity(viewModel.itemOpacity(item: index, offset: viewModel.storyOffSet))
                                .blur(radius: viewModel.itemBlur(item: index, offset: viewModel.storyOffSet))
                        }
                    }
                }
                .padding(.leading, 24)
            }
        }
    }
    
    private var loadingShapes: some View {
        HStack(spacing: 18) {
            ForEach(1...6, id: \.self) { _ in
                LoadingShape(style: .circle, size: 70)
            }
        }
    }
}

struct DashboardScrollView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardScrollView()
            .environmentObject(DashboardViewModelImpl())
    }
}
