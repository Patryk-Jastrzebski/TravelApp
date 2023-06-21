//
//  LoadingRing.swift
//  TravelApp
//
//  Created by Patryk Jastrzębski on 11/06/2023.
//

import SwiftUI

enum LoadingRingStyle {
    case blue
    
    var fillColor: Color {
        switch self {
        case .blue:
            return .blue
        }
    }
}

struct LoadingRing: View {
    @State private var fillPoint = 0.0
    @Binding var isLoading: Bool
    
    var radius: CGFloat = 24
    
    var animation: Animation {
        Animation.easeOut(duration: 1.25).repeatForever(autoreverses: false)
    }
    
    var style: LoadingRingStyle = .blue
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            if isLoading {
                Ring(fillPoint: fillPoint)
                    .stroke(style: StrokeStyle(lineWidth: 4, lineCap: .round))
                    .fill(style.fillColor)
                    .frame(width: radius, height: radius, alignment: .center)
                    .animation(isLoading ? animation : .default, value: fillPoint)
                    .onAppear {
                        fillPoint = 1.0
                    }
            } else {
                Color.clear
                    .frame(width: radius, height: radius, alignment: .center)
            }
        }
        .onChange(of: isLoading) { newValue in
            if !newValue {
                fillPoint = 0
            }
        }
    }
}

#if !TESTING
struct EmailCodeLoadingRing_Previews: PreviewProvider {
    
    static var previews: some View {
        LoadingRing(isLoading: .constant(true))
    }
}
#endif

private struct Ring: Shape {
    var lagAmount = 0.4
    var fillPoint: Double
    
    func path(in rect: CGRect) -> Path {
        
        let end = fillPoint * 360 + 1
        var start: Double
        
        if fillPoint > (1 - lagAmount) {
            start = 360 * (2 * fillPoint - 1.0)
        } else if fillPoint > lagAmount {
            start = 360 * (fillPoint - lagAmount)
        } else {
            start = 0
        }
        
        return Path { path in
            path.addArc(center: CGPoint(x: rect.size.width/2, y: rect.size.width/2),
                        radius: rect.size.width/2,
                        startAngle: Angle(degrees: start),
                        endAngle: Angle(degrees: end),
                        clockwise: false)
        }
    }
    
    var animatableData: Double {
        get { return fillPoint }
        set { fillPoint = newValue }
    }
}
